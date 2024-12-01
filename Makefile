# Main target to handle the full process
all:
	@echo "Making..."
	# Compile the main tex file
	pdflatex mikawi_CV.tex
	clear
	@echo "Cleaning up..."
	$(MAKE) clean
	# Convert PDF to PNG
	convert -density 300 -trim mikawi_CV.pdf -quality 100 -flatten mikawi_CV.png
	
	# Move the generated PNG to a specific directory
	mv mikawi_CV.png PNG/
	open -a /Applications/Google\ Drive.app # Open Google Drive app
	sleep 5  # Wait for 5 seconds to ensure Google Drive is fully loaded
	
	# Copy the generated PDF to multiple destinations
	for dest in "/Users/mikawi/Nextcloud/Documents/CV" "/Users/mikawi/Library/CloudStorage/GoogleDrive-hassansherif122202@gmail.com/My Drive/CV" "/Users/mikawi/Library/Mobile Documents/com~apple~CloudDocs/CV"; do \
		cp mikawi_CV.pdf "$$dest"; \
	done
	sleep 1  # Wait for 5 seconds to ensure the copying process is completed

	# Clean up MacOS specific files and finalize the process
	rm -f .DS_Store
	git add .
	git commit -m "Update CV"
	git push
	clear

# Define a make rule named clean
clean:
	@echo "Cleaning up..."
	rm -f mikawi_CV.aux mikawi_CV.log mikawi_CV.out

.PHONY: all clean
