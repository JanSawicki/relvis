# Load packages
library(GGally)
library(network)
library(sna)
library(ggplot2)
library(ggnetwork)

# ==== Data processing
# Load data from CSV
adjecencyMatrix = data = read.csv(
  file = "fake_data.csv",
  row.names = 1,
  na.strings = "",
  stringsAsFactors = F
)

# Replace value (not NA) with 1
adjecencyMatrix[!is.na(adjecencyMatrix)] <- 1
# Replace NA with 0
adjecencyMatrix[is.na(adjecencyMatrix)] <- 0
# Converte all columns to numeric
adjecencyMatrix = sapply(adjecencyMatrix, as.numeric)
# Convert data frame to matrix
adjecencyMatrix = matrix(adjecencyMatrix, nc = ncol(adjecencyMatrix))
# Create vertex labels
vertexLabels = colnames(data)
# Create edge labels
edgeLabels = as.vector(t(data))

# ==== Plotting
# old igraph solution
#library(igraph)
# Create graph from adjecency matrix
#graph <- graph_from_adjacency_matrix(adjecencyMatrix)
# Plot the graph
#plot(graph, vertex.label = vertexLabels, edge.label = edgeLabels)
#pdf("rplot.pdf")
#plot(graph, vertex.label = vertexLabels, edge.label = edgeLabels)
#dev.off()

# Set seed to make all graph generation equal
set.seed(1)
# Create network
net = network(
  adjecencyMatrix,
  directed = TRUE,
  multiple = T,
  loops = F
)

ggplot(net, aes(
  x = x,
  y = y,
  xend = xend,
  yend = yend
)) +
  geom_edges(curvature = 0.2,
             arrow = arrow(length = unit(6, "pt"), type = "closed")) +
  geom_nodes(size = 2) +
  #geom_nodetext(aes(label = vertexLabels)) +
  #geom_edgetext_repel(aes(label = edgeLabels), color = "white") +
  theme_blank()
