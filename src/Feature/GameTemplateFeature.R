App$Feature$GameTemplateFeature <- (function() {    
  CalculateTemplateStats <- function (BingoBI) {
    gameTemplates = unique(BingoBI$GameTemplateId)
    
    templateAverages = as.double(lapply(gameTemplates, function (gameTemplateId) {  
      mean(BingoBI[BingoBI$GameTemplateId == gameTemplateId,]$GameProfit)
    }))
    
    gameTemplates = data.frame(cbind(Id = gameTemplates, Average = templateAverages))
    
    BingoBI$GameTemplateAverageProfit = as.double(lapply(BingoBI$GameTemplateId, function (templateId) {
      gameTemplates[gameTemplates$Id == templateId,]$Average
    }))
    
    return(BingoBI)
  }
  
  GameTemplateFeature <- new.env()
  GameTemplateFeature$CalculateTemplateStats <- CalculateTemplateStats
  return(GameTemplateFeature)
})()
