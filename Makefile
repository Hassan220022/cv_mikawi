make:
	@echo "Making..."
	# Compile the main tex file
	pdflatex mikawi_CV.tex
	@echo "Cleaning up..."
	make clean

.PHONY: make

# Define a make rule named clean
clean:
	@echo "Cleaning up..."
	rm mikawi_CV.aux mikawi_CV.log mikawi_CV.out
.PHONY: clean
