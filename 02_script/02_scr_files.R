
## this script create a list of file names that was saved into data folder
## and use a for loop to extract all content inside of each file


# create a list with all file names
file_names <- dir('./01_data', pattern = '*NotaCorretagem*')


# extract text from each file and append into a list
text_raw <- list()
for (i in 1:length(file_names)) {
        # extract text from pdf file and save it as 'doc' variable
        doc <- pdf_text(file.path('.', '01_data', file_names[i]))
        # append 'doc' to 'text_raw' list
        text_raw <- append(text_raw, doc)
}