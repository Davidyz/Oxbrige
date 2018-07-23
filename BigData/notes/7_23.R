library(HSAUR2)
library(ggplot2)
library(rafalib)
library(corrplot)
library(pheatmap)

pots <- pottery[,1:9]
corrmat <- cor(pots)

corrplot(corrmat, type = "upper", method = 'ellipse', order = 'hclust')
distmat <- dist(pots)
tree <- hclust(distmat)
plot(tree) # the heights of the branches are proportional to the distances between the groups.

mycolors <- colorRampPalette(c("blue","white","red"))(1000)
pheatmap(pots, scale = "column", col=mycolors, fontsize_row = 5) # plot the heatmap.