# Changelog

All notable changes to this repository are documented here.

---

## [2026-02-23] — Repository setup & infrastructure

### Added — Documentation
- **`CLAUDE.md`**: repository guidance for Claude Code (AI assistant), covering build commands, CI/CD overview, architecture, content structure, and key conventions.

### Added — CI/CD: Dev Preview Workflow
- **`.github/workflows/build-dev-preview.yml`**: new GitHub Actions workflow that triggers on push to the `dev` branch. Renders all three Quarto sub-projects with redirected `output-dir` (via `sed`), saves the output to `/tmp`, switches to `master`, and commits the result to `docs/dev/`. This makes the dev branch preview available at `sstoeckl.github.io/IMAG/dev/`.

### Fixed — CI/CD: Quarto Setup
- Removed `version: 'latest'` from the Quarto setup step in `build-dev-preview.yml`. The string `latest` caused the action to construct an invalid download URL (`vlatest`). Without the option the action resolves the latest real release automatically.
- Added `permissions: contents: write` to `build-dev-preview.yml` (required for the workflow to push back to `master`).

### Removed — Legacy workflows
- **`.github/workflows/publish.yml`**: deleted. Ran `quarto render` at repo root where no `_quarto.yml` exists; only triggered on `main` (not `master`); used a `gh-pages` branch that does not exist.
- **`.github/workflows/publish_gh.yml`**: deleted. Same root-level render problem; conflicted with the `docs/`-on-`master` Pages setup.

### Added — GitHub Labels
Removed irrelevant GitHub defaults (`duplicate`, `good first issue`, `invalid`, `wontfix`) and added project-specific labels:

| Label | Description | Colour |
|---|---|---|
| `chapter` | Content work on a teaching chapter | Blue |
| `engine` | Engine documentation | Green |
| `slides` | Slide deck | Purple |
| `design` | CSS / layout / shared includes | Yellow |
| `review` | Needs review by a partner | Orange |
| `ci` | Workflow / infrastructure | Grey |
| `blocked` | Waiting on something external | Red |

### Added — GitHub Project
- Created **"IMAG Development"** project at `https://github.com/users/sstoeckl/projects/1`.
- Linked to the `sstoeckl/IMAG` repository.
- Custom fields: **Priority** (High / Medium / Low), **Component** (Teaching / Engine / Slides / Design / CI), **Deadline** (date).
- Built-in **Status** field (Todo / In Progress / Done) present by default.

### Added — GitHub Issues (#40–#56)
Created 17 initial issues covering all outstanding work, all added to the project board:

| # | Title | Labels |
|---|---|---|
| #40 | Fix Chapter 12: file has wrong title (shows "13 Feedback Loop") | `bug` `chapter` |
| #41 | Write Chapter 04: Sustainable and Impact Investing | `chapter` `enhancement` |
| #42 | Write Chapter 05: Client Discovery & Personas | `chapter` `enhancement` |
| #43 | Write Chapter 06: Investment Policy & Risk Governance | `chapter` `enhancement` |
| #44 | Write Chapter 07: Strategic Research Toolkit | `chapter` `enhancement` |
| #45 | Write Chapter 08: Strategic Asset Allocation | `chapter` `enhancement` |
| #46 | Write Chapter 09: Tactical Research Toolkit | `chapter` `enhancement` |
| #47 | Write Chapter 10: Tactical Asset Allocation & Security Selection | `chapter` `enhancement` |
| #48 | Write Chapter 11: Portfolio Implementation | `chapter` `enhancement` |
| #49 | Write Chapter 12: Performance Measurement & Attribution | `chapter` `enhancement` |
| #50 | Write Chapter 13: Feedback Loop | `chapter` `enhancement` |
| #51 | Write Appendix A1: Simulation Reference | `chapter` `enhancement` |
| #52 | Write Appendix A2: Glossary | `chapter` `enhancement` |
| #53 | Write Appendix A3: Formula Sheet | `chapter` `enhancement` |
| #54 | Expand Engine Documentation | `engine` `enhancement` |
| #55 | Develop Slide Deck Content | `slides` `enhancement` |
| #56 | Partner review: Chapters 01–03 | `review` `chapter` |

### Added — Six-Lesson Slide Structure
Created a full RevealJS slide scaffolding for six 90-minute lessons, each a standalone `.qmd` file in `slides/`. Every lesson includes: learning outcomes, 3–4 structured sections with placeholder slides, a **Simulation Task** callout specifying what to submit in Cesim Invest, and a **Further Reading** section.

| File | Lesson | Key simulation task |
|---|---|---|
| `slides/lesson-01-introduction.qmd` | Introduction & Simulation Setup | Platform onboarding |
| `slides/lesson-02-markets-esg.qmd` | Markets, Asset Classes & ESG | Map the investable universe |
| `slides/lesson-03-client-ips.qmd` | Client Discovery & IPS | **Draft the Investment Policy Statement** |
| `slides/lesson-04-saa.qmd` | Strategic Asset Allocation | **Build & submit the SAA** |
| `slides/lesson-05-taa-security.qmd` | Tactical Allocation & Security Selection | **TAA tilts & security picks** |
| `slides/lesson-06-performance.qmd` | Performance Measurement & Feedback Loop | **Attribution analysis & post-mortem** |

- Updated `slides/index.qmd` from a stub RevealJS deck to an **HTML overview page** listing all six lessons.
- Updated `slides/_quarto.yml`: added website title, RevealJS footer with Erasmus+ project code, and standard 1280×720 dimensions.

### Added — Teaching Chapter Integration
Added a `{.callout-tip}` block at the top of every teaching chapter linking to its associated lesson slides:

| Chapter | Associated lesson |
|---|---|
| `01_Introduction.qmd` | Lesson 1 |
| `02_Asset_Classes.qmd` | Lesson 2 |
| `03_Sustainable_Investing.qmd` | Lesson 2 |
| `04_Client_Analysis.qmd` | Lesson 3 |
| `05_Investment_Policy.qmd` | Lesson 3 |
| `06_Strategic_Fiancial_Analysis.qmd` | Lesson 4 |
| `07_Strategic_Asset_Allocation.qmd` | Lesson 4 |
| `08_Tactical_Financial_Analysis.qmd` | Lesson 5 |
| `09_Tactical_Asset_Allocation.qmd` | Lesson 5 |
| `10_Security_Analysis.qmd` | Lesson 5 |
| `11_Portfolio_Implementation.qmd` | Lesson 5 |
| `12_Portfolio_Analysis.qmd` | Lesson 6 |
| `13_Feedback_Loop.qmd` | Lesson 6 |

---

## [2026-01-28] — Content: Chapter 12 formatting fix

- `teaching/04_Client_Analysis.qmd`: formatting correction (commit `a16be98`).

## [pre-2026-01-28] — Initial project setup

- Initial repository structure, GitHub Actions exploration, team & partner content, landing page (`docs/index.html`), engine documentation stub, teaching chapter content (chapters 01–03 fully written; 04–13 partially written in old structure).
- CI/CD pipeline established: `quarto-build.yml` renders teaching, slides, and engine sub-projects on push to `master` and commits built `docs/` back to the branch.
