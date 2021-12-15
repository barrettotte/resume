SRC = barrettotte-resume.tex

default: build

build:	clean
	pdflatex $(SRC)

clean:
	rm -f *.aux *.log *.out *.pdf
