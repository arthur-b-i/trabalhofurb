library(GetBCBData)
library(tidyverse)
library(gganimate)

# Baixar os dados do BCB
my.id <- c(titulo = 29447)

df.bcb <- gbcbd_get_series(
  id = my.id,
  first.date = '1986-03-06',
  last.date = Sys.Date(),
  format.data = 'long',
  use.memoise = TRUE,
  cache.path = tempdir(),
  do.parallel = FALSE
)

# Ordena por data
df.bcb <- df.bcb %>% arrange(ref.date)

# Gráfico de pontos com animação
p <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_point(color = "cyan", size = 5) +
  labs(
    title = 'Títulos detidos por Residentes - Governo Geral',
    subtitle = 'Data: {frame_time}',
    x = 'Ano', y = 'R$ (milhões)'
  ) +
  theme_dark() +
  transition_time(ref.date) +  # mostra ponto a ponto com o tempo
  shadow_mark(past = TRUE, future = FALSE, alpha = 0.2, size = 5)  # deixa pontos anteriores marcados

# Animação
animate(p, renderer = gifski_renderer(), width = 800, height = 500, duration = 15, fps = 20)

# Salvar (opcional)
anim_save("titulos_pontos_animados.gif")


