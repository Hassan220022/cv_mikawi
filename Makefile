make:
	@echo "Making..."
	# Compile the main tex file
	pdflatex mikawi_main.tex
	@echo "Cleaning up..."
	make clean

.PHONY: make

# Define a make rule named clean
clean:
	@echo "Cleaning up..."
	rm mikawi_main.aux mikawi_main.log mikawi_main.out
.PHONY: clean
