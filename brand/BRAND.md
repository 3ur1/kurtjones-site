# Kurt Jones brand guidelines

Version 1, 29 October 2026. Covers Kurt Jones, trading as Kurt Jones Systems Ltd. Read this before changing anything visual or written on kurtjones.co.uk.

---

## 1. Strategy

### Positioning

For media technology companies, and for the universities and production teams they serve, Kurt Jones is the operator who managed a university media facility and helped build the remote setup that kept its students' live programme on air during the pandemic. Integrators and installers hand a facility over and leave. Kurt brings the view from the gallery chair: what the people using the system actually need from it, and from the companies who support it.

### Brand idea: the operator's view

The visual language comes from the gallery:
- **The tally light** means "this is live, look here".
- **The signal path** shows how one thing feeds the next.
- **Plain labels** are what a crew reads under pressure.

### Audiences, in priority order

1. **Support and services managers at media technology vendors.** They arrive at `/facilities` from an approach email. They need proof of facility operation, remote production and fault finding, in their own vocabulary, within one screen.
2. **Expert network screeners, universities and consulting firms.** They need a sharp niche (higher education media facilities, broadcast and post workflow) and evidence they can check.
3. **Direct editing and production clients, including creators.** They arrive at `/` or `/work` and need taste, reliability and an easy way to start.

### Proof points, the only claims the brand makes

- Five years running the University of West London film and motion capture studios: studio floor, control room, gallery and post production suites.
- Moved the studio to Blackmagic Design architecture with Blackmagic Studio Cameras, and laid the groundwork for virtual production in Unreal Engine.
- Helped build the distributed workflow that kept a student live news programme on air, semester after semester, with the crew working apart.
- Five years teaching and assessing production at degree level.
- Freelance production since 2017, from concept to delivery.
- Field and remote network engineering at carrier and colocation facilities across Europe and North America since 2025, as supporting context.

### Voice

- **Plain and factual.** State the claim, then show the evidence. Adjectives never do the work evidence should do.
- **First person.** Use "I" on the site. Name Kurt Jones Systems Ltd as the contracting company.
- **Short sentences.** If a crew member could not read it on a talkback card, it is too long.
- **State boundaries positively.**
  - "Networking is the supporting context for my production and facilities work."
  - "My contribution is design and verification. I use Python and scripting where a task calls for it."
- **Two separate AI statements, never combined:** "I am highly competent with AI tools." Separately: "I am particular about where they belong."
- **Style:** UK English and sentence case. No em dashes or en dashes, anywhere.

### Never

- Location, maps, time zones, or anything that implies where Kurt lives.
- Names of carrier or colocation client sites.
- Any mention of DaVinci Resolve scripting or automation.
- Invented figures, stock photography, generic icon rows, logo walls.
- VAT wording, insurance claims, or references to Kurt Jones Media Ltd.

---

## 2. Identity

### Logo

The monogram is a K and a lowercase j. The j's dot is the tally light: the one point of colour in the identity, and the brand idea in a single mark.

| File | Use |
|---|---|
| `kj-mark-reversed.svg` | Default. Paper strokes, tally dot, on ink |
| `kj-mark-positive.svg` | Ink strokes, tally dot, on paper or light backgrounds |
| `kj-mark-mono-white.svg` / `kj-mark-mono-black.svg` | One colour only: embossing, single-colour print, watermarks |
| `kj-lockup-reversed.svg` / `kj-lockup-positive.svg` | Mark plus wordmark, for headers, documents and email signatures |
| `../public/assets/favicon.svg` | Browser tab icon, mark on an ink tile |
| `apple-touch-icon.png` | Home screen icon, 180 px |
| `og-image.png` | Link previews, 1200 by 630 px |

The wordmark is Arial Bold, converted to outlines and tracked at 0.16 em, so the logo never depends on an installed font.

Rules:
- **Clear space:** at least the width of the K stroke pair (a quarter of the mark's height) on every side.
- **Minimum size:** the mark at 16 px. The lockup at 120 px wide.
- **Do not:**
  - recolour the strokes;
  - move or recolour the dot, except in the one-colour versions;
  - stretch, rotate or outline the mark;
  - add effects;
  - set the wordmark in another typeface.

### Colour

| Token | Hex | Role | Contrast on ink |
|---|---|---|---|
| Ink | `#0b0b0c` | Page background | |
| Panel | `#151517` | Cards, raised surfaces | |
| Raised | `#1d1d20` | Hover states, diagram fills | |
| Line | `#2c2c30` | Dividers, hairlines (decorative only) | 1.41 |
| Control | `#6b6a66` | Form fields, button and diagram outlines | 3.63, passes 3:1 for non-text |
| Meta | `#85847e` | Small print, dates | 5.25 (4.48 on raised, so never on raised) |
| Ash | `#97968f` | Labels, eyebrows | 6.63 |
| Fog | `#bdbcb7` | Body text | 10.34 |
| Paper | `#f3f2ef` | Headings, emphasis, logo | 17.57 |
| Tally | `#ff5247` | The live point: logo dot, programme path, key markers | 6.14 |

Tally rules:
- **Use it sparingly.** At most one tally element per screen, outside diagrams. It marks what is live or what matters most, never decoration.
- **Never set tally as text on paper:** the contrast is 2.86, which fails. On paper, use tally only as a dot or a graphic.
- **Ink text on a tally fill passes at 6.14.** That is the only filled button style.

### Type

| Role | Stack | Use |
|---|---|---|
| Sans | "Helvetica Neue", Helvetica, Arial, sans-serif | Everything by default |
| Mono | ui-monospace, "Cascadia Mono", Consolas, "SF Mono", Menlo, monospace | Technical labels only: step numbers, eyebrows, diagram stage names. The language of a timecode display |

Weights:
- 300 for display headings.
- 400 for body text.
- 600 for emphasis and small headings.

Never use 700 or above outside the outlined wordmark.

| Level | Size |
|---|---|
| Display | clamp(2.6rem, 7vw, 5.6rem), weight 300, line-height 1.02 |
| H2 | clamp(1.6rem, 3.2vw, 2.4rem), weight 300 |
| H3 | 1.15rem, weight 600 |
| Body | clamp(1rem, 1.25vw, 1.1rem), line-height 1.7, max 66 characters |
| Label | 0.72rem mono, uppercase, letter-spacing 0.14em, Ash |

A self-hosted brand typeface (for example IBM Plex Sans and Plex Mono, open licence) is an optional upgrade. It needs Kurt's approval to download into the repo.

### Diagrams and visuals

- **Boxes:** Panel fill, a 1 px Control outline and a 4 px corner radius.
- **Labels:**
  - Plain language first, in Paper.
  - A small function label under it, in Fog.
  - Stage names above, in mono Ash.
- **The programme path:** the one Tally line, 2 px, with arrowheads.
- **Every diagram** is inline SVG with `role="img"`, a title and a description. It sits inside a figure with a visible caption and a text version, and has a separate portrait layout for phones.
- **Never** use unlabelled arrows, decorative icons, gradients, glows or drop shadows.

### Layout

- **Width:** content sits on a 1200 px maximum grid with side gutters of clamp(1.25rem, 5vw, 4.5rem). Long text is capped at 66 characters. On wide screens the page never leaves a narrow column floating in empty space.
- **Section headings** are larger than body text, in Paper. A mono label above names the section.
- **Header and footer** are identical on every page. The footer always carries the statutory company details.
