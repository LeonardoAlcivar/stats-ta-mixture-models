library(lda)
data(poliblog.documents)
data(poliblog.vocab)
data(poliblog.ratings)


P <- length(poliblog.vocab)

densify <- function (col) {
    row <- rep(0, P)
    for (i in 1:ncol(col)) {
        c <- col[,i]
        row[c[1]+1] <- c[2]
    }x
    row
}

li.to.mat <- function (li) {
    N <- length(li)
    P <- length(li[[1]])
    m <- matrix(rep(0, N*P), N, P)
    for (i in 1:N) {
        m[i,] <- li[[i]]
    }
    m
}


df <- lapply(poliblog.documents, densify) %>%
    li.to.mat() %>%
    data.frame()

colnames(df) <- poliblog.vocab

write.csv(df, 'poliblog_wordcount.csv')
write.csv(poliblog.ratings, 'poliblog_ratings.csv')
