## Pondering (Expanded)

<pondering>
The set of reference screens reads as a high-contrast, premium finance app that favors depth, minimalism, and a focused accent color. The overall feeling is confident and calm — dark, soft surfaces create a private / secure atmosphere while the neon-yellow accent injects energy and draws attention to balances, key actions, and micrographs. The UI uses rounded cards, soft shadows, and subtle glassmorphism (frosted, translucent surfaces) to convey depth without noisy textures. Typography is clean and modern, leaning on geometric humanist sans weights that balance readability and style.

How To Leverage:
- Use dark surfaces as the primary canvas to create perceived security and focus. Reserve the bright yellow accent for primary financial numbers, key calls-to-action, and data visualization highlights so the eye is immediately drawn to meaningful information.
- Implement glassmorphism (backdrop blur + low-opacity white overlay) only on prominent chrome like the bottom navigation pill and top-profile cards; avoid overusing blur on dense reading surfaces to maintain legibility and performance.
- When composing screens, prioritize numeric clarity: large, high-weighted numbers for balances, medium-weight text for descriptors, and muted gray for secondary metadata. This hierarchy should be consistent across all account/asset screens.

Philosophy:
- Less is more: the UI should remove noise and let financial signals stand out. Design decisions should always aim to reduce ambiguity — is this actionable? Is this important? If not, downgrade its visual priority.
- Trust through restraint: muted surfaces, consistent spacing, and gentle motion communicate reliability. The accent color is for signal, not decoration; treat it as the app's 'voice' rather than an ornament.
- Accessibility first: ensure the accent and type scales meet accessibility needs. If a bright yellow fails contrast checks in a context, switch to a high-contrast alternative rather than increasing saturation indiscriminately.
</pondering>

---

## Pondering (Navigation Focus – Expanded)

<pondering>
The primary interaction pattern is the bottom navigation: a floating, centered pill with an emphasized circular primary action in the middle. The pill's slight translucency and heavy blur helps it sit visually on top of content without fully obscuring it; this creates a sense of continuity between content and controls.

How To Leverage:
- Treat the center button as the feature-flag of the app: it should perform the app's most common or highest-value action (e.g., quick transaction, add funds). Keep its interaction simple: single tap for the main action; long press for a quick action menu.
- Keep the pill minimal: up to 4 peripheral icons plus the center action. Avoid nesting deep interactions inside the pill — keep deeper flows in full screens or modal sheets.
- Respect safe areas and edge gestures: ensure the pill floats above the device's home indicator and doesn't intercept system gestures. Provide an optional docked alternative for tablet/large-screen layouts.

Philosophy:
- Visual hierarchy by elevation: the pill should feel accessible but not obscuring. Use translucency and blur to integrate it into screen content rather than making it feel like a static frame.
- Action-first UX: the central action is the expression of the product's core value — it should be obvious, immediate, and forgiving.
</pondering>

---

## Comprehensive Style Guide

This section contains the raw tokens and component specs derived from the analysis above. Use these as the canonical reference when implementing UI across platforms.

### Color Palette

- **Primary Background (Dark):** `#0B0B0D`
- **Primary Surface:** `#141417`
- **Accent Yellow:** `#F5E32A`
- **Muted Gray:** `#9A9AA0`
- **Off-black Shade:** `#1F1F23`
- **Soft Yellow Tint:** `#FFF8D6`
- **Success Green:** `#43A047`
- **Error Red:** `#E53935`
- **Neutral Light:** `#E6E6E6`
- **Glass/Bleed Layer:** `rgba(255,255,255,0.03)`

### Typography

- **Primary Font:** SF Pro Text / Roboto
- **Fallback:** Inter
- **Weights:** 400, 500, 600, 700

Scale:
- H1: 28/34 Bold
- H2: 22/28 Semibold
- H3: 18/22 Medium
- Body Large: 17/24 Regular
- Body: 15/20 Regular
- Small: 13/18 Regular
- Balance: 32/40 Bold

### Navigation Component (Tokenized)

- `nav.pill.height = 64px`
- `nav.pill.paddingX = 20px`
- `nav.pill.radius = 32px`
- `nav.primaryButton.size = 64px`
- `nav.pill.bg = rgba(255,255,255,0.04)`
- `nav.pill.blur = heavy` (backdrop-filter: blur(18px) recommended)
- `nav.pill.shadow = 0 6px 20px rgba(0,0,0,0.20)`
- `nav.icon.size = 24px`

### Buttons

- `btn.primary.bg = #F5E32A`
- `btn.primary.text = #0B0B0D`
- `btn.primary.height = 48px`
- `btn.primary.radius = 12px`

### Cards

- `card.bg = #141417`
- `card.radius = 16px`
- `card.shadow = 0 4px 12px rgba(0,0,0,0.10)`
- `card.padding = 16px`

### Charts

- `chart.line.color = #F5E32A`
- `chart.line.width = 2.5-3px`
- `chart.grid.color = #2A2A2E (low opacity)`

### Inputs & Icons

- `input.height = 56px`
- `input.radius = 12px`
- `input.border = 1px #2A2A2E` (focus: 2px #F5E32A)
- `icon.primary = 24px`

### Spacing Tokens

- `space.xs = 4px`
- `space.sm = 8px`
- `space.md = 16px`
- `space.lg = 24px`
- `space.xl = 32px`
- `space.page = 48px`

### Motion Tokens

- `motion.micro = 140ms ease-in-out`
- `motion.standard = 200ms ease-out`
- `motion.emphasis = 300ms spring`
- `motion.page = 350ms cubic-bezier(0.2,0.8,0.2,1)`

---

## Implementation Guidance (Lead Designer Notes)

- **Do:** Use the `Accent Yellow` sparingly and purposefully — for balances, call-to-actions, and chart highlights.
- **Don't:** Use multiple bright accents or saturate background surfaces; keep the dark palette restrained.
- **Do:** Follow the spacing tokens strictly to maintain rhythm across screens.
- **Do:** Maintain numeric legibility: if a balance is displayed on a textured or blurred surface, place a semi-opaque container behind the number to ensure contrast.

Accessibility checklist:
- Check color contrast for all use cases (especially numbers on cards).
- Provide alternative focus indicators for keyboard and accessibility users.
- Ensure tappable targets meet `48px` minimum.

---

## Next Steps (Recommended)

- Extract exact color swatches from reference artwork and add to `design-system/tokens.json`.
- Implement a small Flutter example of the floating pill navigation and add it to `lib/widgets/navigation_pill.dart` for reuse.
- Export tokens to Figma/JSON for designers.

---

Saved to `design-system/styles.md` — tell me which next step you want and I’ll implement it.
