# Make small datasets

library(Racmacs)

map_2004 <- read.acmap("data/seq-t9a-mod27.ace")

ag_seq <- agSequences(map_2004)
sr_seq <- srSequences(map_2004)

pick_ag <- which(apply(ag_seq, 1, "[[", 145)=="K" & 
                   (apply(ag_seq, 1, "[[", 156)=="K" | 
                      apply(ag_seq, 1, "[[", 156)=="Q" |
                      apply(ag_seq, 1, "[[", 156)=="H") &
                   apply(ag_seq, 1, "[[", 189)=="S")


pick_sr <- which(apply(sr_seq, 1, "[[", 145)=="K" & 
                   (apply(sr_seq, 1, "[[", 156)=="K" | 
                      apply(sr_seq, 1, "[[", 156)=="Q" |
                      apply(sr_seq, 1, "[[", 156)=="H") &
                   apply(sr_seq, 1, "[[", 189)=="S")

small_map <- subsetMap(map_2004, pick_ag, pick_sr)

write.csv(titerTable(small_map), "data/small-dataset.csv")
