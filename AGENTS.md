# LaTeX sources for transport sensitivity analysis paper draft

## Scope and entry point
- Start from `main.tex`. Treat it as the authoritative entry point, preamble, macro registry, glossary source, and chapter assembly file.
- Traverse edits from `main.tex` to the relevant `\input` files instead of patching isolated chapter files without checking how they are referenced.
- The source comes from a technical report that must be rewritten into a paper draft centred on the transport sensitivity analysis study.

## Hard policy
- Treat the paper focus as the primary editorial filter: excavation, HM, EDZ/EIZ, bentonite, and fracture-model material should support the transport sensitivity analysis narrative rather than remain as standalone report chapters.
- Prefer shaping text toward a paper structure and paper argument. Reduce report-style inventory, duplicated background, and broad contextual digressions when they do not directly support the paper objective.
- Keep the scientific content conservative: condense and reframe aggressively if needed, but do not invent new results, interpretations, or literature support.
- When deciding what to keep, prioritize material that motivates the model setup, parameter choices, uncertainty quantification, sensitivity results, and implications for near-field transport.

## Writing style
- This is going to be a paper draft.
- Prefer precise, neutral, evidence-based prose over promotional or speculative phrasing.
- Keep language consistent with the existing manuscript: technical English, domain-specific terminology, and explicit statement of assumptions, limitations, and interpretation scope.
- Prefer improving clarity, internal consistency, and evidential support over aggressive shortening, but allow substantially stronger compression than in the original report when converting reference-style material into paper-ready text.
- When editing conclusions or summaries, make them traceable to the body text. Do not add claims that are not supported somewhere in the included chapters or cited sources.
- Preserve useful interpretation paragraphs, but rewrite chapter-local summaries that read like report recaps into paper-style transitions, synthesis, or discussion where appropriate.
- Prefer a manuscript voice that explains why each section is needed for the transport sensitivity analysis, not just what was done.

## Paper focus and structure
- The target manuscript should read as a coherent paper on sensitivity analysis of near-field transport, not as a lightly edited technical report.
- Prioritize a compact paper arc:
  1. problem framing and motivation
  2. model and site context needed to understand the transport study
  3. key assumptions, parameterization, and uncertainty inputs
  4. sensitivity-analysis methodology
  5. main transport sensitivity results
  6. interpretation, limitations, and implications
- Move or condense material that is important but secondary to this arc, especially long report-style background, exhaustive parameter surveys, or parallel modelling branches that do not materially affect the transport conclusions.
- Use excavation- and HM-related sections to justify transport-model inputs, boundary conditions, or uncertainty treatment. If such a link is weak, mark that text for reduction or reframing.
- Prefer explicit signposting of the paper contribution, scope, and limitations in introductions, section openings, and conclusions.

## Math and notation
- Use `$...$` for inline math and `\[...\]` for displayed math.
- Reuse macros from `main.tex` for notation, especially `\grad`, `\div`, `\vc{}`, `\tn{}`, `\norm{}`, `\abs{}`, `\munit{}`, `\bunit{}`, and report-specific shortcuts such as `\URFB`, `\URFBI`, and `\URFBII`.
- Do not reintroduce raw notation where a project macro already exists.
- Keep notation consistent across chapters, especially for HM, transport, DFN/DFM, EDZ/EIZ, pore pressure, conductivity, and stress quantities.

## Terminology and acronyms
- Keep existing glossary until the last formatting touches.
- Use existing acronyms in the new text but do not introduce new acronyms.
- On first use in newly written text, follow the project’s glossary-driven style instead of hardcoding abbreviations.
- Keep core terms consistent across chapters: `EDZ`, `EIZ`, `HM`, `DFN`, `DFM`, `WPT`, `TSX`, `DGR`, `WDP`, `Bukov URF`, `Bukov URF II`.
- Respect established spelling already used in the manuscript. Do not arbitrarily switch between variants such as "pore pressure" and "pore-pressure" inside the same local context.
- Prefer terminology that supports the paper focus. For example, use consistent phrasing for "sensitivity analysis", "transport model", "uncertain inputs", "Sobol indices", and "quantity of interest" across sections that contribute to the main argument.

## References, figures, tables
- Preserve and extend cross-references rather than replacing them with hardcoded numbering.
- Prefer the existing reference style in the source:
  - `\figref{...}` for figures where available
  - `Fig.~\ref{...}`, `Tab.~\ref{...}`, `Section~\ref{...}`, `Chapter~\ref{...}` elsewhere, matching local style
  - `\eqref{...}` for equations
- Every new float, equation, section target, or table that may be referenced later should get a label.
- Keep captions technical and informative. If a figure is reused from an external source, preserve or improve source attribution already present in the caption or surrounding text.
- For the paper rewrite, prefer figures and tables that directly support the transport sensitivity analysis narrative. Mark broad report-style reference figures or tables for consolidation, relocation, or removal if they do not carry argumentative weight.

## Chapter and file conventions
- `main.tex` owns the preamble, macros, title page, report metadata, glossary definitions, chapter order, and final conclusions.
- We will try to flatten the structure iteratively.
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
- When restructuring, prefer moving paper-level framing, synthesis, and conclusions toward `main.tex`, and keep satellite files focused on technical content that clearly belongs to a distinct section of the paper.
- Before expanding a section, check whether the same point is already made in another included file; duplicated report-era exposition should usually be merged or removed.

## Consistency checks to perform on touched text
- Check terminology consistency against `main.tex` and neighboring chapters.
- Check that claims in summaries and conclusions match the detailed chapter results.
- Check acronym expansion and glossary usage.
- Check references, labels, and citation keys.
- Check units and numeric formatting for consistency with `siunitx` usage already present in the project.
- Check that newly added text does not leave unresolved TODO markers, author comments, or placeholder wording.
- Check that each touched section still contributes clearly to the paper’s central transport sensitivity analysis argument.
- Check that introductions, summaries, and conclusions reflect paper logic rather than report chronology.

## Editing priorities
- Prioritize:
  0. remove SURAO template, use standard latex report template
  1. remove from main documant but keep as a support material: chapter 02 (bentinite), chapter 4 (hydro mecahnical modelling), 5 experiment interpretation
  2. turn chapter 06 into whole 'article' document, use introcution as first section, refactor chapter 3 and dispeersion and essential properties discussion from the bentonite chapter into
  into single section (do not mix with existing transport text.
  
  1. alignment with the paper focus on sensitivity analysis of near-field transport
  2. factual and terminology consistency across chapters
  3. clear interpretation of results, assumptions, and limitations
  4. correct cross-references, citations, captions, and notation
  5. grammar and style polish
- Be conservative with structural rewrites. This repository contains long, interdependent technical chapters; local edits can easily break report-level consistency.
- Even so, do not preserve report structure by default if it weakens the paper. Prefer controlled, traceable restructuring in small steps.

## Build and verification
- Do not request a project build from the user as part of the editing workflow. CODEX can run the build on its own.
- Do the read-only verification steps after the build: inspect generated PDF using Linux CLI tools such as `pdftotext`, `pdfinfo`, or similar read-only utilities.
  Do this inspection only if requested or if fixing a build issue.
- In the case of build errors, try to fix them.
