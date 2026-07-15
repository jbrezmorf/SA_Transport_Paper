# Current goal planning file

Temporary, offten local only.


## AGENT: questions and remarks 

- Put project-specific questions, pointout inconsistency with general rules or inconsistency accros the manuscript.
- First-step extraction guidance moved from `AGENTS.md`:
  - traverse edits from `main.tex` to the relevant `\input` files instead of
    patching isolated chapter files without checking how they are referenced
  - treat transport sensitivity analysis as the primary editorial filter;
    excavation, HM, EDZ/EIZ, bentonite, and fracture-model material should stay
    only when they support that narrative
  - reduce report-style inventory, duplicated background, and broad contextual
    digressions when they do not directly support the paper objective
  - keep the scientific content conservative; condense and reframe aggressively
    if needed, but do not invent new results, interpretations, or literature
    support
  - prioritize material that motivates the model setup, parameter choices,
    uncertainty quantification, sensitivity results, and implications for
    near-field transport
  - when restructuring, prefer moving paper-level framing, synthesis, and
    conclusions toward `main.tex`, and keep satellite files focused on
    distinct technical content
  - before expanding a section, check whether the same point is already made in
    another included file; duplicated report-era exposition should usually be
    merged or removed
  - check that each touched section still contributes clearly to the paper’s
    central transport sensitivity analysis argument and that summaries and
    conclusions reflect paper logic rather than report chronology
- Editing suggestions moved from `AGENTS.md`:
  - remove SURAO template and use a standard LaTeX report template
  - remove chapter 02 (bentonite), chapter 4 (hydro-mechanical modelling),
    and chapter 5 experiment interpretation from the main document, but keep
    them as supporting material
  - turn chapter 06 into the article core, use the introduction as the first
    section, and refactor chapter 3 plus the dispersion and essential
    properties discussion from the bentonite chapter into one separate section
    without mixing it into the existing transport text
  
