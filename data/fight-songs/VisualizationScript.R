#Creating a data frame with just the UGA row
fightsongsUGA <- filter(fightsongsdf, school == "Georgia")

#Creating the base scatterplot with formatted axes
ggplot(fightsongsdf) + 
        theme_fivethirtyeight() +
        scale_color_fivethirtyeight() +
        
        geom_point(aes(x = sec_duration, y = bpm), #Adds all the dots in the graph
                   show.legend = FALSE,
                   size = 5) +
                  

        geom_point(data = fightsongsUGA, #This adds the black outline to the red UGA dot
                    aes(x =sec_duration, y = bpm),
                    color = "black",
                    size = 6) +

        geom_point(data = fightsongsUGA, #This adds the red UGA dot
                    aes(x =sec_duration, y = bpm),
                    color = "#AF1616",
                    size = 5) +

        gghighlight(school == "Georgia") + #Highlights only the UGA dot, grays out the rest
        
        geom_hline(yintercept = mean(fightsongsdf$bpm), #Adds the horizontal average line
                    linetype = "dashed") +
        
        geom_vline(xintercept = mean(fightsongsdf$sec_duration), #Adds the vertical average line
                    linetype = "dashed") +
        
        geom_text(aes(x = 25, y = 192), #Fast and short label in top left
                  label = "Fast and short",
                  family = "mono",
                  size = 5) +

        geom_text(aes(x = 147, y = 192), #Fast but long label in top right
                  label = "Fast but long",
                  family = "mono",
                  size = 5) +

        geom_text(aes(x = 25, y = 60), #Slow but short label in bottom left
                  label = "Slow but short",
                  family = "mono",
                  size = 5) +

        geom_text(aes(x = 147, y = 60), #Slow and long label in bottom right
                  label = "Slow and long",
                  family = "mono",
                  size = 5) +

        geom_text(aes(x = 41, y = 168), #This is the Georgia label for the red point
                  label = "Georgia",
                  family = "sans",
                  face = "bold",
                  size = 5) +

        geom_label(aes(x = 143, y = mean(fightsongsdf$bpm)), #This is the AVERAGE label on the y-axis
                        label = "AVERAGE",
                        color = "black",
                        family = "mono",
                        label.size = NA,
                        show.legend = NA) +

        geom_richtext(aes(x = 71.90769, #This is the AVERAGE label on the x axis
                          y = 105),
                      data = fightsongsdf,
                      label = "AVERAGE",
                      color = "black",
                      family = "mono",
                      label.size = NA,
                      angle = 90) +
        
        theme(plot.title = element_text(hjust = 1, family = "Arial", face = "bold"),
              axis.text.x = element_text(family = "mono", color = "#A9A9A9"),
              axis.text.y = element_text(family = "mono", color = "#A9A9A9"),
              axis.title.x = element_text(face = "bold", size = "17"),
              axis.title.y = element_text(face = "bold", size = "17")) +
        
        ggtitle("How Georgia's fight song stacks up") +
        
        xlab("Duration") +
                scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100, 120, 140, 160, 180),
                                   limits = c(0, 180),
                                   labels = c("0 sec", "20", "40", "60", "80", "100", "120","140", "160", "180")) +
        ylab("Beats per minute") +
                scale_y_continuous(breaks = c(60, 80, 100, 120, 140, 160, 180, 200),
                                   limits = c(60, 200),
                                   labels = c("60", "80", "100", "120","140", "160", "180", "200bpm"),
                                   expand = c(0.15, 0)) 



#Scale color manual


