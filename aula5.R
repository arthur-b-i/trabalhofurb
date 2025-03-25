# AULA 5 # 
# API # (PORTA, FORMA DE ACESSO REMOTO)
# ACESSAMOS OS DADOS DO BANCO MUNDIAL
# WORLD DEVELOPMENT INDICATORS (WDI)
# INDICADORES DE DESENVOLVIMENTO MUNDIAL

# PIB - PRODUTO INTERNO BRUTO

library('WDI') # carregar o pacote
options(scipen = 999) # retira a notacao cientifica

dadospib <- WDI(country = 'all',
indicator = 'NY.GDP.MKTP.CD')

paises <- c('BR', 'US')

dadospibbrus <- WDI(country = paises)

# corte transversal #
dadospibbr <- WDI(country = 'BR',
                    indicator = 'NY.GDP.MKTP.CD')

#################################################################################


