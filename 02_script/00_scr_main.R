
#-------------------------------------------------------------------------
#
# This is the main script from 'Brokerage Project'. This code extract
# all content from pdf files stored into DATA folder, filter  
# information presented inside tables and discard everything else. Clean
# and organize all extracted data as a dataframe/tibble, save it 
# as 'csv', 'txt' and 'xlsx' files for future analysis.
# 
# For project reproducibility run this main code ('scr_main.R') first.
# Don't forget to take a look on 'README.md' file before.
#                                                                        
# author; Elsior Moreira Alves Junior               date: May 28, 2019
# email: elsiormoreira@gmail.com
#
#--------------------------------------------------------------------------


# load library
source("02_script/01_scr_requirements.R", echo = F)

# read and extract raw data from pdf files 
source("02_script/02_scr_files.R", echo = F)

# prepare raw data for word extraction
source("02_script/03_scr_clean.R", echo = F)

# extract group of words from each sentence delimited by whitespace
source("02_script/04_scr_column_words.R", echo =F)

# filter words by same type information
source("02_script/05_scr_filter_data.R", echo = F)

# arrange words by same type
source("02_script/06_scr_concatenate.R", echo = F)

# transform data into dataframe/tibble
source("02_script/07_scr_create_tibble.R", echo = F)

# extract header page dates
source("02_script/08_scr_dates.R", echo = F)

# export csv, txt and xlsx files
source("02_script/09_scr_export.R", echo = F)





