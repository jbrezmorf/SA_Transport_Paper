# Initial Restructuring Plan

This plan covers only the first extraction and restructuring phase. It does not propose detailed rewriting of the scientific text and it does not modify the existing transport chapter content at this stage.

## Scope

The work is limited to priorities `0`, `1`, and `2` from `AGENTS.md`:

0. remove the `SURAO` template and replace it with a standard LaTeX report/article setup
1. remove selected report chapters from the main document while preserving them as support material
2. turn current Chapter 06 material into the core article document, with extracted supporting sections assembled around the existing transport text

## Boundary Conditions

- Keep all existing source material in the repository.
- Do not delete legacy chapters; move them out of the main build only.
- Do not rewrite `transport.tex` in this phase.
- Do not mix extracted contextual material into the existing transport text body yet.
- Keep labels, citations, glossary usage, and project macros usable during restructuring.

## Step 0: Replace the SURAO Template

### Goal

Detach the manuscript from the current report-specific `surao` class and metadata workflow, and move to a standard LaTeX structure suitable for an article-oriented draft.

### Intended changes

- Replace `\documentclass{surao}` with a standard class.
- Remove or isolate `SURAO`-specific front-matter commands:
  - `\suReportNumber`
  - `\suReportYear`
  - `\suShortTitle`
  - `\TitlePage`
  - `\ReportInfo`
  - `\TableOfContents`
  - `\MakeAbstract`
  - `\makeLastPage`
- Rebuild front matter using standard LaTeX constructs:
  - `\title`
  - `\author`
  - `\date`
  - `\maketitle`
  - standard `abstract` environment
- Preserve the current package setup, macros, bibliography, and glossary definitions unless they depend directly on `surao`.

### Likely follow-up checks

- Identify macros or formatting commands currently provided implicitly by the `surao` class.
- Replace or remove any class-specific commands that break compilation after the class switch.
- Decide whether the intermediate target is `report` or `article`.
  - Recommended for this phase: start from `report` for easier restructuring, then switch to `article` once the paper layout is stabilized.

## Step 1: Remove Non-core Report Chapters from the Main Document

### Goal

Reduce the main compiled manuscript to the future paper core, while retaining removed material as support documentation inside the repository.

### Material to remove from the main build

- Chapter 02: bentonite
  - source: `bentonite.tex`
- Chapter 04: hydro-mechanical modelling
  - sources:
    - `model_comparison.tex`
    - `plasticity.tex`
- Chapter 05: experiment interpretation
  - source currently represented by:
    - `05_chapter_excavation.tex`
    - and supporting subfiles:
      - `06_pore_pressure_experiment.tex`
      - `06_fractures.tex`
      - `06_TSX_heterogeneity.tex`

### Preservation strategy

- Keep these files in place as source/support material.
- Remove their chapter inclusion from the main compiled document.
- Optionally group them later under a support-only wrapper, appendix-only wrapper, or separate build target, but not in this phase unless needed for compilation hygiene.

### Result after Step 1

The main build should stop reading these report chapters as primary manuscript chapters. Their content remains available for extraction into the new article structure.

## Step 2: Turn Current Chapter 06 into the Core Article Document

### Goal

Use the current transport chapter as the nucleus of the new paper, and surround it with newly assembled article sections built from extracted material, without editing the existing transport text body yet.

### Core source to preserve

- `transport.tex`

This file remains the main technical body of the future article during this phase.

### Article structure target

The future article should be assembled around the current transport chapter using this order:

1. Introduction
2. Context / model setup section assembled from extracted material
3. Existing transport chapter content
4. Conclusions / discussion adapted later

### Section mapping for extracted material

#### 2.1 Introduction as the first article section

Use the existing introduction text from `main.tex` as the basis for the article introduction.

Planned action:

- Convert the current top-level introduction chapter into the first article section.
- Trim report-style roadmap text later if needed, but not in this extraction phase.

#### 2.2 Single contextual section built from Chapter 03 and selected bentonite material

Build one new section before `transport.tex` by combining:

- Chapter 03 review material:
  - `param_review.tex`
- Bentonite excerpts limited to:
  - dispersion-related discussion
  - essential properties needed by the transport study

### Rules for this merged section

- It should provide only the context needed by the transport paper.
- It should not absorb or rewrite the existing `transport.tex` text.
- It should not import the full bentonite chapter.
- It should not preserve the report-style breadth of Chapter 03.
- It should serve as support for transport assumptions, parameter ranges, and interpretation of sensitivity results.

### Extraction method

1. Identify the minimal set of subsections from `param_review.tex` that are directly used by the transport model.
2. Identify the bentonite passages that discuss transport-relevant material properties and dispersion-related behaviour.
3. Copy or move only those selected parts into a new standalone section file for the article build.
4. Leave original source chapters intact for traceability.

## Proposed Intermediate File Strategy

This phase should introduce new article-oriented wrapper files instead of overloading legacy report files.

### Recommended new files

- `article_main.tex`
  - new article-oriented entry point
- `article_intro.tex`
  - extracted/adapted introduction section
- `article_context.tex`
  - merged contextual section from Chapter 03 and selected bentonite material
- optionally `support_main.tex`
  - later, if a separate support-material build becomes useful

### Legacy files to keep unchanged initially

- `bentonite.tex`
- `param_review.tex`
- `model_comparison.tex`
- `plasticity.tex`
- `05_chapter_excavation.tex`
- `06_pore_pressure_experiment.tex`
- `06_fractures.tex`
- `06_TSX_heterogeneity.tex`
- `transport.tex`

## Execution Order

1. Create a new article entry point and migrate away from the `surao` class.
2. Confirm the minimum standard front matter compiles with existing packages/macros.
3. Remove Chapters 02, 04, and 05 from the new main article build.
4. Keep the current report build restorable until the article build is stable.
5. Extract the introduction into article form.
6. Create one merged context section from Chapter 03 and selected bentonite material.
7. Attach the unchanged `transport.tex` after these new article sections.

## Deliverables of This Phase

- A standard-template article entry point independent of the `surao` class.
- A main article build centered on the transport study.
- Legacy non-core chapters removed from the article build but preserved in the repository.
- A new merged context section assembled from review material and selected bentonite material.
- No substantive rewrite yet of the existing transport text.

## Explicit Non-goals for This Phase

- No detailed rewriting of `transport.tex`
- No final shortening/polishing pass on the article prose
- No final decision on journal formatting
- No deletion of legacy report material
- No integration yet of Chapter 04 or Chapter 05 text into the article body
