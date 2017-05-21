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

clean:
	-rm -rf build *.aux _minted-build */*-converted-to.*
	# *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg
	# *.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out
	# *.bbl *.blg *.dvi *.tdo _minted-main _minted-build *.pyg *.synctex.gz
