# Plan: bringing the IMAG handbook in line with the new strategic-allocation design

Date: 16 October 2026. Basis: branch `dev` at `468dda9` (Moritz, 12 October), the client
profiles and allocation recipe of 14 October (`011_Asset_Simulation/Documentation/Client_Profiles.md`),
and the four-station allocation app (`sstoeckl/2024_CESIM_Invest`, master).

## 1. Where the repository stands

- `master` is from 24 February (CI, footer, logos). All content work since then is on `dev`:
  Moritz's chapters 4 to 12, reworked twice (July: "IMAG integration"; September/October:
  chapters 6, 7 and 8 rewritten "with IMAG data"). The dev preview renders to `docs/dev/`.
- Chapter structure (`teaching/_quarto.yml`): 01 Introduction, 02 Asset Classes, 03 Sustainable
  Investing, 04 Client Analysis, 05 Investment Policy, 06 Strategic Financial Analysis, 07 Strategic
  Asset Allocation, 08 Tactical Financial Analysis, 09 Tactical Asset Allocation, 10 Security
  Analysis, 11 Portfolio Implementation, 12 Portfolio Analysis; 13 Feedback Loop is commented out;
  the three appendices (a1 simulation reference, a2 glossary, a3 formulas) are empty; the engine page
  is a five-line stub. Slides: six lessons.
- Every "... in IMAG" section was written against the **old** allocation app and the **old** client
  cards: the Adjust-Parameters tab, the Group-Constraints tab, the four objectives with Sharpe as
  default, a universe of four assets (USD/EUR equities and government bonds), historical statistics
  from the November-2024 export (Equities_EU 9.37 % mean, 26.2 % volatility; Gov_bonds_US 1.07 %), and
  Mr. Miller's bands (government bonds 7–35 %, corporate 5–20 %, equities 30–100 %, alternatives
  0–15 %, γ ≈ 2 "aggressive").

## 2. What changed on our side, and what the handbook must say

1. **The strategic allocation of a client is defined.** It is the mean-variance optimum of a risk
   aversion γ and three rules (cash floor, commodity rule, home rule: half of the equity book at
   home, the rest by market capitalisation) on the full history of the game's 21 positions, in US
   dollars, unhedged, in excess of the US money-market rate. Nothing else. The game holds it as the
   hidden benchmark; the attribution runs against it.
2. **γ is not given; it is estimated.** Each client description states the three rules and two
   past decisions (a riskier portfolio rejected for a quieter one, a riskier one accepted over a
   quieter one), which bracket γ through U = μ − γ/2 σ². The story says where in the bracket to
   look. True values: Conservative 10 (bracket 6.9–13.3), Conservative ESG 9 (6.3–11.7), Dynamic
   6.25 (4.1–9.0), Dynamic ESG 5.5 (3.5–8.1).
3. **Two limit layers.** Guidance bands in the client text (range of the optimum over the
   bracket) and the hard Min-Max sheet (guidance widened by five points, tactical allowance 0–10 %
   per currency where the allocation holds nothing, floors kept), whose breach loses the client.
4. **Foreign money market and foreign bonds are zero** in every hidden allocation, by the
   optimiser, not by rule: unhedged, they carry currency volatility without a premium (D2 of the
   technical appendix). Currency diversification runs through the equity book. The class mix
   differs by home market because of the home rule (Japan: more US credit, less equity).
5. **ESG binds at security selection**, not at the strategic level (ratings exist for equities
   only; the market carries no ESG premium). ESG clients differ by "no commodities" and γ.
6. **The app has four stations**: Strategic Asset Analysis (positions, part of the sample in
   percent, statistics, correlations), Strategic Asset Allocation (γ, home rule, limits, matrix as
   in the game, in-sample results, frontier, export code), Tactical Analysis (Black-Litterman with
   the fixed SAA as equilibrium prior, absolute and relative views with confidence), Tactical Asset
   Allocation (optimum under the posterior, band per position, tracking-error budget; the same
   views applied to every fixed SAA). Without views the TAA equals the SAA.

## 3. The one decision to take before editing: moments versus capital-market assumptions

Chapters 6 and 7 as they stand build forward-looking capital-market assumptions (yield anchors,
CAPM equity premia, PPP currency adjustment, real USD terms) and feed them into the optimiser as the
strategic inputs. The game's benchmark is built on the historical moments. Both cannot be "the"
strategic allocation. Proposal, consistent with the recipe and with how the game scores:

- **Strategic layer = the sample.** The client's benchmark is the optimum on the full history; the
  student's job in chapters 6 and 7 is to read the history correctly (station 1), translate the
  client into γ and rules (chapter 4), and run the optimisation (station 2). Chapter 6's building
  blocks remain as the way to understand *why* the historical moments look as they do and as the
  source of tactical views.
