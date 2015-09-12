Sys.setenv(SPARK_HOME="/usr/local/Cellar/apache-spark/1.4.1/libexec")
.libPaths(c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib"), .libPaths()))
library(SparkR)
sc <- sparkR.init(master="local[8]")
sqlContext <- sparkRSQL.init(sc)

faithful
df <- createDataFrame(sqlContext, faithful)

# Select one column
head(select(df, df$eruptions))

# Filter out rows
head(filter(df, df$waiting < 50))


