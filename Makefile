all: report

report:
	mkdir -p build
	+latexmk -pdf -jobname=build/report main.tex -shell-escape -use-make

watch:
	mkdir -p build
	+latexmk -pdf -jobname=build/report main.tex -shell-escape -use-make -pvc

%.nls:
	+makeindex $*.nlo -s nomencl.ist -o $*.nls

%.gls: %.aux
	+makeglossaries $*

main.pdf: main.tex
	@echo -e "\e[;44mGenerate Pre PDF\e[;m"
	+xelatex -shell-escape main.tex
	@echo -e "\e[;44mGenerate Nomencl Index\e[;m"
	+makeindex main.nlo -s nomencl.ist -o main.nls
	@echo -e "\e[;44mGenerate Glossaries Index\e[;m"
	+makeglossaries main
	@echo -e "\e[;44mGenerate BibTex\e[;m"
	+bibtex main
	@echo -e "\e[;44mGenerate PDF\e[;m"
	+xelatex -shell-escape main.tex

clean:
	-rm -rf *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg \
		*.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out \
		*.bbl *.blg *.dvi *.tdo _minted-main \
		build/ main.pdf
