# Load packages
#devtools::install_github("mattflor/chorddiag")
library(chorddiag)

data=data.matrix(read.csv(file = "fake_data_chord.csv", row.names = 1))

# Replace NA with 0
data[is.na(data)] <- 0

# Create diagram
p <- chorddiag(data)
p

# Save as widget
library(htmlwidgets)
saveWidget(p, file="relvis.html")
