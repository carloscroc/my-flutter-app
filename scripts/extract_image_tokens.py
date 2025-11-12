#!/usr/bin/env python3
"""Extract dominant colors and detect card-like light surfaces from an image.

Usage: python scripts/extract_image_tokens.py <image-path>

Outputs a JSON file next to the image with palette and detected rectangles.
"""
import sys
from PIL import Image
import numpy as np
import json
import os


def hex_of(rgb):
    return '#%02x%02x%02x' % tuple(int(c) for c in rgb)


def extract_palette(img, n_colors=8):
    # Use Pillow's adaptive palette quantization
    small = img.convert('RGBA')
    pal = small.convert('P', palette=Image.ADAPTIVE, colors=n_colors)
    palette = pal.getpalette()[:n_colors*3]
    colors = [tuple(palette[i:i+3]) for i in range(0, len(palette), 3)]
    # get frequency of each palette index
    data = np.array(pal)
    # convert pal back to indexes
    indexes = np.array(small.convert('RGB').convert('P', palette=Image.ADAPTIVE, colors=n_colors))
    # above conversion returns an image; instead compute histogram via quantize
    q = img.convert('P', palette=Image.ADAPTIVE, colors=n_colors)
    hist = q.histogram()
    # return list of (color, count)
    return colors, hist


def detect_color_regions(img, palette_colors, hist, min_area=1500, top_n=4):
    # Find regions for the top N palette colors by frequency
    q = img.convert('P', palette=Image.ADAPTIVE, colors=len(palette_colors))
    idx = np.array(q)
    h, w = idx.shape
    rects = []

    # pick top palette indices
    counts = list(enumerate(hist))
    counts.sort(key=lambda x: x[1], reverse=True)
    top = [i for i,_ in counts[:top_n]]

    for pal_index in top:
        mask = idx == pal_index
        visited = np.zeros_like(mask, dtype=bool)
        for y in range(h):
            for x in range(w):
                if mask[y, x] and not visited[y, x]:
                    stack = [(x, y)]
                    xs = []
                    ys = []
                    visited[y, x] = True
                    while stack:
                        cx, cy = stack.pop()
                        xs.append(cx); ys.append(cy)
                        for nx, ny in ((cx+1,cy),(cx-1,cy),(cx,cy+1),(cx,cy-1)):
                            if 0 <= nx < w and 0 <= ny < h and not visited[ny, nx] and mask[ny, nx]:
                                visited[ny, nx] = True
                                stack.append((nx, ny))
                    minx = min(xs); maxx = max(xs)
                    miny = min(ys); maxy = max(ys)
                    area = (maxx-minx+1) * (maxy-miny+1)
                    if area >= min_area:
                        rects.append({'palette_index': int(pal_index), 'x': int(minx), 'y': int(miny), 'w': int(maxx-minx+1), 'h': int(maxy-miny+1), 'area': int(area)})
    return rects


def nearest_color(target, palette):
    t = np.array(target)
    p = np.array(palette)
    d = ((p - t) ** 2).sum(axis=1)
    return int(d.argmin())


def main():
    if len(sys.argv) < 2:
        print('Usage: python extract_image_tokens.py <image-path>')
        sys.exit(1)
    path = sys.argv[1]
    img = Image.open(path)
    # downscale if too large for speed
    maxw = 1600
    if img.width > maxw:
        ratio = maxw / img.width
        img = img.resize((maxw, int(img.height * ratio)), Image.LANCZOS)

    colors, hist = extract_palette(img, n_colors=8)
    hex_colors = [hex_of(c) for c in colors]

    rects = detect_color_regions(img, colors, hist, min_area=1200, top_n=6)

    # Calculate median card size and spacing heuristics
    widths = [r['w'] for r in rects]
    heights = [r['h'] for r in rects]
    xs = [r['x'] for r in rects]
    ys = [r['y'] for r in rects]

    def median(lst):
        if not lst: return None
        a = sorted(lst)
        n = len(a)
        return a[n//2]

    stats = {
        'detected_rect_count': len(rects),
        'median_width': median(widths),
        'median_height': median(heights),
        'median_x': median(xs),
        'median_y': median(ys),
    }

    # Map palette to friendly roles by heuristics
    # pick brightest as white/background, darkest as dark text, most saturated teal-like as primary accent
    hsvs = [tuple(Image.new('RGB', (1,1), c).convert('HSV').getpixel((0,0))) for c in colors]

    # compute spacing heuristics for mid-size rects
    mid_rects = [r for r in rects if 2000 <= r['area'] <= 20000]
    # sort by y then x
    mid_rects_sorted = sorted(mid_rects, key=lambda r: (r['y'], r['x']))
    v_gaps = []
    h_gaps = []
    for i in range(1, len(mid_rects_sorted)):
        prev = mid_rects_sorted[i-1]
        cur = mid_rects_sorted[i]
        # vertical gap
        v = cur['y'] - (prev['y'] + prev['h'])
        if v > 0:
            v_gaps.append(v)
        # horizontal gap if on same row (y within 10px)
        if abs(cur['y'] - prev['y']) <= 12:
            h = cur['x'] - (prev['x'] + prev['w'])
            if h > 0:
                h_gaps.append(h)

    spacing = {
        'vertical_gaps': v_gaps,
        'horizontal_gaps': h_gaps,
        'median_vertical_gap': median(v_gaps) if v_gaps else None,
        'median_horizontal_gap': median(h_gaps) if h_gaps else None,
    }

    out = {
        'source': os.path.abspath(path),
        'image_size': {'w': img.width, 'h': img.height},
        'palette': [{'rgb': list(c), 'hex': hex_of(c)} for c in colors],
        'rects': rects,
        'stats': stats,
        'spacing': spacing,
    }

    out_path = os.path.splitext(path)[0] + '.tokens.json'
    with open(out_path, 'w', encoding='utf-8') as f:
        json.dump(out, f, indent=2)
    print('Wrote:', out_path)


if __name__ == '__main__':
    main()
