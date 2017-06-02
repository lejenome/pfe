DIFF_REV:=v0.4.0

default: presentation.tex
	pdflatex presentation.tex -o presentation.pdf

all: report

report: presentation.tex
	mkdir -p ../build
	+latexmk -jobname=../build/presentation presentation.tex

diff:
	mkdir -p build
	+latexdiff-vc --git -r $(DIFF_REV) presentation.tex -d build/old-$(DIFF_REV) --flatten --force
	+latexmk -jobname=build/diff build/old-$(DIFF_REV)/presentation.tex -f

watch: presentation.tex
	mkdir -p build
	+latexmk -jobname=../build/presentation presentation.tex -pvc

%.nls: %.nlo
	+makeindex $*.nlo -s nomencl.ist -o $*.nls

%.gls: %.aux
	+makeglossaries $*

%.pdf: %.tex FORCE_MAKE
	pdflatex %

clean:
	-latexmk -C
	-rm -rf build *.aux _minted-build */*-converted-to.*
	# *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg
	# *.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out
	# *.bbl *.blg *.dvi *.tdo _minted-main _minted-build *.pyg *.synctex.gz

.PHONY: FORCE_MAKE
