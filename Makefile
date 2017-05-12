all: main.pdf

%.pdf: %.tex
	@echo -e "\e[;44mGenerate Pre PDF\e[;m"
	+xelatex -shell-escape $<
	@echo -e "\e[;44mGenerate Nomencl Index\e[;m"
	+makeindex $*.nlo -s nomencl.ist -o $*.nls
	@echo -e "\e[;44mGenerate Glossaries Index\e[;m"
	+makeglossaries $*
	@echo -e "\e[;44mGenerate BibTex\e[;m"
	+bibtex $*
	@echo -e "\e[;44mGenerate PDF\e[;m"
	+xelatex -shell-escape $<

clean:
	-rm -rf *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg \
		*.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out \
		*.bbl *.blg *.dvi *.tdo _minted-main \
		main.pdf
