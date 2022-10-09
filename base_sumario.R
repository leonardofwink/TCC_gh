
# sumario_od_p1 -----------------------------------------------------------
(sum_od_p1 <- plan_wide_19902020 %>%
  select(CODIGO, oxigenio_dissolvido, ANO_COLETA) %>% 
  filter(ANO_COLETA > "1990" &
           ANO_COLETA <= "2000") %>% 
  group_by(CODIGO) %>% 
  # CODIGO == "87398500" <- "teste1"
  # %>% 
  summarize(
    max = 
      max(oxigenio_dissolvido, na.rm = TRUE),
    q3 = 
      quantile(oxigenio_dissolvido, 0.75, na.rm = TRUE),
    median = 
      median(oxigenio_dissolvido, na.rm = TRUE),
    mean = 
      mean(oxigenio_dissolvido, na.rm= TRUE),
    q1 = 
      quantile(oxigenio_dissolvido, 0.25, na.rm = TRUE),
    min = 
      min(oxigenio_dissolvido, na.rm = TRUE),
    n = 
      length(oxigenio_dissolvido)
  ) %>% 
  pivot_longer(
    !CODIGO,
    names_to = "par",
    values_to = "valor"
  ) %>% 
  pivot_wider(names_from = CODIGO,
              values_from = valor) %>% 
  rename(
    "PM1" = "87398500",
    "PM2" = "87398900",
    "PM3" = "87398950",
    "PM4" = "87398980",
    "PM5" = "87405500",
    "PM6" = "87406900",
    "PM7" = "87409900"
  ) 
)



# base_sumarios -----------------------------------------------------------
(base_sumarios <- parametros_IQA %>% 
   group_by(ANO_COLETA) %>%
   pivot_longer(
     cols = c(
       !CODIGO,
       # !ANO_COLETA
     ),
     names_to = "parametro",
     values_to = "valor",
   ) %>% 
   pivot_wider(
     names_from = CODIGO,
     values_from = valor,
     # values_fill = NA_real_
     id_cols = parametro
     # .groups = "drop"
   ) %>% 
   rename(
     "PM1" = "87398500",
     "PM2" = "87398900",
     "PM3" = "87398950",
     "PM4" = "87398980",
     "PM5" = "87405500",
     "PM6" = "87406900",
     "PM7" = "87409900"
   ) %>%
   select(parametro, PM1, PM2, PM3, PM4, PM5, PM6, PM7) %>%
   pivot_longer(
     !parametro,
     names_to = "CODIGO",
     values_to = "valor"
   ) %>% 
   unnest() %>% 
   pivot_wider(
     names_from = parametro,
     values_from = valor
   ) %>% 
   unnest() %>% 
   pivot_longer(
     pH:Condutividade,
     names_to = "parametro",
     values_to = "valor_medido"
   ) %>% 
  select(
    CODIGO, parametro, valor_medido, ANO_COLETA
  ) %>% 
   group_by(CODIGO) %>% 
   filter(
     parametro == "pH"
   ) %>% 
   summarize(
     max =
       max(valor_medido, na.rm = TRUE),
     q3 =
       quantile(valor_medido, 0.75, na.rm = TRUE),
     median =
       median(valor_medido, na.rm = TRUE),
     mean =
       mean(valor_medido, na.rm= TRUE),
     q1 =
       quantile(valor_medido, 0.25, na.rm = TRUE),
     min =
       min(valor_medido, na.rm = TRUE),
     n =
       length(valor_medido)
   ) %>% 
   pivot_longer(
     !CODIGO,
     names_to = "par",
     values_to = "valor"
   ) %>% 
   pivot_wider(names_from = CODIGO,
               values_from = valor)
 )
 
 
 base_sumarios %>% 
   pivot_longer(
     id_cols = ANO
   )
  unnest(cols = c(PM1, PM2, PM3, PM4, PM5, PM6, PM7))
  
# ungroup() %>% 
  filter(
    parametro == "oxigenio_dissolvido"
  )
# %>% 
