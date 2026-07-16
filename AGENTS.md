# LaTeX sources for transport sensitivity analysis paper draft

## Project overview

- The source in directory `report_files` is a technical report being rewritten into a paper draft centred
  on transport sensitivity analysis. Source files in the subdir:
  - `bentonite.tex`
  - `param_review.tex`
  - `model_comparison.tex`
  - `plasticity.tex`
  - `05_chapter_excavation.tex`
  - `06_pore_pressure_experiment.tex`
  - `06_fractures.tex`
  - `06_TSX_heterogeneity.tex`
  - `transport.tex`
- Report-related bibliography files were moved to `report_files/`:
  - `report.bib`
  - `_theory.bib`
  - `_plasticity.bib`
  - `_pore_pressures_experiment.bib`
  - `_surao.bib`

- `main.tex` is the authoritative entry point, preamble, macro registry,
  glossary source, and chapter assembly file.
- Current `main.tex` inputs and bibliography:
  - `article_intro.tex`: paper introduction and motivation
  - `article_model.tex`: near-field model section skeleton
  - `article_parametrization.tex`: model parametrization and transport context
  - `article_methods.tex`: sensitivity-analysis methodology section skeleton
  - `article_results.tex`: transport sensitivity results section skeleton
  - `article_conclusions.tex`: conclusions section skeleton
  - `article_support_appendix.tex`: supporting appendix material
  - `report.bib`: active BibLaTeX database loaded by `\addbibresource`
  
- The target manuscript should read as a coherent paper on near-field
  transport sensitivity analysis rather than as a lightly edited report.
- Preferred paper structure:
  1. problem framing, research, and motivation
  2. near-field model
     - conceptual near-field transport model
     - DFM approach
     - DFN stoachastic model
  3. - model parametrization
     - site specific data
     - Determination of the DFN parameters through Bayesian inversion 
  4. sensitivity-analysis methodology, implementation of Sobol indices, groups
  5. main transport sensitivity results, interpretation, discussion
  6. conclusions

## Project specific instructions
AGNET: following are not project specific instructions, but plan instructions! 
Make an instruction here to do not mix these anymore.

- Keep the current plain article setup in `main.tex`; do not restore material
  from `report_files/template.tex`.
- Treat the Step 1 restructuring as a permanent change in the active
  manuscript, not as temporary staging.
- Introduce and use `article.bib` for the article build. Copy relevant entries
  there from the report-related `*.bib` files when bibliography restructuring
  is performed.
- Wrap edited prose lines to about 90 characters where practical.
- Section 2 must be populated from the report material; several report sections
  are expected to be copied there during extraction.
- In Section 3, stated parameter values must be supported by specific
  references. When avoiding rewrites, place the references after the copied
  text.
- In subsections corresponding to 3.1.2 and 3.1.3, add bentonite backfill
  parameters as well.
- For Step 2 extraction, do not rewrite the source text at all. Copy, move,
  and reorder only.
- During extraction, traverse from `main.tex` through the active `\input`
  structure instead of patching isolated files without checking how they are
  referenced.
- Keep only text that supports the transport sensitivity analysis narrative.
- `param_review.tex` is the repository mapping for "chapter 3".


# Generic instructions
Follow unless repository specific instruction dosn't explicitly say otherwise.

## 1. Repository workflow

- Use `build.sh` for compilation. Prefer the repository workflow over ad hoc
  LaTeX commands.
- Run the build yourself before completing source edits.
- Do not stage or commit changes (unless explicitely asked for).
- Treat comments containing `AGENT` as local context instructions for the
  surrounding source (previous or subsequent, but usualy within the same edit unit: paragraph / section)
- Preserve comments containing `AGENT`. Keep the original comment and, if
  useful, append at most one short line describing how it was resolved.
- Keep edited source lines near 90 characters where practical.
- If a build fails, try to fix the source or build setup before stopping.
- Run read-only output inspection only when requested or when debugging a build
  or formatting issue.
- For PDF inspection, prefer CLI tools such as `pdftotext` or `pdfinfo`.
- Ask the user to inspect output only after you have completed your own checks.

