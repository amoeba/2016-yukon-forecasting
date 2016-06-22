#' refit.R
#'

library(ggplot2)

# Setup
xrange <- -10:50
logi_fun <- function(x, mu, s) { 1 / (1 + exp(-((x - mu)/s))) }

# Load data we need
inseason <- read.csv("data/inseason.csv", stringsAsFactors = FALSE)
inseason$ccpue <- cumsum(inseason$cpue)

load("may_forecast/optim_result.RData")

# Construct a set of alternative parameters
mu <- round(optim_result$par[1])
s <- round(optim_result$par[2])
alternatives <- expand.grid(mu=c(mu-2, mu, mu+2), s=c(s-1, s, s+1))

# Calculate estimated PCCPUE for each alternative
result <- data.frame()

for (i in seq_len(nrow(alternatives))) {
  print(i)

  # Create a logisitc
  cpue <- data.frame(day = xrange,
                     date = as.Date(xrange, format = "%j", origin = as.Date("2016-05-31")),
                     pccpue = 100 * logi_fun(xrange, alternatives[i,"mu"], alternatives[i,"s"]))

  # Calculate estimated pccpue
  today <- tail(inseason, n = 1)$day
  ccpue <- tail(inseason, n = 1)$ccpue
  final_ccpue <- ccpue / (cpue[cpue$day == today,"pccpue"] / 100)

  estimated <- inseason
  estimated$pccpue <- estimated$ccpue / final_ccpue
  estimated <- estimated[,c("day", "pccpue")]
  estimated$date <- as.Date(estimated$day, format = "%j", origin = as.Date("2016-05-31"))
  estimated$pccpue <- estimated$pccpue * 100

  estimated$alternative <- paste(alternatives[i,"mu"],  alternatives[i,"s"])
  estimated$curve <- "Estimated"
  cpue$alternative <- paste(alternatives[i,"mu"],  alternatives[i,"s"])
  cpue$curve <- "Modeled"

  result <- rbind(result,
                  estimated,
                  cpue)
}

# Refactor the curve column
result$curve <- ordered(result$curve, level = c("Estimated", "Modeled"))

# Plot
predictions <- read.csv("may_forecast/predictions.csv",
                        stringsAsFactors = FALSE)
predictions$percent <- c(15, 25, 50)
predictions$label <- paste0(c(15, 25, 50), "%")
predictions$date <- as.Date(predictions$prediction, format = "%j", origin = as.Date("2016-05-31"))

ggplot() +
  geom_line(data = result, aes(date, pccpue, color = curve)) +
  facet_wrap(~alternative) +
  scale_color_manual(values = c("red", "black")) +
  labs(x = "Date", y = "Cumulative % CPUE") +
  theme_bw() +
  theme(legend.title = element_blank())
