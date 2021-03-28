library(dplyr)
library(forcats)
data <- read.csv("data.csv")

data <- data%>%
  mutate(stack = as.factor(stack))

ls(unique(data$stack))
