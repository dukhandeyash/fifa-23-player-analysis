 library(tidyverse)
 library(magrittr)
 library(DataExplorer)
 library(maps)
 library(plotly)
 library(DT)
 library(tidytext)
 library(gridExtra)
 library(factoextra)
//dataset: https://www.kaggle.com/datasets/javagarm/fifa-19-complete-player-dataset
 df=read.csv("fifa.csv")
 head(df)
 dim(df)
 introduce(df)
 plot_intro(df)
 plot_missing(df)
  bundesliga = c(
 "1. FC Nürnberg", "1. FSV Mainz 05", "Bayer 04 Leverkusen", "FC Bayern München",
 "Borussia Dortmund", "Borussia Mönchengladbach", "Eintracht Frankfurt",
 "FC Augsburg", "FC Schalke 04", "Fortuna Düsseldorf", "Hannover 96",
 "Hertha BSC", "RB Leipzig", "SC Freiburg", "TSG 1899 Hoffenheim",
 "VfB Stuttgart", "VfL Wolfsburg", "SV Werder Bremen"
 )
 premierLeague = c(
 "Arsenal", "Bournemouth", "Brighton & Hove Albion", "Burnley",
"Cardiff City", "Chelsea", "Crystal Palace", "Everton", "Fulham",
 "Huddersfield Town", "Leicester City", "Liverpool", "Manchester City",
 "Manchester United", "Newcastle United", "Southampton",
 "Tottenham Hotspur", "Watford", "West Ham United", "Wolverhampton Wanderers"
 )
 laliga = c(
 "Athletic Club de Bilbao", "Atlético Madrid", "CD Leganés",
 "Deportivo Alavés", "FC Barcelona", "Getafe CF", "Girona FC",
 "Levante UD", "Rayo Vallecano", "RC Celta", "RCD Espanyol",
 "Real Betis", "Real Madrid", "Real Sociedad", "Real Valladolid CF",
 "SD Eibar", "SD Huesca", "Sevilla FC", "Valencia CF", "Villarreal CF"
 )
 seriea = c(
 "Atalanta","Bologna","Cagliari","Chievo Verona","Empoli", "Fiorentina","Frosinone","Genoa",
 "Inter","Juventus","Lazio","Milan","Napoli","Parma","Roma","Sampdoria","Sassuolo","SPAL",
 "Torino","Udinese"
 )
 superlig = c(
 "Akhisar Belediyespor","Alanyaspor", "Antalyaspor","Medipol Basaksehir FK","BB
 Erzurumspor","Besiktas JK",
 "Bursaspor","Çaykur Rizespor","Fenerbahçe SK", "Galatasaray SK","Göztepe
 SK","Kasimpasa SK",
 "Kayserispor","Atiker Konyaspor","MKE Ankaragücü", "Sivasspor","Trabzonspor","Yeni
 Malatyaspor"
 )
 ligue1 = c(
 "Amiens SC", "Angers SCO", "AS Monaco", "AS Saint-Étienne", "Dijon FCO", "En Avant de
 Guingamp",
 "FC Nantes", "FC Girondins de Bordeaux", "LOSC Lille", "Montpellier HSC", "Nîmes
 Olympique",
 "OGC Nice", "Olympique Lyonnais","Olympique de Marseille", "Paris Saint-Germain",
 "RC Strasbourg Alsace", "Stade Malherbe Caen", "Stade de Reims", "Stade Rennais FC",
 "Toulouse Football Club"
 )
 eredivisie = c(
 "ADO Den Haag","Ajax", "AZ Alkmaar", "De Graafschap","Excelsior","FC Emmen","FC
 Groningen",
 "FC Utrecht", "Feyenoord","Fortuna Sittard", "Heracles Almelo","NAC Breda",
 "PEC Zwolle", "PSV","SC Heerenveen","Vitesse","VVV-Venlo","Willem II"
 )
 liganos = c(
 "Os Belenenses", "Boavista FC", "CD Feirense", "CD Tondela", "CD Aves", "FC Porto",
 "CD Nacional", "GD Chaves", "Clube Sport Marítimo", "Moreirense FC", "Portimonense
 SC", "Rio Ave FC",
 "Santa Clara", "SC Braga", "SL Benfica", "Sporting CP", "Vitória Guimarães", "Vitória de
 Setúbal"
 )
 df$League = NA
 df$Country = NA
 df$League[df$Club %in% bundesliga] = "Bundesliga"
