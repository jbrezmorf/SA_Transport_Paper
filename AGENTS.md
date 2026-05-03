# LaTeX sources for planned transport sensitivity analysis paper

## Scope and entry point
- Start from `main.tex`. Treat it as the authoritative entry point, preamble, macro registry, glossary source, and chapter assembly file.
- Traverse edits from `main.tex` to the relevant `\input` files instead of patching isolated chapter files without checking how they are referenced.
- The source commes from a technical report that we need to convert to a paper draft.

## Hard policy

## Writing style
- This is going to be  a paper draft. 
- Prefer precise, neutral, evidence-based prose over promotional or speculative phrasing.
- Keep language consistent with the existing manuscript: technical English, domain-specific terminology, and explicit statement of assumptions, limitations, and interpretation scope.
- Prefer improving clarity, internal consistency, and evidential support over aggressive shortening. Some chapters are intentionally detailed reference chapters.
- When editing conclusions or summaries, make them traceable to the body text. Do not add claims that are not supported somewhere in the included chapters or cited sources.
- Preserve the current style of chapter-local summaries and interpretation paragraphs; several chapters close with explicit summary sections and `main.tex` contains synthesized conclusion paragraphs.

## Math and notation
- Use `$...$` for inline math and `\[...\]` for displayed math.
- Reuse macros from `main.tex` for notation, especially `\grad`, `\div`, `\vc{}`, `\tn{}`, `\norm{}`, `\abs{}`, `\munit{}`, `\bunit{}`, and report-specific shortcuts such as `\URFB`, `\URFBI`, and `\URFBII`.
- Do not reintroduce raw notation where a project macro already exists.
- Keep notation consistent across chapters, especially for HM, transport, DFN/DFM, EDZ/EIZ, pore pressure, conductivity, and stress quantities.

## Terminology and acronyms
- Keep existing gloassry until last formatting touches.
- Use existing accronyms in the new text but do not introduce new accronyms.
- On first use in newly written text, follow the project’s glossary-driven style instead of hardcoding abbreviations.
- Keep core terms consistent across chapters: `EDZ`, `EIZ`, `HM`, `DFN`, `DFM`, `WPT`, `TSX`, `DGR`, `WDP`, `Bukov URF`, `Bukov URF II`.
- Respect established spelling already used in the manuscript. Do not arbitrarily switch between variants such as "pore pressure" and "pore-pressure" inside the same local context.

## References, figures, tables
- Preserve and extend cross-references rather than replacing them with hardcoded numbering.
- Prefer the existing reference style in the source:
  - `\figref{...}` for figures where available
  - `Fig.~\ref{...}`, `Tab.~\ref{...}`, `Section~\ref{...}`, `Chapter~\ref{...}` elsewhere, matching local style
  - `\eqref{...}` for equations
- Every new float, equation, section target, or table that may be referenced later should get a label.
- Keep captions technical and informative. If a figure is reused from an external source, preserve or improve source attribution already present in the caption or surrounding text.

## Chapter and file conventions
- `main.tex` owns the preamble, macros, title page, report metadata, glossary definitions, chapter order, and final conclusions.
- We will try to flatent the structure iteratively.
- Current other sources:
  - `bentonite.tex`
  - `param_review.tex`
  - `model_comparison.tex`
  - `plasticity.tex`
  - `05_chapter_excavation.tex`
  - `06_pore_pressure_experiment.tex`
  - `06_fractures.tex`
  - `06_TSX_heterogeneity.tex`
  - `transport.tex`

## Consistency checks to perform on touched text
- Check terminology consistency against `main.tex` and neighboring chapters.
- Check that claims in summaries and conclusions match the detailed chapter results.
- Check acronym expansion and glossary usage.
- Check references, labels, and citation keys.
- Check units and numeric formatting for consistency with `siunitx` usage already present in the project.
- Check that newly added text does not leave unresolved TODO markers, author comments, or placeholder wording.

## Editing priorities
- Prioritize:
  1. factual and terminology consistency across chapters
  2. clear interpretation of results and limitations
  3. correct cross-references, citations, captions, and notation
  4. grammar and style polish
- Be conservative with structural rewrites. This repository contains long, interdependent technical chapters; local edits can easily break report-level consistency.

## Build and verification
- Do not request a project build from the user as part of the editing workflow. CODEX can run the build on its own.
- Do the read-only verification steps after the build: inspect generated PDF using Linux CLI tools such as `pdftotext`, `pdfinfo`, or similar read-only utilities.
  Do this inspection only if requested or if fixing a build issue.
- In the case of bild errors try to fix them.

## Current project goals inferred from the repository
- Improve text in section 6.
- Improve conclusions in section 5.
- Maintain report-wide consistency and final technical polish.
