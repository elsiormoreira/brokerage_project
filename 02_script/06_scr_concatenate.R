

# concatenate the same type data string
concat_1 <- str_c(c1, c2, c3, sep = ';') %>% 
        str_squish()
concat_2 <- str_squish(str_c(c4, c5, c6, c7_name, c8_name, sep = ' '))
concat_3 <- str_squish(str_c(c7_obs, c8_obs, c9_obs, sep = ' '))
concat_4 <- str_remove(str_squish(str_c(c7_quant, c8_quant, c9_quant, c10_quant, sep = ' ')), '\\.')
concat_5 <- str_remove(str_squish(str_c(c8_price, c9_price, c10_price, c11_price, sep = ' ')), '\\.') %>% 
        str_replace('\\,', '\\.')
concat_6 <- str_remove(str_squish(str_c(c9_total, c10_total, c11_total, c12_total, sep = ' ')), '\\.') %>% 
        str_replace('\\,', '\\.')
concat_7 <- str_squish(str_c(c10_dc, c11_dc, c12_dc, sep = ' '))


# insert especific delimiter to further split
concat_all <- str_c(concat_1, 
                    concat_2, 
                    concat_3, 
                    concat_4, 
                    concat_5, 
                    concat_6, 
                    concat_7, 
                    sep = ';')
