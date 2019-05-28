
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