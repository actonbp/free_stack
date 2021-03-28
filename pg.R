library(dplyr)
library(forcats)
data <- read.csv("data.csv")

data <- data%>%
  mutate(stack = as.factor(stack))

ls(unique(data$stack))

stack <- setNames(as.list(data$stack), data$stack)

dat <- data %>% filter(stack %in% data$stack)

dat <- data %>% filter(stack_choice %in% data$stack)

stack_choice <- "RDL20"
