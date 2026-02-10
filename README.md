# MAP_Hackathon_2026_T4
🏆 MAP Hackathon 2026 Project 
Team4: "Sleep~Aging" 
Visualizing the link between Sleep Debt and Inflammaging using NHANES 2017-2018 Data. (Data: R, Analysis: Python).


## 📖 Overview
**Sleep~Age Navi** is a data-driven navigation concept that visualizes the "invisible aging" caused by sleep debt.
Using the **NHANES 2017-2018** dataset, I analyzed the correlation between **Sleep Disorders** and **Biological Aging Markers (CRP/Inflammaging)**.


## 🔬 Key Hypothesis 
**"Sleep Debt = Inflammaging"** (未定)
* **Observation:** Sleep disorders are not just about tiredness; they accelerate chronic inflammation (CRP).(未定)
* **Data Evidence:** Analysis of NHANES data shows a significant correlation between sleep trouble and elevated inflammatory markers.(未定)
* **Solution:** A map-based intervention to visualize and mitigate these risks.(未定)

## 🛠 Tech Stack 
We use a hybrid approach to leverage the best of both worlds:

* **Data Engineering (R):**
    * `nhanesA` package for robust data retrieval from CDC servers.
    * `tidyverse` for initial data cleaning and merging (Sleep, Mental Health, Lab data).
* **Data Analysis & AI (Python):**　(未定)
    * `Pandas` & `Scikit-learn` for predictive modeling (Biological Age Prediction).　？？
    * `Seaborn` & `Matplotlib` for visualization.　？？


## 📂 Directory Structure (想定)
```bash
.
├── data/                   # Raw and Processed Data
│   ├── raw_xpt/            # Original NHANES XPT files
│   └── nhanes_merged.csv   # Final merged dataset
├── src/                    # Source Code
│   ├── download_data.R     # 🟢 R Script to fetch NHANES data
│   ├── analysis.py         # 🔵 Python Script for EDA & Modeling
│   └── app.py              # 🟡 Streamlit Dashboard
├── notebooks/              # Jupyter Notebooks for experiments
└── README.md
