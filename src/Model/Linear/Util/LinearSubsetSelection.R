App$Model$Linear$Util$SubsetSelection <- (function () {
    predict.regsubsets = function ( object , newdata , id ,...) {
        form = as.formula ( object$call[[2]])
        mat = model.matrix(form, newdata)
        coefi = coef(object, id = id)
        xvars = names(coefi)
        mat [, xvars] %*% coefi
    }  
  
    CrossValidatedSelection <- function (lm, trainData, testData) {
      
    }
    
    CrossValidation <- new.env()
    CrossValidation$KFold <- KFold
    return(CrossValidation)
})()