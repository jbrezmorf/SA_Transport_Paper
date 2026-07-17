# Current goal planning file

## Completed work log for removable Steps 1 and 2

- Step 1 completed:
  `main.tex` was restructured into the article-oriented input sequence
  `article_intro.tex`, `article_model.tex`, `article_parametrization.tex`,
  `article_methods.tex`, `article_results.tex`, `article_conclusions.tex`, and
  `article_support_appendix.tex`.
- Step 1 completed:
  `main.tex` now uses `article.bib` as the active BibLaTeX source.
- Step 1 completed:
  root `.gitignore` was extended to ignore LaTeX build artifacts generated in
  the repository root.
- Step 2 completed:
  `article_model.tex`, `article_parametrization.tex`, `article_methods.tex`,
  `article_results.tex`, and `article_conclusions.tex` were populated from the
  report sources by copy/move/reorder extraction.
- Step 2 completed:
  report-only support material needed by the article build was retained in
  `article_support_appendix.tex`.
- Post-Step-2 build repair completed:
  `article.bib` was deduplicated, stale report-only label references were
  redirected to article-local labels, and the figure-caption source error in
  `article_parametrization.tex` was fixed.
- Build status on July 17, 2026:
  `build.sh` exits successfully and produces `_build/main.pdf` and
  `_build/main-d.pdf`.

## Step 1: Restructure the article skeleton
DONE.
Goal:
- make the top-level article in `main.tex` follow the paper structure from
  `AGENTS.md`
- keep the repository buildable with `build.sh`
  
## Step 2: Extract report text into the article draft for review
DONE.

Goal:
- populate the article structure with source text from the technical report
- at this step, prefer transfer and rearrangement over rewriting AGENT: more explicit NO REWRITING AT ALL during this step.
- user will review what should stay, be removed, or be expanded later
  
## Step 3: Literature research for similar works

Goal:
- identify papers closely related to near-field transport sensitivity analysis,
  Sobol-based sensitivity studies, DFN/DFM transport uncertainty, and
  excavation-induced transport changes

Expected output:
- a shortlist of comparable works
- brief notes on how each work is relevant to framing, methods, or discussion
- candidate additions or corrections for `article.bib`

Blocking note:
- this step should start only after the article structure and extracted draft
  text are stable enough to show what comparison the paper actually needs

## AGENT: questions and remarks 
Put here project-specific questions, pointout inconsistency with general rules or inconsistency accros the manuscript.

  
