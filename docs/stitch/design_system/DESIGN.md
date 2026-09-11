---
name: Civic Modern
id: assets_38410e3450ec4dd08731d5fc6fad259d
colors:
  surface: '#faf8ff'
  surface-dim: '#d2d9f4'
  surface-bright: '#faf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3ff'
  surface-container: '#eaedff'
  surface-container-high: '#e2e7ff'
  surface-container-highest: '#dae2fd'
  on-surface: '#131b2e'
  on-surface-variant: '#464554'
  inverse-surface: '#283044'
  inverse-on-surface: '#eef0ff'
  outline: '#767586'
  outline-variant: '#c7c4d7'
  surface-tint: '#494bd6'
  primary: '#4648d4'
  on-primary: '#ffffff'
  primary-container: '#6063ee'
  on-primary-container: '#fffbff'
  inverse-primary: '#c0c1ff'
  secondary: '#006591'
  on-secondary: '#ffffff'
  secondary-container: '#39b8fd'
  on-secondary-container: '#004666'
  tertiary: '#904900'
  on-tertiary: '#ffffff'
  tertiary-container: '#b55d00'
  on-tertiary-container: '#fffbff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e1e0ff'
  primary-fixed-dim: '#c0c1ff'
  on-primary-fixed: '#07006c'
  on-primary-fixed-variant: '#2f2ebe'
  secondary-fixed: '#c9e6ff'
  secondary-fixed-dim: '#89ceff'
  on-secondary-fixed: '#001e2f'
  on-secondary-fixed-variant: '#004c6e'
  tertiary-fixed: '#ffdcc5'
  tertiary-fixed-dim: '#ffb783'
  on-tertiary-fixed: '#301400'
  on-tertiary-fixed-variant: '#703700'
  background: '#faf8ff'
  on-background: '#131b2e'
  surface-variant: '#dae2fd'
  brand-primary-dark: '#818CF8'
  background-light: '#F8FAFC'
  surface-light: '#FFFFFF'
  background-dark: '#0F172A'
  surface-dark: '#1E293B'
  border-light: '#E2E8F0'
  text-primary: '#0F172A'
  text-secondary: '#64748B'
  text-muted: '#94A3B8'
  status-pending: '#F59E0B'
  status-inprogress: '#3B82F6'
  status-resolved: '#10B981'
  status-rejected: '#EF4444'
  status-boosted: '#8B5CF6'
  priority-low: '#10B981'
  priority-normal: '#3B82F6'
  priority-high: '#F59E0B'
  priority-urgent: '#EF4444'
typography:
  display:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
    letterSpacing: -0.5px
  headline:
    fontFamily: Inter
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.3px
  title:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 21px
  label:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.2px
  caption:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '400'
    lineHeight: 14px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 0.75rem
  space-lg: 1rem
  space-xl: 1.5rem
---

# Civic Modern Style Guidelines

## Brand & Style
This design system embodies a modern, trustworthy civic utility aesthetic designed primarily for mobile interfaces. The overall mood is approachable, transparent, and structured, instilling confidence and civic engagement.

Visually, the style combines Corporate Modern clarity with soft, human-centric touches: crisp typography, generous touch targets, distinct semantic status indicators, clean card separations, and subtle ambient shadows over light neutral canvases.

## Layout & Spacing
The layout system is tailored for modern mobile touch interfaces (baseline 390 x 844 px).

- **Grid & Margins**: A 4-column fluid mobile grid with 16px (`1rem`) outer margins and 16px (`1rem`) gutters between content columns ensures touch interfaces feel comfortably padded without losing screen real estate.
- **Rhythm**: Built around a 4px/8px incremental rhythm. Spacing between distinct card sections defaults to `space-lg` (16px), while tight metadata pairings use `space-xs` (4px) or `space-sm` (8px).
- **Touch Areas**: Interactive components preserve a minimum vertical footprint of 48px to accommodate ergonomic thumb-zone interaction.

## Elevation & Depth
Elevation is maintained using subtle ambient shadows paired with crisp surface dividers rather than stark, heavy drop shadows:

- **Card Elevation**: Uses a composite ambient diffusion: `0 4px 12px rgba(15, 23, 42, 0.05), 0 1px 2px rgba(15, 23, 42, 0.08)`. This creates a floating paper effect that lifts content cleanly above the cool off-white background (`#F8FAFC`).
- **Dividers & Outlines**: Surface layers are framed by subtle 1px borders in `#E2E8F0` to maintain tactile structure even under direct sunlight or reduced screen contrast.
- **Modal & Sheets**: High-elevation dialogs and bottom action sheets expand on this ambient diffusion with darker scrims (`rgba(15, 23, 42, 0.40)`) and higher vertical offsets (`0 12px 32px rgba(15, 23, 42, 0.12)`).

## Components

### Buttons
- **Primary Buttons**: Fixed height of 52px with a 12px corner radius. Filled with `#6366F1`, displaying centered bold white text with a minimum tap target width conforming to mobile ergonomics.
- **Secondary Buttons**: Outlined or soft tinted backgrounds using `#0EA5E9` at 10% opacity, bordered with 1px solid `#0EA5E9`, featuring 12px corner radii and 48px touch heights.

### Input Fields
- Form inputs feature a 12px border radius, 48px minimum height, and a 1px border in `#E2E8F0`. When focused, inputs transition to a 1.5px border in `#6366F1` with a subtle focus glow.

### Cards
- Surfaces are filled with pure white (`#FFFFFF`) over the `#F8FAFC` canvas, with a 16px border radius, ambient drop shadow (`0 4px 12px rgba(15, 23, 42, 0.05)`), and an optional 1px `#E2E8F0` structural outline. Internal card padding is standardized at 16px.

### Badges & Status Chips
- Full pill curvature (`roundedness: 999px`).
- Backgrounds use 10–15% tints of the respective semantic tokens (e.g., `#10B981` tint for Resolved, `#F59E0B` tint for Pending) paired with dark, high-contrast label typography.

### Lists & Dividers
- Lists contained within cards use 1px horizontal dividers (`#E2E8F0`). List items have a minimum touch target height of 48px with generous 12px vertical spacing for ease of selection.

### Selection Controls (Checkboxes & Radios)
- Checkboxes utilize a 4px corner radius; radio buttons are fully circular. Both transition to solid `#6366F1` when selected and maintain a 48px touch target wrapper around a 20px visual control.
