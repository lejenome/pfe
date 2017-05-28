DIFF_REV:=v0.3.0

all: report

report: main.tex
	mkdir -p build
	+latexmk -jobname=build/report main.tex

diff:
	mkdir -p build
	+latexdiff-vc --git -r $(DIFF_REV) main.tex -d build/old-$(DIFF_REV) --flatten --force
	+latexmk -jobname=build/diff build/old-$(DIFF_REV)/main.tex -f

watch: main.tex
	mkdir -p build
	+latexmk -jobname=build/report main.tex -pvc

%.nls: %.nlo
	+makeindex $*.nlo -s nomencl.ist -o $*.nls

%.gls: %.aux
	+makeglossaries $*

clean:
	-latexmk -C
	-rm -rf build *.aux _minted-build */*-converted-to.*
	# *.lof *.fls *.glg *.acn *.acr *.alg *.aux *.glo *.gls *.ilg
	# *.ist *.lof *.log *.lol *.lot *.nlo *.nls *.toc *.fdb* *.out
	# *.bbl *.blg *.dvi *.tdo _minted-main _minted-build *.pyg *.synctex.gz

.PHONY: FORCE_MAKE
