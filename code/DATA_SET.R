library(tidyverse)
library(lubridate)
library(readxl)
library(openxlsx)

# carregando as bases de dados
# base de dados consolidada por área integrada de segurança pública (AISP)
data <- read.csv("BaseDPEvolucaoMensalCisp.csv", sep = ";")

# base de dados com o número de políciais mortos por AISP
dead_cops <- read.csv("PoliciaisMortos.csv", sep = ";")

# base de dados com o número de armas apreendidas por AISP
seized_guns <- read_xlsx("ArmasApreendidasEvolucaoCisp.xlsx")


# vamos montar uma base com o total de armas apreendidas por mês * aisp * ano e
# renomenado algumas colunas no dataframe de armas apreendidas
seized_guns <- seized_guns %>%
  select(cisp, aisp, risp, ano, mes, total) %>%
  rename("CISP"="cisp", 
         "AISP"="aisp",
         "RISP"="risp")

# vamos tentar cruzar as bases completa e de apreensão de armas
df <- data %>% 
  group_by(ano,mes,AISP,CISP) %>%
  summarise(across(hom_doloso:apreensao_drogas_sem_autor,sum)) %>%
  full_join(seized_guns, by = c("ano","mes","AISP","CISP")) %>%
  filter(ano >= 2022) %>%
  rename("armas_apreendidas"="total") %>%
  distinct() %>%
  na.omit()

# Agora, vamos tratar a base de policiais mortes para juntarmos com a base total
pol_mortos <- dead_cops %>%
  rename("ano"="vano") %>%
  filter(ano >= 2022) %>%
  group_by(ano,mes,CISP) %>% 
  summarise(across(pol_militares_mortos_serv:pol_civis_mortos_serv,sum))

# pegando as AISPs
AISP <- data %>% select(ano,CISP,AISP) %>% filter(ano==2022) %>% select(-ano) %>% distinct()


# Agora, vamos colocar as CISPs em suas respectivas AISPs
pol_mortos <- pol_mortos %>% left_join(AISP, by = "CISP", all.x= TRUE)

# juntando as bases de polciais mortos com o resto das variáveis
df1 <- df %>% 
  left_join(pol_mortos, by = c("ano","mes","AISP","CISP"), all.x=TRUE)


# Para tornar o painel balanceado, vamos substituir os meses 1 e 2 de fevereiro
# por 13 e 14
df1 <- df1 %>%
mutate(mes = ifelse((ano == 2023 & mes == 1),13,mes))

df1 <- df1 %>%
  mutate(mes = ifelse((ano == 2023 & mes == 2),14,mes))


# separando os batalhões em grupos de tratados e não tratados ainda (CISP).
df1 <- df1 %>% mutate(post = case_when(
  AISP %in% c(23,5,11,26,30,38) ~ 6,
  AISP %in% c(1,19,2,3,4,6,16,17,22,10,28,33,37,2,8,29,32,36) ~ 8,
  AISP %in% c(9,14,18,27,31,40,41,7,12,25,35) ~ 10,
  AISP %in% c(21,39,15,20,24) ~ 12,
  AISP %in% c(34) ~ 13),
  treat = 1)


###############################################################################
###############################################################################

View(data)

cisp_table <- seized_guns %>%
  filter(ano == 2022) %>%
  select(CISP,AISP,RISP) %>%
  distinct()
  

l<-data %>%
  filter(ano == 2022) %>%
  select(AISP, RISP, Regiao) %>%
  left_join(cisp_table, by = c("AISP","RISP")) %>%
  distinct() %>%
  select(AISP, CISP, Regiao) %>%
  mutate(metrop = ifelse(Regiao %in% c("Capital           ","Baixada Fluminense","Grande Niterói    "),1,0)) %>%
  select(AISP, CISP, metrop)


View(l)  

write.csv(l, "tabela_cisp_aisp.csv")

write.xlsx(l, "tabela_cisp_aisp.xlsx")

(6000)*0.10
