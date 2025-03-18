# WDI - WORLD DEVELOPMENT INDICATORS #

#install.packages("WDI")
library(WDI) # sempre chamar o pacote. #

# procurar as vignettes #
# paginas com instrucoes de pacotes #

# GDP (current US$)(NY.GDP.MKTP.CD)
# pib em precos correntes em usd
# codigo NY.GDP.MKTP.CD

# vamos pesquisar o termo GDP no WDI

varpib <- WDIsearch('gdp') # criar objeto com res.

# buscar os dados com o codigo que temos #

dadospib2023 <- WDI(country = 'all',
indicator = 'NY.GDP.MKTP.CD',
start = 2023, end = 2023)

dadospib <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD')

options(scipen = 999) # ajusta notacao cientifica #

