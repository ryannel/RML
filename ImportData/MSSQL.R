RML$ImportData$MSSQL <- (function () {
    Connect <- function(server, databaseName, userName, password) {
        connectionString <- paste('driver={SQL Server};server=', server, ';database=', databaseName, ';UID=', userName, ';PWD=', password, sep='')
        return(GetConnection(connectionString))
    }

    ConnectMsAuth <- function(server, databaseName) {
        connectionString <- paste('driver={SQL Server};server=', server, ';database=', databaseName, ';trusted_connection=true', sep='')
        return(GetConnection(connectionString))
    }

    GetConnection <- function(connectionString) {
        library(RODBC)
        connection <- odbcDriverConnect(connectionString)
        result <- new.env()
        result$Execute <- Query(connection)
        result$ExecuteFile <-QueryFile(connection)
        result$Close <- Close(connection)
        return(result)
    }

    Query <- function (connection) {
        return (function (query) {
            result <- sqlQuery(connection, query)
            return(result)
        })
    }
    
    QueryFile <- function (connection) {
        return (function (file) {
            query <- readChar(file, file.info(file)$size)
            result <- sqlQuery(connection, query)
            return(result)
        })
    }

    Close <- function (connection) {
        return (function () {
            odbcClose(connection)
        })
    }
    
    MSSQL <- new.env()
    MSSQL$Connect <- Connect
    MSSQL$ConnectMsAuth <- ConnectMsAuth
    return(MSSQL)
})()