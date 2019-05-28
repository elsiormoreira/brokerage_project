
## extract words from sentences and group them by column position

# find maximum number of words of all senteces
max_word <- max(str_count(text_clean, '\\s') + 1)

# create an empty vector and list to recieve names and data columns
col_names <- vector()
col_data <- list()

# loop over names and data
for (i in 1:max_word) {
        # loop over max number words to create all column names
        col_names[i] <- paste0('c', i)
        # loop over each sentence on text_clean and extract group 
        # of words by position
        col_data[[i]] <- word(text_clean, i)
        # asociate each group of data to a column name
        #col_names[i] <- col_data[[i]]
}

names(col_data) <- col_names
as.vector(col_data[1])
c1
c2
