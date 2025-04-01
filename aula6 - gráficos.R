# AULA 6
# COPIEM O CÓDIGO DA AULA 5 (AVA)

# API (PORTA/FORMA DE ACESSO REMOTO)
# ACESSAMOS OS DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (WDI)
# INDICADORES DE DESENVOLVIMENTO MUNDIAL

# PIB (PRODUTO INTERNO BRUTO)

#install.packages('WDI')
library(WDI) # CARREGAR BIBLIOTECA/PACOTE

options(scipen = 999) # REMOVER A NOT. CIENT.
# DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NE.TRD.GNFS.ZS')

paises <- c('BR', 'US')

dadospibbrus <- WDI(country = paises,
                    indicator = 'NE.TRD.GNFS.ZS')

# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NE.TRD.GNFS.ZS',
                    start = 2023, end = 2023)

# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NE.TRD.GNFS.ZS')

# GRÁFICOS
# BIBLIOTECA ggplot2 (tidyverse)
#install.packages("tidyverse")
library(tidyverse)

## DADOS EM PAINEL

grafpainel <- ggplot(dadospib,
                     mapping = aes(y = NE.TRD.GNFS.ZS,
                                   x = year)) +
  geom_point()

print(grafpainel)

# CORTE TRANSVERSAL

grafcorte <- ggplot(dadospib2023,
                    mapping = aes(y = NE.TRD.GNFS.ZS,
                                  x = year)) +
  geom_point()

print(grafcorte)

# SÉRIE TEMPORAL

grafserie <- ggplot(dadospibbr,
                    mapping = aes(y = NE.TRD.GNFS.ZS,
                                  x = year)) +
  geom_line()

print(grafserie)