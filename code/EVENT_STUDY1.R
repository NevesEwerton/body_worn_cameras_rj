library(did)
library(tidyverse)

# GERANDO EVENT-STUDY

# Rodando as regressões e gerando os gráficos
mdip_did <- att_gt(yname = "hom_por_interv_policial",
                   gname = "post",
                   idname = "CISP",
                   tname = "mes",
                   xformla = ~1,
                   data = df1,
                   control_group = "notyettreated")


# agregando o estimador
mdip_did1 <- aggte(mdip_did, type = "dynamic")

# salvando o event-study
pdf(paste0("graficos/CISP/ate_janeiro/att_mdip_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(mdip_did1) + 
  ggtitle("","") + 
  labs(x="Months since the introduction of the cameras",y="MDIP (n)") +
  scale_fill_manual(values = c("Pre" = "lightblue", "Post" = "darkblue"))


print(m)
dev.off()

# criando a variável dummy
df_mdip <- df1 %>% mutate(hom_por_interv_policial = as.logical(ifelse(hom_por_interv_policial>0,1,0)))

mdip_dummy_did <- att_gt(yname = "hom_por_interv_policial",
                         gname = "post",
                         idname = "CISP",
                         tname = "mes",
                         xformla = ~1,
                         data = df_mdip,
                         control_group = "notyettreated")


# agregando o estimador
mdip_dummy_did1 <- aggte(mdip_dummy_did, type = "dynamic")

# salvando o event-study
pdf(paste0("graficos/CISP/ate_janeiro/att_mdip_dummy_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(mdip_dummy_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em MDIP (n)")

print(m)
dev.off()

# armas apreendidas
gun_seized_did <- att_gt(yname = "armas_apreendidas",
                         gname = "post",
                         idname = "CISP",
                         tname = "mes",
                         xformla = ~1,
                         data = df1,
                         control_group = "notyettreated")

# agregando os estimadores
gun_seized_did1 <- aggte(gun_seized_did, type = "dynamic")

# salvando o event-study
pdf(paste0("graficos/CISP/ate_janeiro/att_gun_seized_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(gun_seized_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em armas apreendidas (n)")

print(m)
dev.off()


# Posse de drogas
posse_drogas_did <- att_gt(yname = "posse_drogas",
                           gname = "post",
                           idname = "CISP",
                           tname = "mes",
                           xformla = ~1,
                           data = df1,
                           control_group = "notyettreated")


posse_drogas_did1 <- aggte(posse_drogas_did, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_posse_drogas_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(posse_drogas_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em posse de drogas (n)")

print(m)
dev.off()

# Tráfico de drogas
trafico_drogas_did <- att_gt(yname = "trafico_drogas",
                             gname = "post",
                             idname = "CISP",
                             tname = "mes",
                             xformla = ~1,
                             data = df1,
                             control_group = "notyettreated")


trafico_drogas_did1 <- aggte(trafico_drogas_did, type = "dynamic")

# salvando o event-study
pdf(paste0("graficos/CISP/ate_janeiro/att_trafico_drogas_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(trafico_drogas_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em tráfico de drogas (n)")

print(m)
dev.off()

# Apreensão de drogas
apreensao_drogas_did <- att_gt(yname = "apreensao_drogas",
                               gname = "post",
                               idname = "CISP",
                               tname = "mes",
                               xformla = ~1,
                               data = df1,
                               control_group = "notyettreated")

#agregando os betas
apreensao_drogas_did1 <- aggte(apreensao_drogas_did, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_apreensao_drogas_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(apreensao_drogas_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em apreensão de drogas (n)")

print(m)
dev.off()


# Apreensão de drogas sem autor
apreensao_drogas_sem_autor_did <- att_gt(yname = "apreensao_drogas_sem_autor",
                                         gname = "post",
                                         idname = "CISP",
                                         tname = "mes",
                                         xformla = ~1,
                                         data = df1,
                                         control_group = "notyettreated")

# agregando os betas
apreensao_drogas_sem_autor_did1 <- aggte(apreensao_drogas_sem_autor_did, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_apreensao_drogas_sem_autor_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(apreensao_drogas_sem_autor_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em apreensão de drogas s/ autor")

print(m)
dev.off()


# Crimes Violentos Letais Intencionais
cvli_did <- att_gt(yname = "cvli",
                   gname = "post",
                   idname = "CISP",
                   tname = "mes",
                   xformla = ~1,
                   data = df1,
                   control_group = "notyettreated")

# agregando os betas
cvli_did1 <- aggte(cvli_did, type = "dynamic")

# salvando o event-study
pdf(paste0("graficos/CISP/ate_janeiro/att_cvli_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(cvli_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação CVLI (n)")

print(m)
dev.off()


# Homicídio doloso
hom_doloso_did <- att_gt(yname = "hom_doloso",
                         gname = "post",
                         idname = "CISP",
                         tname = "mes",
                         xformla = ~1,
                         data = df1,
                         control_group = "notyettreated")

# agregando os betas
hom_doloso_did1 <- aggte(hom_doloso_did, type = "dynamic")

# salvando o event-study
pdf(paste0("graficos/CISP/ate_janeiro/att_hom_doloso_cisp.pdf"), width=8, height=5)

m <- ggdid(hom_doloso_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em homícidio doloso (n)")

print(m)
dev.off()

# Policiais mortos em serviço
# criando a dummy
df_policia <- df1 %>% mutate(pol_militares_mortos_serv = as.logical(ifelse(pol_militares_mortos_serv > 0,1,0)))

pol_militar_morto_did <- att_gt(yname = "pol_militares_mortos_serv",
                                gname = "post",
                                idname = "CISP",
                                tname = "mes",
                                xformla = ~1,
                                data = df_policia,
                                control_group = "notyettreated")


pol_militar_morto_did1 <- aggte(pol_militar_morto_did, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_pol_militar_morto_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(pol_militar_morto_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em policiais militares mortos em serviço (n)")

print(m)
dev.off()


# Total roubos
roubos_totais_did <- att_gt(yname = "total_roubos",
                            gname = "post",
                            idname = "CISP",
                            tname = "mes",
                            xformla = ~1,
                            data = df1,
                            control_group = "notyettreated")

# agregando os betas
roubos_totais_did1 <- aggte(roubos_totais_did, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_roubos_totais_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(roubos_totais_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em roubos totais (n)")

print(m)
dev.off()



# Total furtos
furtos_totais_did <- att_gt(yname = "total_furtos",
                            gname = "post",
                            idname = "CISP",
                            tname = "mes",
                            xformla = ~1,
                            data = df1,
                            control_group = "notyettreated")

# agregando os betas
furtos_totais_did1 <- aggte(furtos_totais_did, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_furtos_totais_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(furtos_totais_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em furtos totais")

print(m)
dev.off()


# Furto de veículos
furto_veiculo_did <- att_gt(yname = "furto_veiculos",
                            gname = "post",
                            idname = "CISP",
                            tname = "mes",
                            xformla = ~1,
                            data = df1,
                            control_group = "notyettreated")

# agregando os betas
furto_veiculo_did1 <- aggte(furto_veiculo_did, type = "dynamic")


pdf(paste0("graficos/CISP/ate_janeiro/att_furto_veiculo_cisp.pdf"), width=8, height=5)

# plotando os betas com agregação simples
m <- ggdid(furto_veiculo_did1) + 
  ggtitle("","") + 
  labs(x="Mês desde a introdução das câmeras",y="Variação em furto de veículos (n)")

print(m)
dev.off()


# Estupro
estupro <- att_gt(yname = "estupro",
                  gname = "post",
                  idname = "CISP",
                  tname = "mes",
                  xformla = ~1,
                  data = df1,
                  control_group = "notyettreated")

# agregando os betas
estupro1 <- aggte(estupro, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_estupro_cisp.pdf"), width=8, height=5)

m<-ggdid(estupro1) + 
  ggtitle("","") +
  labs(x="Mês desde a introdução das câmeras",y="Variação em estupro (n)")

print(m)
dev.off()


# Extorsão
extorsao <- att_gt(yname = "extorsao",
                   gname = "post",
                   idname = "CISP",
                   tname = "mes",
                   xformla = ~1,
                   data = df1,
                   control_group = "notyettreated")

# agregando os betas
extorsao1 <- aggte(extorsao, type = "dynamic")

pdf(paste0("graficos/CISP/ate_janeiro/att_extorsao_cisp.pdf"), width=8, height=5)

m<-ggdid(extorsao1) + 
  ggtitle("","") +
  labs(x="Mês desde a introdução das câmeras","Variação em extorsão (n)")

print(m)
dev.off()