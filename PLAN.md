# Current goal planning file

## Step 1: Restructure the article skeleton
DONE.
Goal:
- make the top-level article in `main.tex` follow the paper structure from
  `AGENTS.md`
- keep the repository buildable with `build.sh`

Files expected to be touched:
- `main.tex`
- `article_intro.tex`
- `article_context.tex`
- `transport.tex`
- `article_support_appendix.tex`
- possibly new article section files if the current three-way split becomes too
  coarse

Intended result:
- `main.tex` remains the entry point and includes only the article-focused
  section files
- the article structure should follow `AGENTS.md`:
  
  1. problem framing, research, and motivation
  2. near-field model
     - conceptual near-field transport model
     - DFM approach
     - DFN stoachastic model
  3. model parametrization
     - site specific data
     - Determination of the DFN parameters through Bayesian inversion
  4. sensitivity-analysis methodology, implementation of Sobol indices, groups
  5. main transport sensitivity results, interpretation, discussion
  6. conclusions
  
- the document compiles after each structural step

Confirmed decisions:
- "remove SURAO template" means keep the current plain article setup in
  `main.tex` and do not restore anything from `report_files/template.tex`
  CORRECT.
  Resolved: treat this as confirmed for Step 1.
  
- Step 1 is a permanent article-structure change in the active manuscript, not
  just a temporary staging layout
  CORRECT.
  Resolved: treat this as confirmed for Step 1.

AGNET:
- introduce and use biblatex file article.bib, copy there references from all *.bib files. 
- wrap lines to 90 chars approx.
- missing content of the Section 2, there are several sections in the report to copy here
- Section 3, the specified parameter vallues must be supported by particular references. 
  In order to avoid edits put references after copied text. 
- 3.1.2 and 3.1.3 add parameters for the bentonite backfill as well 
  
  
## Step 2: Extract report text into the article draft for review
DONE.

Goal:
- populate the article structure with source text from the technical report
- at this step, prefer transfer and rearrangement over rewriting AGENT: more explicit NO REWRITING AT ALL during this step.
- user will review what should stay, be removed, or be expanded later

Source files expected to be mined:
- `report_files/main.tex`
- `report_files/bentonite.tex`
- `report_files/param_review.tex`
- `report_files/model_comparison.tex`
- `report_files/plasticity.tex`
- `report_files/05_chapter_excavation.tex`
- `report_files/06_pore_pressure_experiment.tex`
- `report_files/06_fractures.tex`
- `report_files/06_TSX_heterogeneity.tex`
- `report_files/transport.tex`

Target files expected to receive extracted text:
- `article_intro.tex`
- `article_context.tex`
- `transport.tex`
- `article_support_appendix.tex`
- possibly new article section files created under the active manuscript root

Rules for this step:
- traverse changes from `main.tex` through the active `\input` structure
- do not invent new results, interpretations, or literature support
- copy, move, and reorder text in a logically paper-oriented structure before
  doing substantial rewriting
- remove duplicated report exposition when the same point appears in multiple
  source chapters
- keep only text that supports the transport sensitivity analysis narrative
- keep summaries and local transitions aligned with paper logic rather than
  report chronology
- keep supporting but non-core material available in appendix or support files
  instead of deleting it immediately

Current interpretation of your file-specific instructions:
- chapter 06 material becomes the core of the active article draft
- the introduction becomes the first article section
- chapter 02 bentonite, chapter 04 hydro-mechanical modelling, and chapter 05
  experiment interpretation are removed from the main article flow but kept as
  supporting material for later reuse
- chapter 03 plus the dispersion and essential-properties discussion from the
  bentonite material should be refactored into a separate article section and
  should not be merged blindly into the existing `transport.tex`

Working assumptions to confirm or modify:
- "remove from the main document" means move out of the article body in
  `main.tex`, but keep the source files in the repository and reuse selected
  parts in appendix/support files as needed
  AGENT: I see not "remove from main document in the instructions. So what is your question?
  
- "chapter 06" refers primarily to the material in
  `06_pore_pressure_experiment.tex`, `06_fractures.tex`,
  `06_TSX_heterogeneity.tex`, and the related transport discussion
  CORRECT.
  
- "chapter 3" should be identified precisely before extraction starts, because
  the current active repository structure does not expose a file with that name
  AGENT: That is covered by `param_review.tex`.

Step 2 DONE.
  
## Step 3: Literature research for similar works

Goal:
- identify papers closely related to near-field transport sensitivity analysis,
  Sobol-based sensitivity studies, DFN/DFM transport uncertainty, and
  excavation-induced transport changes

Expected output:
- a shortlist of comparable works
- brief notes on how each work is relevant to framing, methods, or discussion
- candidate additions or corrections for `report.bib`

Blocking note:
- this step should start only after the article structure and extracted draft
  text are stable enough to show what comparison the paper actually needs

## AGENT: questions and remarks 

- Put project-specific questions, pointout inconsistency with general rules or inconsistency accros the manuscript.
- Please confirm or edit the "Working assumptions to confirm or modify" in
  Steps 1 and 2 before execution.
- Please identify what "chapter 3" maps to in the current repository files.
  
