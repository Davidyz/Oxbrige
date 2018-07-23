dat_us <- read.csv('/home/david/git/Oxbrige/BigData/Project_data/YouTube_trending_videos/USvideos.csv')
dat_ca <- read.csv('/home/david/git/Oxbrige/BigData/Project_data/YouTube_trending_videos/CAvideos.csv')

#bivariate_analysis
likes_us <- dat_us$likes
views_us <- dat_us$views
log10_likes <- log10(likes_us + 1)
log10_views <- log10(views_us + 1)

plot(x = log10_views,
     y = log10_likes,
     abline(result, col = 'green'))

rug(log10_likes, side = 2)
rug(log10_views, side = 1)

#covariance
cov(log10_likes, log10_views)

#corelation(only for linear relations)
cor(log10_likes, log10_views)
plot(log10_likes, log10_views,
     xlab = 'likes',
     ylab = 'views')

#linear regression
result <- lm(log10_likes ~ log10_views)
summary(result)