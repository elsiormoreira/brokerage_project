

# convert as tibble
df <- tbl_df(concat_all)


# split column
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