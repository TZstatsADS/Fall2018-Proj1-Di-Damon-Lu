count_word <- function(s, sep = " "){
  counts <- sapply(strsplit(s, sep), length)
  return(counts)
}

visualize_terms <- function(terms){
  n <- length(terms)
  wordcloud2(data.frame(terms, freq = seq(n * 3, 1, -3)),
             color = "random-light")
}