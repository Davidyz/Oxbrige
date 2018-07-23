#!/usr/bin/env Rscript
youtube_us <- read.csv('/home/david/git/Oxbrige/BigData/Project_data/YouTube_trending_videos/USvideos.csv')
youtube_ca <- read.csv('/home/david/git/Oxbrige/BigData/Project_data/YouTube_trending_videos/CAvideos.csv')
hist(log10(youtube_us$likes), 
     freq = FALSE)
abline(v = median(youtube_us$likes))
boxplot(log10(youtube_us$likes), xlab = 'Youtube_us Likes', main = 'Youtube_us Likes')