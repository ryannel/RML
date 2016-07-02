# For further details See:
# http://socserv.socsci.mcmaster.ca/jfox/Courses/Brazil-2009/slides-handout.pdf
App$Model$Linear$Util$Diagnostics <- (function() {
    library(MASS)
    library(car)
    
    Outliers <- function (lm) {
        # Bonferonni p-value for most extreme obs
        print("Out Liers Test")
        print(outlierTest(lm)) 
        
        #qq plot for studentized resid
        qqPlot(lm, main="QQ Plot")  
        
        # leverage plots
        leveragePlots(lm) 
    }
    
    Influence <- function (lm, dataSet) {
        # added variable plots 
        avPlots(lm)
        
        # Cook's D plot
        # identify D values > 4/(n-k-1) 
        cutoff <- 4/((nrow(dataSet)-length(lm$coefficients)-2)) 
        plot(lm, which=4, cook.levels=cutoff)
        
        # Influence Plot 
        influencePlot(lm, main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )
    }
    
    Normality <- function (lm) {
        # qq plot for studentized resid
        qqPlot(lm, main="QQ Plot")
        
        # distribution of studentized residuals
        sresid <- studres(lm) 
        hist(sresid, freq=FALSE, main="Distribution of Studentized Residuals")
        xlm<-seq(min(sresid),max(sresid),length=40) 
        ylm<-dnorm(xlm) 
        lines(xlm, ylm)
    }
    
    ConstantErrorVariance <- function (lm) {
        # non-constant error variance test
        ncvTest(lm)
        
        # plot studentized residuals vs. fitted values 
        spreadLevelPlot(lm)
    }
    
    MultiCollinearity <- function (lm) {
        vif(lm) # variance inflation factors 
        sqrt(vif(lm)) > 2 # problem?
    }
    
    Linearity <- function (lm) {
        # component + residual plot 
        crPlots(lm)
        
        # Ceres plots 
        ceresPlots(lm)
    }
    
    IndependenceOfErrors <- function (lm) {
        # Test for Autocorrelated Errors
        durbinWatsonTest(lm)
    }
  
    Diagnostics <- new.env()
    Diagnostics$Outliers <- Outliers
    Diagnostics$Influence <- Influence
    Diagnostics$Normality <- Normality
    Diagnostics$ConstantErrorVariance <- ConstantErrorVariance
    Diagnostics$MultiCollinearity <- MultiCollinearity
    Diagnostics$Linearity <- Linearity
    Diagnostics$IndependenceOfErrors <- IndependenceOfErrors
    return(Diagnostics)
})()