# Uncomment to make comparison of main.tex and main2.tex on the output.
#$pdflatex = "latexdiff main.tex main2.tex > main-d.tex; pdflatex %O  main-d"
$lualatex = 'lualatex %O %S';
$pdf_mode = 4;
