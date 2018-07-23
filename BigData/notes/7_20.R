library(rvest)
library(ggplot2)
library(ggrepel)
library(wordcloud)
webpage <- read_html("http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature")

title_data_html <- html_nodes(webpage,'.lister-item-header a') # get the titles
title_data <- html_text(title_data_html) # transform the titles from HTML to text

rank_data_html <- html_nodes(webpage,'.text-primary') # get the rankings
rank_data <- as.numeric(html_text(rank_data_html))

runtime_data_html <- html_nodes(webpage, '.runtime') # get the durations
runtime_data <- html_text(runtime_data_html)
runtime_data <- runtime_data[-1]
runtime_data <- as.numeric(gsub(' min', '', runtime_data))

genre_data_html <- html_nodes(webpage, '.genre') # get the genres(styles)
genre_data <- html_text(genre_data_html)
genre_data <- gsub('\n', '', genre_data)
genre_data<-gsub(",.*","",genre_data)
genre_data <- gsub(' ', '', genre_data)
genre_data<-as.factor(genre_data)

rating_data_html <- html_nodes(webpage,'.ratings-imdb-rating strong') # get IMDB ratings
rating_data <- html_text(rating_data_html)
rating_data<-as.numeric(rating_data)

description_data_html <- html_nodes(webpage,'.ratings-bar+ .text-muted') # get description data
description_data <- html_text(description_data_html)
description_data<-gsub("\n","",description_data)
description_data<-gsub("  ","",description_data)

films <- data.frame(Title=title_data, Genre=genre_data,Runtime=runtime_data, Rank=rank_data, IMDB_rating=rating_data, Description=description_data)
