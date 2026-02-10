
# Script: src/download_data.R
# Purpose: Download NHANES 2017-2018 Data & Merge

# 1. Load required libraries
if (!require("nhanesA")) install.packages("nhanesA")
if (!require("tidyverse")) install.packages("tidyverse")
library(nhanesA)
library(tidyverse)


# 2. Create directory structure
# Create 'raw' folder for original datasets (recursive=TRUE creates 'data' parent folder too)
if (!dir.exists("data/raw")) dir.create("data/raw", recursive = TRUE)

# 3. Define list of NHANES tables to download (2017-2018 Cycle = '_J')
target_tables <- list(
  Demographics = "DEMO_J",   # Demographics (Age, Gender, etc.)
  Sleep        = "SLQ_J",    # Sleep Disorders
  Mental       = "DPQ_J",    # Mental Health (Depression Screener)
  Inflammation = "HSCRP_J",  # Inflammation (High-Sensitivity CRP)
  Glyco        = "GHB_J",    # Glycohemoglobin (HbA1c)
  Smoking      = "COT_J"     # Smoking (Cotinine) - Backup
)

# 4. Download and save raw data
for (name in names(target_tables)) {
  table_code <- target_tables[[name]]
  output_file <- paste0("data/raw/", table_code, ".csv")

  print(paste0("Downloading: ", name, " (", table_code, ")..."))
  # Download data using nhanesA
  df_raw <- nhanes(table_code)
  
  # Save to 'data/raw/' folder
  write.csv(df_raw, output_file, row.names = FALSE)
  print(paste0("Saved to: ", output_file, " (Rows: ", nrow(df_raw), ")"))
}

print("All raw data downloaded. Starting merge...")

# 5. Merge datasets
# 5.1 Read raw CSV files back into R
demo   <- read.csv("data/raw/DEMO_J.csv")
sleep  <- read.csv("data/raw/SLQ_J.csv")
mental <- read.csv("data/raw/DPQ_J.csv")
crp    <- read.csv("data/raw/HSCRP_J.csv")
ghb    <- read.csv("data/raw/GHB_J.csv")
smoking <- read.csv("data/raw/COT_J.csv")

# 5.2 Select columns and merge by SEQN
print("Merging datasets by SEQN...")

df_merged <- demo %>%
  select(SEQN, RIDAGEYR, RIAGENDR) %>%
  left_join(sleep %>% select(SEQN, SLD012, SLQ050, SLQ120), by = "SEQN") %>%
  left_join(mental %>% select(SEQN, DPQ030), by = "SEQN") %>%
  left_join(crp %>% select(SEQN, LBXHSCRP), by = "SEQN") %>%
  left_join(ghb %>% select(SEQN, LBXGH), by = "SEQN") %>%
  left_join(smoking %>% select(SEQN, LBXCOT), by = "SEQN")

# 5.3 Save final merged dataset
output_merged <- "data/nhanes_merged.csv"
write.csv(df_merged, output_merged, row.names = FALSE)

print(paste0("Data merged and saved as: ", output_merged))