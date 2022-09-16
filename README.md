# TCC_gh
Arquivos utilizados na elaboração do meu TCC

# Brief explanation
Every boxplot means a monitoring point (Ponto de monitoramento (or PM) in portuguese). My goal here is to analyze the evolution between decades of each water quality parameter that compounds the Water Quality Index (WQI).

The river flows in the east-west direction as shown in the image below.

![](images/paste-7AD7027F.png)

The logic behind the sorting in the boxplots is because of 2 main reasons:

1.  The original monitoring point isn’t easy to understand (8 digits, like 87409900)
2.  Changing the original nomenclature to PM1, PM2 (…) makes it easier to understand that the last point has water contributions of every other point upstream.

Some features that I want to add: 

* If the parameter is x, then use x’s classes (with its own classes background color plotted) 
    * Define the timescale, should act just like a filter

```{r p1 example}
# plan_wide_19902020 %>%
#   filter(ANO_COLETA > "1990" &
#          ANO_COLETA <= "2000")
```
