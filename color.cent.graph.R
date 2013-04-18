color.cent.graph <- function(g) {
 
    # first thing is to get the centrality vector
    vec_bet_cent <- betweenness(g)
 
    # normalise centrality
    vec_norm_cent <- vec_bet_cent/max(vec_bet_cent)
 
    # create a data frame with normalised centrality
    g_df <- data.frame('Cb'=vec_norm_cent)
 
    # add a column for colour
    g_df$'color' <- 'NA'
 
    # now we add the colour according to centrality
    # if you want to use different colours, this is
    # where you change things
    g_df$'color'[(g_df$'Cb')<=0.333] <- 'blue'
    g_df$'color'[(g_df$'Cb')>0.333] <- 'purple'
    g_df$'color'[(g_df$'Cb')>0.666] <- 'red'
 
    # then apply colours to graph
    V(g)$color <- g_df$'color'
 
    # now draw the graph
    plot(
        g,                                                      
        layout=layout.fruchterman.reingold,
        vertex.label=NA,
        vertex.size=4,
        vertex.frame.color="black",
        edge.width=1
    )
}
