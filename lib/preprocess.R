extract_keywords <- function(hm_data){
  corpus <- VCorpus(VectorSource(hm_data$cleaned_hm))%>%
    tm_map(content_transformer(tolower))%>%
    tm_map(removePunctuation)%>%
    tm_map(removeNumbers)%>%
    tm_map(removeWords, character(0))%>%
    tm_map(stripWhitespace)
  
  hm_data <- cbind(hm_data, tidy(corpus) %>% select(text))
  colnames(hm_data)[10] <- "norm_hm"
  
  stemmed <- tm_map(corpus, stemDocument) %>%
    tidy() %>%
    select(text)
  
  dict <- tidy(corpus) %>%
    select(text) %>%
    unnest_tokens(dictionary, text)
  
  data("stop_words")
  
  word <- c("happy","ago","yesterday","lot","today","months","month",
            "happier","happiest","last","week","past")
  
  stop_words <- stop_words %>%
    bind_rows(mutate(tibble(word), lexicon = "updated"))
  
  completed <- stemmed %>%
    mutate(id = row_number()) %>%
    unnest_tokens(stems, text) %>%
    bind_cols(dict) %>%
    anti_join(stop_words, by = c("dictionary" = "word"))
  
  completed <- completed %>%
    group_by(stems) %>%
    count(dictionary) %>%
    mutate(word = dictionary[which.max(n)]) %>%
    ungroup() %>%
    select(stems, word) %>%
    distinct() %>%
    right_join(completed) %>%
    select(-stems)
  
  completed <- completed %>%
    group_by(id) %>%
    summarise(text = str_c(word, collapse = " ")) %>%
    ungroup()
  
  hm_data <- hm_data %>%
    mutate(id = row_number()) %>%
    inner_join(completed)
  return(hm_data)
}
