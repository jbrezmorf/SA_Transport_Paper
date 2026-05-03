# Plan

## Transport chapter larger changes

1. Reconcile the breakthrough-time interpretation between Case 0 and the chapter summary in `transport.tex`.
   Case 0 currently states a breakthrough on the order of `2 ky`, while the summary states the nominal fractured scenario is on the order of `10 ky`.
   Update both places after checking the new figures so the report uses one consistent interpretation.

2. Rewrite the Case 2 parameter-group description in `transport.tex`.
   The current text says bulk-rock and backfill parameters are merged into one material group, but the enumerated list does not clearly reflect that setup.
   Make the grouping description match the actual sampled parameters shown in the new figures and data.

3. Normalize the interpretation structure of Cases 0 to 3 in `transport.tex`.
   For each case, use the same sequence:
   purpose of the case, change relative to Case 0, interpretation of the concentration plot, interpretation of the Sobol plot, and one takeaway sentence.
   This should make the case comparison easier after the new figures were added.

4. Rewrite the Case 3 interpretation in `transport.tex`.
   The motivation is present, but the result paragraph is still generic and does not yet explain what the new `case_00b_*` figures imply physically relative to Case 0.
   Expand this interpretation once the intended meaning of the new figures is settled.

5. Decide whether the chapter summary in `transport.tex` should explicitly include Case 3.
   At present, the summary mainly synthesizes Cases 0 to 2.
   Either extend the summary to cover Case 3 explicitly, or keep the summary scoped to the main analysis cases and state that clearly.
