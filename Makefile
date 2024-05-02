make:
	@echo "Making..."
	# Compile the main tex file
	pdflatex mikawi_CV.tex
	@echo "Cleaning up..."
	make clean
	convert -density 300 -trim mikawi_CV.pdf -quality 100 -flatten mikawi_CV.png
	mv mikawi_CV.pdf CV
	git add . && git commit -m "Update CV" && git push

.PHONY: make

# Define a make rule named clean
clean:
	@echo "Cleaning up..."
	rm mikawi_CV.aux mikawi_CV.log mikawi_CV.out
.PHONY: clean
