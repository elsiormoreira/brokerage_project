

# filter column c7 by values type using regex
c7_name <- ifelse(str_detect(c7, '^d$|#|^\\d'), '', c7)
c7_obs <- ifelse(str_detect(c7, '^d$|#|^8d?$'), c7, '')
c7_quant <- ifelse(str_detect(c7, '^\\d\\d\\d|^\\d\\.\\d\\d\\d$'), c7, '')


# filter c8 by values type using regex
c8_name <- ifelse(str_detect(c8, '^d$|#|^\\d'), '', c8)
c8_obs <- ifelse(str_detect(c8, '^d$|#|^8d?$'), c8, '')
c8_quant <- ifelse(str_detect(c8, '^\\d\\d\\d$|^\\d\\.\\d\\d\\d$'), c8, '')
c8_price <- ifelse(str_detect(c8, '^\\d?\\d\\,\\d+$'), c8, '')


# filter c9 by values type using regex
#c9_obs <- 
c9_obs <- ifelse(str_detect(c9, '^d$|#|^8d?$'), c9, '')
c9_quant <- ifelse(str_detect(c9, '^\\d\\d\\d$|^\\d\\.\\d\\d\\d$'), c9, '')
c9_price <- ifelse(str_detect(c9, '^\\d?\\d\\,\\d+$'), c9, '')
c9_total <- ifelse(str_detect(c9, '\\d\\d\\d\\,\\d'), c9, '')


# filter c10 by values type using regex
c10_quant <- ifelse(str_detect(c10, '^\\d\\d\\d$|^\\d\\.\\d\\d\\d$'), c10, '')
c10_price <- ifelse(str_detect(c10, '^\\d?\\d\\,\\d+$'), c10, '')
c10_total <- ifelse(str_detect(c10, '\\d\\d\\d\\,\\d'), c10, '')
c10_dc <- ifelse(str_detect(c10, 'd|c'), c10, '')


# remove NAs from c11 and c12
c11 <- ifelse(is.na(c11), '', c11)
c12 <- ifelse(is.na(c12), '', c12)


# filter c11 by values type using regex
c11_price <- ifelse(str_detect(c11, '^\\d?\\d\\,\\d+$'), c11, '')
c11_total <- ifelse(str_detect(c11, '\\d\\d\\d\\,\\d'), c11, '')
c11_dc <- ifelse(str_detect(c11, 'd|c'), c11, '')


# filter c12 by values type using regex
c12_total <- ifelse(str_detect(c12, '\\d\\d\\d\\,\\d'), c12, '')
c12_dc <- ifelse(str_detect(c12, 'd|c'), c12, '')
