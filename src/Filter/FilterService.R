App$Filter$FilterService <- (function () {
    # http://blogs.sas.com/content/iml/2014/07/14/log-transformation-of-pos-neg.html
    logMod <- function (x) { 
        result = sign(x) * log(abs(x) + 1)
        return(result)
    }
    
    LogTransformBingoBIData <- function (BingoBI) {
        # BingoBI$GameProfit          <- logMod(BingoBI$GameProfit)
        BingoBI$CardPrice           <- log(BingoBI$CardPrice            + 1)
        BingoBI$NumberOfCards       <- log(BingoBI$NumberOfCards        + 1)
        BingoBI$NumberOfPlayers     <- log(BingoBI$NumberOfPlayers      + 1)
        BingoBI$Rake                <- log(BingoBI$Rake                 + 1)
        BingoBI$Line1Payout         <- log(BingoBI$Line1Payout          + 1)
        BingoBI$Line2Payout         <- log(BingoBI$Line2Payout          + 1)
        BingoBI$FullhousePayout     <- log(BingoBI$FullhousePayout      + 1)
        BingoBI$ConsolationPayout   <- log(BingoBI$ConsolationPayout    + 1)
        BingoBI$PotGuarantee        <- log(BingoBI$PotGuarantee         + 1)
        BingoBI$Line1Split          <- log(BingoBI$Line1Split           + 1)
        BingoBI$Line2Split          <- log(BingoBI$Line2Split           + 1)
        BingoBI$ConsolationSplit    <- log(BingoBI$ConsolationSplit     + 1)
        BingoBI$TopUp               <- log(BingoBI$TopUp                + 1)
        BingoBI$RewardCost          <- log(BingoBI$RewardCost           + 1)
        BingoBI$Bets                <- log( abs(BingoBI$Bets)           + 1)
        return(BingoBI)
    }

    RemoveUnusedColumns <- function (BingoBI) {
        # Unused Columns (derived features created)
        BingoBI$TimeSlotStart <- NULL
        BingoBI$PreBuyOpenTime <- NULL
        
        return(BingoBI)
    }

    FilterService <- new.env()
    FilterService$LogTransformBingoBIData <- LogTransformBingoBIData
    FilterService$RemoveUnusedColumns <- RemoveUnusedColumns
    return(FilterService)
})()
