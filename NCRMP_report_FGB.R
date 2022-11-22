##Alice Webb
##14/10/22
##Plots for NCRMP FGB report

## boxplots production
data <- read.csv("Data/FGB_CB.csv")
mdata<-melt(data,id.vars=c(8:13))

mdata$Year<-as.character(mdata$Year)
mdata[c(7)] <- lapply(mdata[c(7)], gsub, pattern = ".", replacement = " ", fixed = TRUE)

CB<-subset(mdata,variable=="Carbonate budgets")

A<-ggplot(CB,aes(Year,value,fill=Year))+
  geom_boxplot(alpha=0.5)+
  scale_fill_manual(values=c("#330033", "#666699","#336666")) +
  facet_wrap(~variable)+
  # scale_viridis(discrete=TRUE,alpha=0.6)+
  geom_jitter(colour="black",size=1,alpha=0.9,shape=1)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),panel.grid.minor=element_blank())+
  ylab(expression(paste( " [ kg m"^"-2"," yr"^"-1","]")))


mdata<-melt(data,id.vars=c(1,8:13))
mdata$Year<-as.character(mdata$Year)
mdata[c(8)] <- lapply(mdata[c(8)], gsub, pattern = ".", replacement = " ", fixed = TRUE)
mdata$variable <- factor(mdata$variable, levels = c("Coral production","CCA production", "PF erosion",
                                                    "Urchin erosion","Macro bioerosion","Micro bioerosion"))
B<-ggplot(mdata,aes(Year,value,fill=Year))+
  geom_boxplot(alpha=0.5)+
  scale_fill_manual(values=c("#330033", "#666699","#336666")) +
  geom_jitter(colour="black",size=1,alpha=0.9,shape=1)+
  facet_wrap(~variable,scales="free",ncol=3) +
  theme_bw()+
  theme(panel.grid.major = element_blank(),panel.grid.minor=element_blank())+
  ylab(expression(paste( " [ kg m"^"-2"," yr"^"-1","]")))