## 2. Shared scientific-writing rules

### 2.1 Style

- Prefer precise, neutral, evidence-based prose.
- Write densely, but define symbols, assumptions, and technical terms when
  first needed.
- Keep conclusions traceable to results, figures, tables, or cited sources.
- Avoid promotional language, vague claims, and unsupported interpretation.

### 2.2 Math and notation

- Use `$...$` for inline math and `\[...\]` for display math.
- Reuse macros defined in `main.tex`; do not reintroduce raw notation when an
  existing macro covers it.
- Keep notation consistent across the whole document.
- Use project macros for vectors, tensors, operators, norms, and units, e.g.
  `\vc{}`, `\tn{}`, `\grad`, `\div`, `\norm{}`, `\abs{}`.
- Reuse project-specific macros such as `\munit{}`, `\bunit{}`, `\URFB`,
  `\URFBI`, and `\URFBII` where applicable.

### 2.3 Terminology and acronyms

- Preserve established terminology within the manuscript.
- If a glossary is present, keep using it until final cleanup.
- Reuse existing acronyms; avoid introducing new ones unless the document
  clearly requires them.
- On first use in new text, follow the document’s glossary or acronym style
  rather than hardcoding abbreviations.
- Do not alternate between equivalent spellings inside one local context.
- Keep core terms consistent across chapters: `EDZ`, `EIZ`, `HM`, `DFN`,
  `DFM`, `WPT`, `TSX`, `DGR`, `WDP`, `Bukov URF`, `Bukov URF II`.

### 2.4 References, figures, and tables

- Preserve and extend cross-references; never replace them with hardcoded
  numbers.
- Match the local source style for figures, tables, sections, chapters, and
  equations.
- Prefer the existing reference style in the source, including `\figref{...}`
  where available and `\eqref{...}` for equations.
- Label any new section, float, or equation that may be referenced later. Use
  `fig`, `sec`, and `tab` prefixes; equation labels stay without a prefix.
- This rule applies only to newly introduced labels. Do not rename existing
  user-defined labels.
- Captions should make figures and tables understandable on their own, while
  interpretation and detail stay in the main text.
- If the source already states that a figure or table is adapted or reused,
  preserve that attribution.

## 3. Article-specific rules

- Optimize for one clear research question or technical claim.
- Keep only material that supports the paper argument; move broad background to
  short context paragraphs or appendices.
- Prefer a tight structure: introduction, method/model, results, discussion,
  conclusion.
- When shortening text, keep assumptions, parameter definitions, and evaluation
  criteria explicit.
- Figures and tables should carry argumentative weight, not serve as general
  archive material.

## 4. Technical-report-specific rules

- Optimize for traceability, reproducibility, and practical use.
- State scope, inputs, assumptions, methods, outputs, and limitations
  explicitly.
- Prefer complete procedural descriptions over article-style compression when
  the information is needed for reuse or review.
- Keep recommendations tied to observed data, calculations, or stated criteria.
- Use appendices for supporting detail that would interrupt the main flow but
  should remain available to the reader.

## 5. Planning, Resolving doubts and inconsistencies

- When planning the work always ask user for more information if in doubts, 
  instead of guessing the intent.
- Keep a final section in `PLAN.md` for asking user and also log there any unresolved
  manuscript inconsistencies, open questions, and suggestions that you run into 
  during working on the text. 
- If local macros or reference latex commands conflict with these rules, follow the
  actual source and just note the conflict in the planning file.
- If document-specific instructions are missing, infer the document type from
  `main.tex` and state the assumption.
- Use glossary or acronym machinery only if the project already provides it.

## 6. Build configuration

- Use `build.sh` for normal local compilation.
- `build.sh` builds `main.pdf` and, when a Git reference is available, also
  builds `main-d.pdf` as a comparison PDF.
- Use `latexmkrc` for hosted editors such as Overleaf and for direct `latexmk`
  use.
- If a project needs special latexdiff handling for macros, define it in
  `latexmkrc`.
- On Overleaf, a plain build should work without local Git state. If
  `main-old.tex` is present, `latexmkrc` may also build a diff PDF.
