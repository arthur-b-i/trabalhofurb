library(WDI)
library(tidyverse)

# Dados: Série temporal do Brasil
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NE.TRD.GNFS.ZS')

dadospib2023 <- WDI(country = 'all',
                    indicator = 'NE.TRD.GNFS.ZS',
                    start = 2023, end = 2023)


# Gráfico aprimorado
grafserie_apresentavel <- ggplot(dadospibbr, aes(x = year, y = NE.TRD.GNFS.ZS)) +
  geom_line(color = "#1f77b4", size = 1.2) +  # linha azul mais grossa
  labs(title = "Trade (% do PIB) - Brasil",
       x = "Ano",
       y = "Trade") +
  theme_minimal(base_size = 14) +  # tema mais limpo e fonte maior
  theme(
    axis.title.x = element_text(color = "#E76F51", size = 14, face = "bold"),  # eixo x cor laranja
    axis.title.y = element_text(color = "#2A9D8F", size = 14, face = "bold"),  # eixo y cor verde
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),  # centralizar título
    axis.text = element_text(color = "gray20")  # cor dos números dos eixos
  )

print(grafserie_apresentavel)



dadospib <- WDI(country = 'all', indicator = 'NE.TRD.GNFS.ZS')



grafpainel_apresentavel <- ggplot(dadospib, aes(x = year, y = NE.TRD.GNFS.ZS)) +
  geom_point(color = "#264653", alpha = 0.5) +  # pontos azul escuro com transparência
  labs(title = "Trade (% do PIB) - Painel Global",
       x = "Ano",
       y = "Trade") +
  theme_minimal(base_size = 14) +
  theme(
    axis.title.x = element_text(color = "#E76F51", size = 14, face = "bold"),
    axis.title.y = element_text(color = "#2A9D8F", size = 14, face = "bold"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.text = element_text(color = "gray20")
  )

print(grafpainel_apresentavel)






# Remover valores NA e ordenar por valor
dadospib2023_clean <- dadospib2023 %>%
  filter(!is.na(NE.TRD.GNFS.ZS)) %>%
  arrange(desc(NE.TRD.GNFS.ZS)) %>%
  slice_max(NE.TRD.GNFS.ZS, n = 20)  # mostra os 20 maiores valores

grafcorte_apresentavel <- ggplot(dadospib2023_clean, aes(x = reorder(country, NE.TRD.GNFS.ZS), 
                                                         y = NE.TRD.GNFS.ZS)) +
  geom_col(fill = "#F4A261") +
  coord_flip() +  # vira o gráfico na horizontal
  labs(title = "Trade (% do PIB) - Top 20 Países (2023)",
       x = "País",
       y = "Trade") +
  theme_minimal(base_size = 14) +
  theme(
    axis.title.x = element_text(color = "#E76F51", size = 14, face = "bold"),
    axis.title.y = element_text(color = "#2A9D8F", size = 14, face = "bold"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.text = element_text(color = "gray20")
  )

print(grafcorte_apresentavel)

