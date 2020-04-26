library(dplyr)

read_pollution_dataset <- function(directory, pollutant, id) {
  all_pollutants <- vector("list", length = length(id))
  for(idx in seq_along(id)) {
    path <- paste(directory, "/", sprintf("%03d", id[idx]),
                  ".csv", sep = "")
    pollutants <- read.csv(path, stringsAsFactors = FALSE)
    if(!is.na(pollutant)) {
      pollutants <- pollutants[c("Date", "ID", pollutant)]
    }
    all_pollutants[[idx]] <- pollutants
  }
  return(all_pollutants)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_pollutants <- read_pollution_dataset(directory, pollutant, id)
  all_pollutants <- do.call(rbind, all_pollutants)
  return(lapply(all_pollutants[pollutant], mean, na.rm = TRUE))
}

complete <- function(directory, id = 1:332) {
  all_pollutants <- read_pollution_dataset(pollutant = NA, directory, id)
  all_pollutants <- do.call(rbind, all_pollutants)
  all_pollutants <- na.omit(all_pollutants)
  return(all_pollutants  %>% count(ID, name = "nobs"))
}

corr <- function(directory, threshold = 0) {
  counts <- complete(directory)
  ids <- counts[counts$nobs > threshold, ]$ID
  if(length(ids) == 0) {
    return(vector(mode = "numeric"))
  }
  relevant_data = read_pollution_dataset(pollutant = NA, directory, ids)
  correlations = vector(length = length(ids))
  for(idx in seq_along(relevant_data)) {
    df <- na.omit(relevant_data[[idx]])
    correlations[[idx]] = cor(df$sulfate, df$nitrate)
  }
  return(correlations)
}

dir_name = "/Users/aditya/Desktop/Projects/data-science-jhu/course-2/week_2/data"
pollutantmean(directory = dir_name, "nitrate")
cc <- complete(directory = dir_name, 332:1)
cr <- corr(directory = dir_name, 400) 