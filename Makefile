all: main.pdf

%.pdf: %.tex
	+makeindex $*.nlo -s nomencl.ist -o $*.nls
	+makeglossaries $*
	+xelatex -shell-escape $<