- **Forward-looking assumptions = views.** The CMA work of chapter 6 (yield anchors, premia,
  business cycle) becomes the input to chapter 8/9: a view in Black-Litterman around the SAA, with a
  confidence. That is where "USD bonds yield 4.2 %, EUR 1.6 %" belongs, and it is the only place
  where a currency assumption (UIP, PPP) enters the allocation.

Alternative: keep CMAs in the strategic layer and present the historical optimum as "the client's
benchmark the firm has agreed to". That keeps Moritz's text but leaves the student with two strategic
allocations and no rule which one the game uses. Not recommended.

## 4. Chapter-by-chapter

### 04 Client Analysis (Moritz; medium)
- "Methods for Evaluating Client's Risk Appetite": keep the Merton-share derivation of γ; add the
  **pairwise-choice method** (rejected/accepted portfolios ⇒ bounds on γ), since that is what the
  client texts now give. Recalibrate the shorthand "above 6 conservative, 3–6 moderate, below 3
  aggressive": on the game's market the four client types sit at 10 / 9 / 6.25 / 5.5, and a client
  with γ = 2 would hold 100 % equities.
- "Client Analysis in the IMAG": replace the Mr. Miller case (γ ≈ 2, 80 % equities, four assets,
  7–35 % bands) by one of the new profiles, ideally the Dynamic USD client (Dana Whitaker): the
  three rules, the two decisions, the bracket 4.1–9.0, the story cue, the guidance bands, the
  hard limits, what is *not* constrained. Figure `IMAG-Client.png` to be re-shot once Cesim has the
  new texts.
- "Translating the Profile into Portfolio Constraints": the table of illustrative weights (55/25/
  12.5/7.5) goes; the translation is now "three rules into the app, γ estimated".

### 05 Investment Policy (Moritz; medium)
- Mr. Miller IPS: the constraints table (7–35 % etc.) becomes the guidance bands plus the hard
  Min-Max of the chosen client; Section 4 (risk tolerance) states the bracket and the estimate;
  Section 5 states the allocation rule (the recipe) and that the benchmark is the hidden SAA.
- The Schmidt-Miller IPS is a textbook case outside the game; keep, but its allocation framework
  should not contradict the recipe (home rule, no currency hedging available in the game).

### 06 Strategic Financial Analysis (Moritz + Sebastian; large)
- "The Historical Record" and "Key Metrics": now the core of the strategic layer. Describe the
  game's dataset as the player sees it (21 positions, five currencies, monthly, USD, unhedged,
  excess over the US money market, full history), station 1 of the app, and the three facts a
  reader must take from it: the Sharpe ranking of the positions, the currency volatility of
  foreign bonds (9–13 % on a 2–4 point premium), and the correlation structure.
- "Strategic Financial Analysis in the IMAG Simulation" (steps 1–3, USD/EUR, CAPM, PPP, real
  terms): move to the tactical layer as "building views" (chapter 8) or shorten into "what the
  Economic Outlook adds to the history". The figures from the old app (Equities_EU 9.37 %, Gov_bonds_US
  1.07 %, the 4×4 correlation matrix) are wrong for the current market and must be replaced from the
  app's statistics table.
- Add a short section on why unhedged foreign bonds are dropped by any optimiser on this market
  (uncovered interest parity, hedge ratio one for bonds, 0.2–0.9 for equities): it is the chapter's
  "Currency Policy" paragraph made concrete.

### 07 Strategic Asset Allocation (Moritz + Sebastian; large)
- "Establishing Investment Guidelines": tie each guideline to the recipe (risk tolerance = γ;
  liquidity = cash floor; permissible classes = commodity rule and ESG; currency policy = unhedged
  by construction; home bias = the home rule).
- "Mean-Variance Optimization": add the exact objective the game uses (μ′w − γ/2 w′Σw on
  annualised moments, long-only, rules as equalities and floors) and the quadprog implementation
  in the app; "Improving MVO" stays as discussion but must say the benchmark is the plain optimum.
- "The Black-Litterman Model": keep, but state that in the game it is the *tactical* tool with the
  SAA as equilibrium (chapter 9), not the strategic one.
- "Geographic and Currency Diversification": rewrite the last three paragraphs: the game cannot
  hedge; the consequence is structural (foreign bonds and cash zero, diversification through
  equities); custody versus currency.
