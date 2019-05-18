
## EXTRACT PDF FILE INFORMATION AND GENERATE A CLEAN DATASET

# load library
library(pdftools)
library(tidyverse)


# create a list with all file names
#file_names <- dir('./data', pattern = '*NotaCorretagem*')
file_names <- dir('./data', pattern = '*NotaCorretagem*')


# extract text from each file and append into a list
text_raw <- list()
for (i in 1:length(file_names)) {
        doc <- pdf_text(file.path('.', 'data', file_names[i]))
        text_raw <- append(text_raw, doc)
}

# filter dates
dates <- text_raw %>% 
        str_split('\r\n') %>% 
        unlist() %>% 
        as.vector() %>% 
        str_squish() %>% 
        str_subset('\\d{4}\\s\\d{1}\\s\\d{2}\\/\\d{2}\\/\\d{4}$')
        

# basic clean data for extraction
text_clean <- text_raw %>% 
        str_split('\r\n') %>%
        unlist() %>% 
        as.vector() %>% 
        str_to_lower() %>% 
        str_squish() %>% 
        str_subset('1-bovespa') %>% 
        str_replace('1-', '') %>% 
        str_squish()


# extract each word by position in a sentence
c1 <- word(text_clean, 1)
c2 <- word(text_clean, 2)
c3 <- word(text_clean, 3)
c4 <- word(text_clean, 4)
c5 <- word(text_clean, 5)
c6 <- word(text_clean, 6)

c7 <- word(text_clean, 7)
c8 <- word(text_clean, 8)
c9 <- word(text_clean, 9)
c10 <- word(text_clean, 10)
c11 <- word(text_clean, 11)
c12 <- word(text_clean, 12)


# filter column c7 by values type using regex
c7_name <- ifelse(str_detect(c7, 'd|#|^\\d'), '', c7)
c7_obs <- ifelse(str_detect(c7, 'd|#'), c7, '')
c7_quant <- ifelse(str_detect(c7, '^\\d\\d\\d|^\\d\\.\\d\\d\\d$'), c7, '')


# filter c8 by values type using regex
#c8_name <- 
c8_obs <- ifelse(str_detect(c8, 'd|#'), c8, '')
c8_quant <- ifelse(str_detect(c8, '^\\d\\d\\d|^\\d\\.\\d\\d\\d$'), c8, '')
c8_price <- ifelse(str_detect(c8, '^\\d?\\d\\,\\d+$'), c8, '')


# filter c9 by values type using regex
#c9_obs <- 
c9_quant <- ifelse(str_detect(c9, '^\\d\\d\\d|^\\d\\.\\d\\d\\d$'), c9, '')
c9_price <- ifelse(str_detect(c9, '^\\d?\\d\\,\\d+$'), c9, '')
c9_total <- ifelse(str_detect(c9, '\\d\\d\\d\\,\\d'), c9, '')


# filter c10 by values type using regex
c10_quant <- ifelse(str_detect(c10, '^\\d\\d\\d|^\\d\\.\\d+'), c10, '')
c10_price <- ifelse(str_detect(c10, '^\\d?\\d\\,\\d+$'), c10, '')
c10_total <- ifelse(str_detect(c10, '\\d\\d\\d\\,\\d'), c10, '')
c10_dc <- ifelse(str_detect(c10, 'd|c'), c10, '')


# remove NAs from c11 and c12
c11 <- ifelse(is.na(c11), '', c11)
c12 <- ifelse(is.na(c12), '', c12)


# filter c11 by values type using regex
c11_total <- ifelse(str_detect(c11, '\\d\\d\\d\\,\\d'), c11, '')
c11_dc <- ifelse(str_detect(c11, 'd|c'), c11, '')


# filter c12 by values type using regex
c12_dc <- ifelse(str_detect(c12, 'd|c'), c12, '')


# concatenate the same type data string
concat_1 <- str_c(c1, c2, c3, sep = ';') %>% 
            str_squish()
concat_2 <- str_squish(str_c(c4, c5, c6, sep = ' '))
concat_3 <- str_squish(str_c(c7_obs, c8_obs, sep = ' '))
concat_4 <- str_remove(str_squish(str_c(c7_quant, c8_quant, c9_quant, sep = ' ')),'\\.')
concat_5 <- str_remove(str_squish(str_c(c8_price, c9_price, c10_price, sep = ' ')), '\\.') %>% 
            str_replace('\\,', '\\.')
concat_6 <- str_remove(str_squish(str_c(c9_total, c10_total, c11_total, sep = ' ')), '\\.') %>% 
            str_replace('\\,', '\\.')
concat_7 <- str_squish(str_c(c10_dc, c11_dc, c12_dc, sep = ' '))


# insert especific delimiter to further split vector elements
concat_all <- str_c(concat_1, 
                    concat_2, 
                    concat_3, 
                    concat_4, 
                    concat_5, 
                    concat_6, 
                    concat_7, 
                    sep = ';')


# convert into a tibble
df <- tbl_df(concat_all)


# split single column dataset
df <- separate(df, 
               value, 
               c('negociacao', 'c_v', 'mercado', 'acao', 
                 'obs', 'quantidade', 'preco', 'total', 
                 'd_c'), 
               sep = ';')


# adjust column class
df <- df %>% 
        mutate(quantidade = as.numeric(quantidade)) %>% 
        mutate(preco = as.numeric(preco)) %>%
        mutate(total = as.numeric(total))



# export data as csv and xlsx file
write_csv(df, './output/df.csv')
        
