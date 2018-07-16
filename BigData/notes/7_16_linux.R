#!/usr/bin/env Rscript
youtube_us <- read.csv('/home/david/git/Oxbrige/BigData/Project_data/YouTube_trending_videos/USvideos.csv')
youtube_ca <- read.csv('/home/david/git/Oxbrige/BigData/Project_data/YouTube_trending_videos/CAvideos.csv')
plot(density(youtube_us$likes))
abline(v=mean(youtube_us$likes), col = 'red')
abline(v=median(youtube_us$likes), col = 'blue')
