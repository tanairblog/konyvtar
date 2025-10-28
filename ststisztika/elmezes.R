# --- Student & Test Analysis Script ---
#
# This script analyzes the '1zt.csv' file to provide insights into
# (1) Student Learning Outcomes and (2) Test & Item Quality.
#

# --- 1. SETUP ---
#
# You only need to run these 'install.packages' lines ONCE.
# If you have already installed them, you can skip this.
# install.packages("tidyverse")
# install.packages("psych")

# Load the libraries (run this every time you start R)
library(tidyverse)
library(psych)

# --- 2. LOAD AND PREPARE DATA ---

# This reads your CSV.
# `header = TRUE` says the first row is item names.
# `row.names = 1` says the first column is student IDs.
# `check.names = FALSE` keeps item names like "Item 1" (no dots).
item_data <- read.csv(
  file = "1zt.csv",
  header = TRUE,
  row.names = 1,
  check.names = FALSE
)

# Print the first 6 rows to make sure it loaded correctly
print("--- Data Head ---")
print(head(item_data))


# --- 3. ANALYSIS 1: STUDENT LEARNING OUTCOMES ---

# Calculate total score for each student
# Since all items are scaled 0-1, we can just add them up.
student_scores <- data.frame(
  student_id = rownames(item_data),
  total_score = rowSums(item_data)
)

# Get summary statistics (Mean, Median, Min, Max)
print("--- Summary of Total Scores ---")
print(summary(student_scores$total_score))

# Plot a histogram of the total scores
# This shows you the overall distribution of the class
score_histogram <- ggplot(student_scores, aes(x = total_score)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black", alpha = 0.8) +
  labs(
    title = "Distribution of Student Total Scores",
    x = "Total Score",
    y = "Number of Students"
  ) +
  theme_minimal()

print(score_histogram)


# --- 4. ANALYSIS 2: TEST & ITEM QUALITY ---

# --- A. Item Difficulty ---
# Since scores are 0-1, the 'mean' of each item is its
# normalized difficulty (1.0 = very easy, 0.0 = very hard).
item_difficulty <- colMeans(item_data)

difficulty_df <- data.frame(
  item = names(item_difficulty),
  difficulty_score = item_difficulty
)

# Plot the difficulty of each item
difficulty_plot <- ggplot(difficulty_df, aes(x = reorder(item, difficulty_score), y = difficulty_score)) +
  geom_bar(stat = "identity", fill = "darkgreen", alpha = 0.8) +
  geom_hline(yintercept = 0.5, linetype = "dashed", color = "blue") +
  ylim(0, 1) +
  coord_flip() + # Flip axes to make item names easy to read
  labs(
    title = "Item Difficulty (Average Score per Item)",
    x = "Test Item",
    y = "Normalized Difficulty (1.0 = Easy, 0.0 = Hard)"
  ) +
  theme_minimal()

print(difficulty_plot)


# --- B. Test Reliability & Item Discrimination ---
# This is the most important analysis for test quality.
# We use the psych::alpha() function.
reliability_results <- psych::alpha(item_data)

print("--- Full Reliability and Item Analysis ---")
print(reliability_results, digits = 3)


# --- C. Visualizing Item Discrimination ---
# Let's extract the 'r.drop' (item-total correlation)
# and plot it. This is the best way to see item quality.

# Get the item statistics table from the results
item_stats_df <- as.data.frame(reliability_results$item.stats)

# Add item names
item_stats_df$item <- rownames(item_stats_df)

# Plot the 'r.drop' value for each item
discrimination_plot <- ggplot(item_stats_df, aes(x = reorder(item, r.drop), y = r.drop)) +
  geom_bar(stat = "identity", fill = "purple", alpha = 0.8) +
  # Add reference lines for interpretation
  geom_hline(yintercept = 0.3, linetype = "dashed", color = "blue") +
  geom_hline(yintercept = 0.1, linetype = "dotted", color = "orange") +
  geom_hline(yintercept = 0.0, linetype = "solid", color = "red") +
  coord_flip() +
  labs(
    title = "Item Discrimination (r.drop)",
    subtitle = "How well does each item predict the total score?",
    x = "Test Item",
    y = "Item-Total Correlation (r.drop)"
  ) +
  theme_minimal()

print(discrimination_plot)

print("--- Analysis Complete ---")
print("See README.md for help interpreting these results.")

