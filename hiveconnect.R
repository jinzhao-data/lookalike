library(tidyverse)
library(plotly)
library(ggedit)
options(scipen = 200)
data1 <- read.csv("~/Desktop/hist.csv")
chart <- filter(data1, t1.cd < 50) %>% ggplot(aes(x = t1.cd, y = g, colour = as.factor(t1.dt))) + 
    geom_line()
p <- ggplotly(chart)
p
ggedit(chart)
library(RJDBC)
drv <- JDBC("org.apache.hive.jdbc.HiveDriver", list.files("~/Documents/software/apache-hive-1.2.2-bin/lib", 
    pattern = "jar$", full.names = TRUE, recursive = TRUE))
conn <- dbConnect(drv, sprintf("jdbc:hive2://192.168.2.47/:8888/default"), "jinzhao", 
    "mp!jinzhao")


con <- dbConnect(RPresto::Presto(), host = "47.93.29.9", port = 8080, user = "yanagishima", 
    schema = "default", catalog = "hive", source = "yanagishima")
