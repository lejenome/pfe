DIFF_REV:=v0.4.0

all: report

report: report.tex FORCE_MAKE
	mkdir -p build
	+latexmk -jobname=build/report report.tex

presentation: presentation.tex FORCE_MAKE
	mkdir -p build
	+latexmk -jobname=build/presentation presentation.tex

watch-presentation: presentation.tex
	mkdir -p build
	+latexmk -jobname=build/presentation presentation.tex -pvc

diff:
	mkdir -p build
	+latexdiff-vc --git -r $(DIFF_REV) report.tex -d build/old-$(DIFF_REV) --flatten --force
	+latexmk -jobname=build/diff build/old-$(DIFF_REV)/report.tex -f

watch: report.tex
	mkdir -p build
	+latexmk -jobname=build/report report.tex -pvc

%.nls: %.nlo
	+makeindex $*.nlo -s nomencl.ist -o $*.nls

%.gls: %.aux
	+makeglossaries $*

%.pdf: %.tex FORCE_MAKE
	pdflatex %

clean:
	-latexmk -C
	-rm -rf build *.aux report/*.aux _minted-build */*-converted-to.*
	# *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg
	# *.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out
	# *.bbl *.blg *.dvi *.tdo _minted-main _minted-build *.pyg *.synctex.gz

.PHONY: FORCE_MAKE
