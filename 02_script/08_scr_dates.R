
# extract header top right corner dates

# filter date
dates <- text_raw %>% 
        str_split('\r\n') %>% 
        unlist() %>% 
        as.vector() %>% 
        str_squish() %>% 
        str_subset('\\d{4}\\s\\d{1}\\s\\d{2}\\/\\d{2}\\/\\d{4}$') %>% 
        str_remove_all('\\d+\\s\\d{1}\\s')