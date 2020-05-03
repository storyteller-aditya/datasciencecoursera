# Assigment 3

# Global Variables
CARE_OUTCOMES_PATH = "data-science-jhu/course-2/week_4/data/outcome-of-care-measures.csv"
METADATA_COLS <- c("name" = "Hospital.Name", "state" = "State")
OUTCOME_COLS <- c(
    "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",  
    "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
    "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
)
RELEVANT_COLS <- c(METADATA_COLS, OUTCOME_COLS)

# Function to read data
reader <- function() {
    outcomes <- read.csv(CARE_OUTCOMES_PATH, colClasses = "character")
    outcomes <- outcomes[, RELEVANT_COLS]
    for(column in OUTCOME_COLS) {
        outcomes[, column] <- as.numeric(outcomes[, column])
    }
    return(outcomes)
}

# Function to filter data
filter_outcomes <- function(outcomes, state, outcome) {
    if(!is.na(state)) {
       if(!(state %in% unique(outcomes[, RELEVANT_COLS["state"]]))) {
            stop("invalid state")
            return()
       }
    }
    if(!is.na(outcome)) { 
       if(!outcome %in% names(OUTCOME_COLS)) {
            stop("invalid outcome")
            return()
       }
    }
    
    # Identify relevant columns
    relevant_cols = c(RELEVANT_COLS["name"])
    if(!is.na(state)) {
        relevant_cols = c(relevant_cols, RELEVANT_COLS["state"])
    }
    if(!is.na(outcome)) {
        relevant_cols = c(relevant_cols, RELEVANT_COLS[outcome])
    }
    
    relevant_outcomes = outcomes[,]
    
    # Filter state data
    if(!is.na(state)) {
        idx = (relevant_outcomes[, RELEVANT_COLS["state"]] == state)
        relevant_outcomes = relevant_outcomes[idx, ]
    }
    
    # Drop NA values
    relevant_outcomes = relevant_outcomes[, relevant_cols]
    jdx = complete.cases(relevant_outcomes)
    relevant_outcomes = relevant_outcomes[jdx, ]
    
    return(relevant_outcomes)
}

# Identifying the best hospital for a (state, outcome)
best <- function(state, outcome) {
    outcomes <- reader()
    relevant_outcomes <- filter_outcomes(outcomes, state, outcome)
    # Identify hospitals with the least 30-day mortality
    least_mortality = min(relevant_outcomes[, RELEVANT_COLS[outcome]])
    kdx = (relevant_outcomes[, RELEVANT_COLS[outcome]] == least_mortality)
    best_hospitals = relevant_outcomes[kdx, RELEVANT_COLS["name"]]
    best_hospitals = sort(best_hospitals)
    return(best_hospitals[1])
}

# Identify the hospital with a particular rank
get_ranked_hospital <- function(outcomes, outcome, num, state = NA) {
    relevant_hospitals <- filter_outcomes(outcomes, state, outcome)
    relevant_hospitals <- relevant_hospitals[
        order(relevant_hospitals[, RELEVANT_COLS[outcome]], 
              relevant_hospitals[, RELEVANT_COLS["name"]]), 
        ]
    if(num == "best") {
        rank = 1
    }
    else if(num == "worst") {
        rank = nrow(relevant_hospitals)
    }
    else {
        rank = num
    }
    if(rank > nrow(relevant_hospitals)) {
        return(NA)
    }
    else{
        return(relevant_hospitals[rank, RELEVANT_COLS["name"]])
    }
}

# Identify the hospital at a particular rank for a (state, outcome)
rankhospital <- function(state, outcome, num = "best") {
    outcomes <- reader()
    return(get_ranked_hospital(outcomes, outcome, num, state = state))
}

# Identify the hospital at a particular rank for an outcome for all states
rankall <- function(outcome, num = "best") {
    outcomes <- reader()
    state_split <- split(outcomes, outcomes[, RELEVANT_COLS["state"]])
    state_rank <- sapply(state_split, get_ranked_hospital, 
                         outcome = outcome, num = num)
    state_rank <- data.frame(list(state = names(state_rank), 
                                  hospital = state_rank))
    return(state_rank)
}

# Plotting the distribution of the mortality rate from heart attacks
outcomes <- reader()
head(outcomes, 1)
relevant_outcomes <- filter_outcomes(outcomes, state = NA, 
                                     outcome= "heart attack")
head(relevant_outcomes, 1)
hist(relevant_outcomes[, RELEVANT_COLS["heart attack"]], 
     main = "Histogram of Heart Attack Mortality",
     xlab = "Heart Attack Mortality", 
     xlim = c(5, 25), ylim = c(0, 800))