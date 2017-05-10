all: main.pdf

%.pdf: %.tex
	+xelatex -shell-escape $<
	+makeindex $*.nlo -s nomencl.ist -o $*.nls
	+makeglossaries $*
	+xelatex -shell-escape $<

clean:
	-rm -rf *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg \
		*.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out \
		_minted-main main.pdf
