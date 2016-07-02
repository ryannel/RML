source("./src/Init/init.R")

linear <- App$Model$Linear$Model$Actual()
        
print(summary(linear$model))
