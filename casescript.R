library(tidyverse)

univ <- read_csv("data/universities.csv")
head(univ)

pay1 <- read_csv("data/UK Gender Pay Gap Data - 2017 to 2018.csv")
head(pay1)

pay2 <- read_csv("data/UK Gender Pay Gap Data - 2018 to 2019.csv")
head(pay2)

pay3 <- read_csv("data/UK Gender Pay Gap Data - 2019 to 2020.csv")
head(pay3)

pay4 <- read_csv("data/UK Gender Pay Gap Data - 2020 to 2021.csv")
head(pay4)

pay5 <- read_csv("data/UK Gender Pay Gap Data - 2021 to 2022.csv")
head(pay5)

pay6 <- read_csv("data/UK Gender Pay Gap Data - 2022 to 2023.csv")
head(pay6)

pay7 <- read_csv("data/UK Gender Pay Gap Data - 2023 to 2024.csv")
head(pay7)

pay8 <- read_csv("data/UK Gender Pay Gap Data - 2024 to 2025.csv")
head(pay8)

df <- rbind(pay1,pay2,pay3,pay4,pay5,pay6,pay7,pay8)

df1 <- inner_join(univ, df, by = "EmployerId") 

df1 <- df1 %>%
  mutate(due_year = year(DueDate))

df1 %>%
  count(pre92, due_year) %>%
  pivot_wider(names_from = due_year, values_from = n)

df1 %>%
  count(EmployerName.x,due_year) %>%
  pivot_wider(names_from = due_year, values_from = n) %>%
  na.omit() %>%
  print(n=90)

df1 %>%
  group_by(due_year, pre92) %>%
  summarise(meanscore = mean(DiffMeanHourlyPercent), 
            medianscore = median(DiffMeanHourlyPercent),
            sdscore = sd(DiffMeanHourlyPercent),
            IQR(DiffMeanHourlyPercent))





