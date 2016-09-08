RML$ImportData$MSSQL <- (function () {
    Connect <- function(server, databaseName, userName, password) {
        connectionString <- paste('driver={SQL Server};server=', server, ';database=', databaseName, ';UID=', userName, ';PWD=', password, sep='')
        return(GetConnection(connectionString))
    }

    Connect <- function(server, databaseName) {
        connectionString <- paste('driver={SQL Server};server=', server, ';database=', databaseName, ';trusted_connection=true', sep='')
        return(GetConnection(connectionString))
    }

    GetConnection <- function(connectionString) {
        library(RODBC)
        connection <- odbcDriverConnect(connectionString)

        result <- new.env()
        result$Execute <- Query(connection)
        result$Close <- Close(connection)
        return(result)
    }

    Query <- function (connection) {
        return (function (query) {
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
    return(MSSQL)
})()