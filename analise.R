
library(tidyverse)
library(readxl)
library(sf)


dados <- read_excel("dados/caixa-tempo.xlsx") %>% 
    mutate(
        t = seg/60 + min,
        coef = 490 / (t+2.5)
    ) 


dados_sinteticos <- tibble(
    t = seq(0, 25, length.out = 1000)
) %>% 
    mutate(
        c = 490 / (x + 2.5)
    )



ggplot(
    dados_sinteticos,
    aes(
        x = c,
        y = t
    )
    ) +
    geom_point(
        data = dados,
        aes(
            y = t,
            x = coef
        ),
        color = "darkblue",
        size = 2
    ) +
    geom_line() +
    theme_minimal()



    

