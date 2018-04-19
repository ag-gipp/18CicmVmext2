$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
@generated_exts = (@generated_exts, 'synctex.gz');
@default_files = ('main.tex');
$bibtex_use = 2;
$pdf_mode = 1;