
all: sparql.pdf

sparql.tex: sparql.Rnw
	R CMD Sweave sparql.Rnw

sparql.pdf: sparql-blx.bbl sparql.bib sparql.tex
	pdflatex sparql.tex
	pdflatex sparql.tex
	pdflatex sparql.tex

sparql.aux: sparql.bib sparql.tex
	pdflatex sparql.tex

sparql-blx.bbl: sparql.aux
	bibtex sparql

clean:
	@rm -f *.aux *.log *.bbl *.out *.blog sparql*.tex sparql*.pdf sparql-blx* *.blg
