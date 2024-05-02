# Load the user's LaTeX file to examine and modify it
file_path = 'main.tex'
with open(file_path, 'r') as file:
    tex_content = file.readlines()

# Define the necessary changes:
# 1. Check for inclusion of lmodern package for better font support
# 2. Adjust the footskip value as per fancyhdr warning
# 3. Ensure the document is rerun enough times by adding comments suggesting this

# Insert lmodern package for better font support
for i, line in enumerate(tex_content):
    if '\\documentclass' in line:
        # Insert after \documentclass line
        tex_content.insert(i+1, '\\usepackage{lmodern} % Provides a wide range of font shapes\n')
        break

# Adjust footskip
footskip_adjusted = False
for i, line in enumerate(tex_content):
    if '\\setlength{\\footskip}' in line:
        tex_content[i] = '\\setlength{\\footskip}{10pt} % Adjusted footskip to prevent footer overlap\n'
        footskip_adjusted = True
        break
if not footskip_adjusted:
    # Insert before \begin{document}
    for i, line in enumerate(tex_content):
        if '\\begin{document}' in line:
            tex_content.insert(i, '\\setlength{\\footskip}{10pt} % Adjusted footskip to prevent footer overlap\n')
            break

# Save the modified file
modified_file_path = 'modified_main.tex'
with open(modified_file_path, 'w') as file:
    file.writelines(tex_content)

modified_file_path