shinyServer(function(input, output) {



    set.seed(08162015) # for reproducibility
    nosim <- 1000
    #####################################################
    #   Functions to use
    # convert to standard normal
    cfunc <- function(x, n) 2 * sqrt(n) * (mean(x) - 0.5)
    vfunc <- function(z, n) var(z)
    #####################################################
    #
    # simulate data for sample various sizes

    output$g<- renderPlot({
                    nbin<-input$bins       #input
                    ###############################
                    # Gaussian View
                    data <- data.frame(
                        x = apply(matrix(sample(0:1, (nosim*nbin), replace=TRUE), nosim), 1, cfunc, nbin),
                        z = apply(matrix(sample(0:1, (nosim*nbin), replace=TRUE), nosim), 1, vfunc, nbin),
                        size = factor(rep(nbin, rep(nosim, 1))))
                    ############################################
                    g<-ggplot(data, aes(x = x, fill = size))
                    g<-g+ geom_histogram(binwidth=.3,colour = "black", aes(y = ..density..))
                    g<-g+ xlab("Normalized Plot of Data Values")
                    g<-g+ ylab("Values of samples")
                    # plot standard normal distribution for reference
                    g <- g + stat_function(fun = dnorm, size = 2)
                    # plot panel plots by sample size
                    g<-g + facet_grid(. ~ size)
                    plot (g)

                })

    output$v <-renderPlot({
        nbin<-input$bins       #input
        ###############################
        #  variance data computation
        vdata<- data.frame(
            z = apply(matrix(sample(0:1, (nosim*nbin), replace=TRUE), nosim), 1, vfunc, nbin),
            size = factor(rep(nbin, rep(nosim, 1)))
            )
        #######################################################
        #  Variance data plot
        vmax<-max(vdata$z)
        vmin<-min(vdata$z)
        vwidth<-vmax-vmin
        pl<-sprintf("Variance Data Density: Width=%f",vwidth)

        v<-ggplot(vdata, aes(x = z), fill=size)
        v<-v+ geom_histogram(binwidth=(nbin*.0001),colour = "black", aes(y = ..density..))
        v<-v+geom_density(fill=NA, colour="red",size=1)
        v<-v + facet_grid(.~ size)
        v<-v+ xlab(pl)
        v<-v+ ylab("Number of samples")

        plot (v)
    })

})

