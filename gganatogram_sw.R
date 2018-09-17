#devtools::install_github("jespermaag/gganatogram")

library(gganatogram)
library(tidyverse)
#install.packages("gridExtra")
library(gridExtra)



hgMale <- gganatogram(data=hgMale_key, fillOutline='#a6bddb', organism='human', sex='male', fill="colour") + theme_void()
hgFemale <- gganatogram(data=hgFemale_key, fillOutline='#a6bddb', organism='human', sex='female', fill="colour") + theme_void()
mmMale <- gganatogram(data=mmMale_key, fillOutline='#a6bddb', organism='mouse', sex='male', fill="colour") + theme_void()
mmFemale <- gganatogram(data=mmFemale_key, outline = T, fillOutline='#a6bddb', organism='mouse', sex='female', fill="colour")  +theme_void()  

grid.arrange(hgMale, hgFemale, mmMale, mmFemale, ncol=4)

#In order to use the function gganatogram, you need to have a data frame with organ, colour, and value if you want to.

organPlot <- data.frame(organ = c("heart", "leukocyte", "nerve", "brain", "liver", "stomach", "colon"), 
                        type = c("circulation", "circulation",  "nervous system", "nervous system", "digestion", "digestion", "digestion"), 
                        colour = c("red", "red", "purple", "purple", "orange", "orange", "orange"), 
                        value = c(10, 5, 1, 1, 2, 5, 5), 
                        stringsAsFactors=F)

head(organPlot)

gganatogram(data = organPlot,
            fillOutline = '#a6bddb',
            organism = 'human',
            sex = 'female',
            fill = 'colour'
            )

organPlot %>% 
  dplyr::filter(type %in% c('circulation', 'nervous system')) %>%
  gganatogram(outline = F, fillOutline = '#a6bddb', organism = 'human', sex='male', fill = 'colour')

# you can use dplyr commands to customise the selected 
hgMale_key %>% 
  dplyr::filter(type %in% c('circulation', 'nervous system')) %>% 
  gganatogram(outline = F, fillOutline = '#a6bddb', organism = 'human', sex = 'male', fill = 'colour')

mmMale_key %>% 
  dplyr::filter(type %in% c('nervous_system', 'other')) %>% 
  gganatogram(outline = F, fillOutline = '#a6bddb',
              organism = 'mouse', sex = 'male', fill = 'colour')




  
  