- "Strategic Asset Allocation in IMAG": rewrite against station 2: inputs (the sample), the client
  (γ estimate, rules), the matrix, the in-sample results, the binding limits, the "Fix as SAA"
  step; the worked example becomes one client (Conservative USD: 5 / 43 / 5.5 / 42.5 / 4) with the
  cost of a wrong γ (γ 9 or 11: 5 or 3.5 points away). Drop the Adjust-Parameters and
  Group-Constraints tabs, the four-objective text and the Sharpe-first advice (on this market the
  money-market position has the highest Sharpe ratio, so max-Sharpe is a trap; quadratic utility
  with the client's γ is the task).

### 08 Tactical Financial Analysis (Moritz; small)
- Keep. Add one paragraph linking the Economic Outlook reading to station 3: a reading becomes a
  view (absolute or relative) with a confidence; the CMA material from chapter 6 lands here.
- "A Note on the Tools the Simulation Does Not Provide": update for the app.

### 09 Tactical Asset Allocation (Moritz; medium)
- "The Black-Litterman Active Tilt": make it the game's mechanism: prior Π = γΣw_SAA, views,
  Ω from confidence, posterior, optimisation under the SAA rules within a band, tracking-error
  budget; without views TAA = SAA. One worked example from station 4 (US equities view, +4.4 points
  for the conservative, +9.2 for the dynamic client with the same view).
- "Tactical Asset Allocation in IMAG": say that the benchmark is the hidden SAA, that foreign
  bonds in the TAA are a currency bet the client did not ask for, and that the attribution will
  show it as an allocation effect.

### 10 Security Analysis (Moritz; small)
- "Security Analysis in IMAG": this is where ESG binds. Add: the strategic allocation is at class
  level; the ESG floor filters the securities within each equity position; cost is diversification
  (tracking error to the class line), not expected return.

### 12 Portfolio Analysis (Moritz; small)
- Macro attribution: policy return = hidden SAA; worked example with a foreign-bond tilt showing up
  as a currency-driven allocation effect.

### 13 Feedback Loop (Sebastian; decide)
- Currently commented out of the book. Either re-enable with a short "what the attribution says
  about your γ estimate and your views" section or drop.

### Appendices (Sebastian; medium)
- a1 simulation reference: the dataset as the player sees it (positions, frequency, currency,
  excess returns), the recipe in one page (the "method note" of the client profiles), the four
  stations. No workbook internals, no data sources.
- a3 formulas: the mean-variance objective, the γ bounds from a pair of choices, Black-Litterman
  posterior with Ω_k = (1 − c)/c · τ · p′Σp, tracking error, Brinson-Fachler.
- a2 glossary: position, guidance band, hard limit, home rule, hidden SAA, view, confidence.

### Engine page (Sebastian; decide)
- Stub today. Candidate content: a public, reduced version of the model specification (what the
  market model is: factor model for equities, three-factor curves for bonds, credit spreads,
  commodities, currency), without parameters that identify the vendor data. Decide whether this is
  wanted on a public site at all.

### Slides (Moritz; small, after the chapters)
- Lesson 3: client card as "rules + two decisions"; benchmark = hidden SAA.
- Lesson 4: replace "use provided template or Excel" by the app's station 2; replace the
  practical-constraints slide by the two limit layers; add the "max Sharpe is a trap here" slide.
- Lesson 5: station 3/4 flow; same views, different tilts by client.

## 5. Order, ownership, branch

1. Sebastian: decision of section 3 (moments versus CMAs) and whether the engine page gets model
   content. One hour.
2. Sebastian: appendices a1/a3 from the existing documents (the method note, the formulas); this
   gives Moritz the reference to cite. Half a day.
3. Moritz: chapters 4, 5, 7, 9 against the new client profiles and the app, in that order; chapter
   6's IMAG section moved or shortened; chapters 8, 10, 12 small additions. Two to three days of
   writing; the numbers come from the app and from `Client_Profiles.md`, not from the old
   screenshots.
4. Screenshots: all `IMAG-*.png` figures of the Clients, Investment-strategy and Tactical pages must
   be re-shot after Cesim has loaded the new texts and the Min-Max sheet; the app figures can be
   shot now.
5. Slides last.
6. Git: branch `saa-recipe` off `dev`, one PR per chapter into `dev`, preview at `docs/dev/`; merge
   `dev` into `master` when the chapters agree with each other.

## 6. Material to hand to Moritz

- `Client_Profiles.md/.docx`: the texts, the two decisions per type, the guidance bands and hard
  limits per client, the game-master sections (not for the public handbook).
- `Strategic_Asset_Allocation_v2.xlsx`: sheets Min-Max, Guidance bands, Hidden SAA.
- The app (`2024_CESIM_Invest`, README and Method tab): station descriptions, formulas, tests.
- Technical appendix Part D (D2 currency, D4 recipe, D5 results): background for chapters 6/7/9;
  not to be cited as a source on the public site.
