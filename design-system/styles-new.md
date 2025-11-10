## Pontificating

We are adapting a high-contrast, depth-oriented finance system into a warmer, minimal fitness and wellness design language. The original system's clarity, single-accent hierarchy, and strong navigation affordances transfer well to a health-focused product: users need fast scanability, unmistakable primary actions (log workout, start session), and calm, encouraging surfaces that feel friendly rather than clinical.

This merged system keeps the discipline of a single, strong accent and clean numeric hierarchy from the finance reference, but replaces the premium nocturnal tone with warmer surfaces, softer shadows, and approachable motion. The floating centered pill navigation remains a primary UX pattern — retooled to prioritize quick logging and session starts.

---

## How To Leverage (Lead Designer note)

- Use this system to make screens scannable in under 2 seconds: large metrics (streaks, calories, time) should be the first thing the eye finds.
- Keep interfaces lean: show only the data required to make a decision or take an action. Progressive disclosure (tap-to-expand, swipe details) is preferred to dense pages.
- Center the user's progress: use the warm accent to highlight progress bars, primary buttons, and current-session states. Reserve neutral and muted tones for metadata and secondary controls.
- For community features, use softer rounded cards and micro-illustrations; keep the accent consistent across reactions, follow/unfollow, and action confirmations to maintain a single product voice.

## Philosophy (Lead Designer note)

- Warmth over starkness: fitness is motivational — the UI should feel inviting and human while remaining crisp and efficient.
- Signal with purpose: a single, consistent accent color should carry semantic weight (primary action, progress, critical success). Avoid multiple competing accents.
- Trust through predictability: consistent spacing, motion timing, and elevation build expectable behavior and reduce cognitive load.

---

## Adapted Style Guide (Fitness & Wellness)

### Color Palette

- **Primary Background (Warm Light):** `#FBFBFA` — warm off-white canvas for calm, daylight feel.
- **Surface (Soft Warm):** `#FFFFFF` — cards and surfaces for content.
- **Primary Accent (Warm Orange):** `#FF8C42` — for primary CTAs, progress bars, active states (a warmer cousin of the finance yellow).
- **Secondary Accent (Calm Teal):** `#26C6A6` — success, completed sessions, positive feedback.
- **Muted Gray:** `#9E9E9E` — secondary text and inactive icons.
- **Deep Text:** `#111315` — primary text color for readability.
- **Subtle Shadow:** `rgba(16,16,18,0.06)` — soft card shadows.

Notes: Keep a single warm accent for the product voice; use the teal only for positive confirmations and celebratory states.

### Typography

- **Primary Font:** Inter / Roboto (geometric, legible across platforms)
- **Weights:** 400, 500, 600, 700

Scale (mobile-first):
- **H1:** 30px/36px, 700 — primary screen metrics (today's workout time, streak number)
- **H2:** 22px/28px, 600 — section headers
- **H3:** 18px/22px, 600 — card titles
- **Body Large:** 17px/24px, 400
- **Body:** 15px/20px, 400
- **Caption:** 13px/18px, 500

Special:
- **Metric Display:** 36px/44px, 700, Primary Accent for the most important metric on the screen.

### Spacing System

- `xs = 4px`
- `sm = 8px`
- `md = 16px`
- `lg = 24px`
- `xl = 32px`
- `page = 48px`

Use `md` as the default internal padding for cards; `lg` between major sections.

---

### Navigation (Floating Pill adapted)

Design intent: fast one-thumb actions for logging, starting sessions, and opening the camera for meal logging.

- **Pattern:** Floating centered pill with circular primary action.
- **Pill Dimensions:** height `64px`, paddingX `20px`, radius `32px`.
- **Primary Action Button:** circular, `64px` diameter, elevated by `8-12px`, background `Primary Accent`.
- **Pill Background:** `rgba(255,255,255,0.9)` on light surfaces with subtle blur `backdrop-filter: blur(6px)` (optional — keep performance in mind).
- **Iconography:** `nav.icon.size = 24px`; center icon `32px` if needed for clarity.
- **Touch Targets:** minimum `48px` tappable area for each control.
- **Behavior:** center button = primary logging action (tap to quick-log, long-press to open quick actions — workout, meal, mood). Surrounding icons: Home, Calendar, Community, Profile.

Accessibility:
- Provide a clear textual label for the center action via accessibility APIs; include a larger hit area for screen readers and switch controls.

---

### Components

Buttons
- **Primary Button:** bg `#FF8C42`, text `#FFFFFF`, height `48px`, radius `12px`.
- **Secondary Button:** bg `transparent`, border `1.5px #E7E7E7`, text `#111315`, radius `12px`.

Cards
- **Card Background:** `#FFFFFF`
- **Card Radius:** `14px`
- **Card Shadow:** `0 6px 20px rgba(16,16,18,0.06)`
- **Padding:** `16px`

Badges & Chips
- **Badge (active):** bg `#FF8C42` with white text, small radius `12px`
- **Chip (tag):** bg `#FFF6F1`, text `#FF8C42`

Charts & Progress
- **Progress Primary:** `#FF8C42` (use for daily goals and ring progress)
- **Progress Secondary (positive):** `#26C6A6`
- **Grid / Axis:** `#ECECEC`

Inputs
- **Height:** `56px`, radius `12px`.
- **Border:** `1px #E6E6E6` inactive, `2px #FF8C42` when focused.

Icons
- Primary `24px` for standard actions, `28-32px` for primary center action.

---

### Motion & Animation

- **Microinteraction:** `120ms` ease-in-out for button taps and toggles.
- **Standard Transition:** `200ms` ease-out for component transitions.
- **Primary Emphasis:** `280-320ms` spring for center action (scale 0.98→1.06 then settle).
- **Progress Animation:** smooth, decelerating ease for progress rings (400ms).

Motion Guidelines:
- Keep motion purposeful and short; avoid long, playful animations on core interactions that should feel efficient.

---

### Accessibility & Content Guidance

- Ensure color contrast: primary accent on white must meet contrast for actionable labels (use bold/semibold text when necessary).
- Numeric readability: metric numbers should be high weight and spacings generous; use semi-opaque container behind metrics when placed on imagery.
- Interaction affordance: clear affordance for swipes, drags and long-press; provide alternative explicit buttons for users who prefer tap-only.

---

## Tokens (JSON-ready key names)

- `color.background = #FBFBFA`
- `color.surface = #FFFFFF`
- `color.accent = #FF8C42`
- `color.success = #26C6A6`
- `color.text.primary = #111315`
- `color.text.muted = #9E9E9E`
- `space.md = 16px`
- `font.h1.size = 30px`
- `nav.pill.height = 64px`
- `nav.primary.size = 64px`

---

## Implementation Notes & Next Steps

- Export tokens to `design-system/tokens.json` for cross-platform use (I can do this next).
- I can create a Flutter `Widget` `lib/widgets/floating_nav_pill.dart` implementing the center-action behavior with accessibility hooks and example usage in `main.dart`.
- Provide Figma tokens and a starter file for the design team.

---

Saved to `design-system/styles-new.md`.