df$League[df$Club %in% premierLeague] = "Premier League"
 df$League[df$Club %in% laliga] = "La Liga"
 df$League[df$Club %in% seriea] = "Serie A"
 df$League[df$Club %in% superlig] = "Süper Lig"
 df$League[df$Club %in% ligue1] = "Ligue 1"
 df$League[df$Club %in% liganos] = "Liga Nos"
 df$League[df$Club %in% eredivisie] = "Eredivisie"
 df$Country[df$League == "Bundesliga"] = "Germany"
 df$Country[df$League == "Premier League"] = "UK"
 df$Country[df$League == "La Liga"] = "Spain"
 df$Country[df$League == "Serie A"] = "Italy"
 df$Country[df$League == "Süper Lig"] = "Turkey"
 df$Country[df$League == "Ligue 1"] = "France"
 df$Country[df$League == "Liga Nos"] = "Portugal"
 df$Country[df$League == "Eredivisie"] = "Netherlands"
 df$League = as.character(df$League)
 df$Country = as.character(df$Country)
 String manipulation:
 Value and Wage variables has described as discrete variables. We should transform them into
 continuous variable.
 Code:
 head(df$Value)
 df$Values = str_remove_all(df$Value,"€")
 df$Values = str_replace_all(df$Values,"K", "000")
 df$Values = str_remove_all(df$Values,"M")
 df$Values = as.numeric(df$Values)
 df$Wages = str_remove_all(df$Wage,"€")
 df$Wages = str_replace_all(df$Wages,"K", "000")
 df$Wages = as.numeric(df$Wages)
 df$Values = ifelse(df$Values < 1000, df$Values * 1000000, df$Values)
 unique(df$Position)
  defence <- c("CB", "RB", "LB", "LWB", "RWB", "LCB", "RCB")
 midfielder <- c("CM", "CDM","CAM","LM","RM", "LAM", "RAM", "LCM", "RCM", "LDM", "RDM")
 df$Class = ""
 df$Class[df$Position %in% "GK"] = "Goal Keeper"
 df$Class[df$Position %in% defence] = "Defender"
 df$Class[df$Position %in% midfielder] = "Midfielder"
 df$Class[!df$Position %in% c("GK", defence, midfielder)] = "Forward"
 rm(defence, midfielder)
 df$Height = round((as.numeric(substr(df$Height, start = 1, stop = 1)) * 30.48) +
 (as.numeric(substr(df$Height, start = 3, stop = 5)) * 2.54))
 df$Weight = round(as.numeric(substr(df$Weight, start = 1, stop = 3)) / 2.204623)
 foot_filter = df$Preferred.Foot %in% c("Left", "Right")
 df = df[foot_filter, ]
 df$Preferred.Foot = as.factor(as.character(df$Preferred.Foot))
  df %<>%
 rename(
 "Heading.Accuracy"= HeadingAccuracy,
 "Short.Passing"= ShortPassing,
 "FK.Accuracy" = FKAccuracy,
 "Long.Passing"= LongPassing,
 "Ball.Control"= BallControl,
 "Sprint.Speed"= SprintSpeed,
 "Shot.Power"= ShotPower,
 "Long.Shots"= LongShots,
 "Standing.Tackle"= StandingTackle,
 "Sliding.Tackle"= SlidingTackle,
 "GK.Diving"= GKDiving,
 "GK.Handling"= GKHandling,
 "GK.Kicking"= GKKicking,
 "GK.Positioning"= GKPositioning,
 "GK.Reflexes"= GKReflexes
 )
 df = df[, !names(df) %in% c("ID", "Body.Type", "Real.Face", "Joined", "Loaned.From",
 "Release.Clause", "Photo", "Flag", "Special", "Work.Rate")]
 df=na.omit(df)
 introduce(df)
 plot_missing(df)
 options(repr.plot.width = 12, repr.plot.height = 8)
 df %>%
 group_by(League) %>%
 summarise(Total.Value = sum(as.integer(Values), na.rm = TRUE)) %>%
 ggplot(aes(reorder(League, Total.Value), Total.Value, fill = Total.Value))+
 geom_col(show.legend = FALSE)+
 coord_flip()+
 theme_minimal()+
 labs(x = NULL, y = "Market Values of rhe Leagues")+
 scale_fill_gradient(low = "khaki", high = "seagreen")+
 theme(axis.line.y = element_line(colour = "darkslategray"),
 axis.ticks.x = element_line(colour = "darkslategray"))+
 scale_y_continuous(labels = c("0 €", "2 Billion €", "4 Billion €", "6 Billion €"))
 options(repr.plot.width = 12, repr.plot.height = 8)
 world_map = map_data("world")
 numofplayers = world_map %>%
 mutate(region = as.character(region)) %>%
 left_join((df %>% mutate(Nationality = as.character(Nationality),
 Nationality = if_else(Nationality %in% "England",
 "UK", Nationality)) %>%
 #filter(League == "Bundesliga") %>%
 count(Nationality, name = "Number of Player") %>%
 rename(region = Nationality) %>%
 mutate(region = as.character(region))), by = "region")
 ggplot(numofplayers, aes(long, lat, group = group))+
 geom_polygon(aes(fill = `Number of Player` ), color = "white", show.legend = TRUE)+
 scale_fill_viridis_c(option = "C")+
 theme_void()+
 labs(fill = "Number of Player in Hundreds",
 title = "Number of Player with ggplot2")
 options(repr.plot.width = 12, repr.plot.height = 8)
 df %>%
 filter(League == "Premier League") %>%
 select(Class, Sprint.Speed, Dribbling, Shot.Power, Finishing, Balance, Short.Passing) %>%
 group_by(Class) %>%
 summarise_at(vars(Sprint.Speed:Short.Passing), funs(mean)) %>%
 gather(variables, values,-Class) %>%
 ggplot(aes(variables, values, fill = Class))+
 geom_col(position = "dodge")+
 coord_polar()+
 scale_fill_ordinal()+
 theme_minimal()+
 labs(x = NULL, y = NULL)
 kor = df %>%
 filter(League == "La Liga", Class == "Forward") %>%
 select(Name, Preferred.Foot, Finishing, Shot.Power)
 cor.test(kor$Shot.Power, kor$Finishing, method = "pearson")
 cor.test(kor$Shot.Power, kor$Finishing, method = "kendall")
 hypo = cor.test(kor$Shot.Power, kor$Finishing, method = "spearman")
 hypo