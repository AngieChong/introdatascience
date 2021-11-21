library(haven)
data <- read_sav("https://mmi.psycho.unibas.ch/r-toolbox/data/Cars.sav")

library(sjlabelled)
get_label(data)
get_labels(data)


library(tibble)
simple_codebook <- enframe(get_label(data))
colnames(simple_codebook) <- c("variable_id", "item_text")
simple_codebook

library(psych)
library(dplyr)

descriptives <- data %>% describe() %>% as_tibble() %>% select("n","min","max","mean")
simple_codebook <- cbind(simple_codebook,descriptives)
simple_codebook
