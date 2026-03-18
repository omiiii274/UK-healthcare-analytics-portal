# 🏥 UK Healthcare Analytics Portal

[![R](https://img.shields.io/badge/R-Shiny-276DC3?style=flat-square&logo=r&logoColor=white)](https://shiny.rstudio.com)
[![GLM](https://img.shields.io/badge/Model-GLM-brightgreen?style=flat-square)]()
[![Database](https://img.shields.io/badge/Database-PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)]()
[![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square)]()
[![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)

> **An interactive R Shiny dashboard for health economic modelling and NHS A&E performance analysis.**
> Automates the transition from raw NHS data to client-ready cost-effectiveness outputs used in HEOR consultancy.

---

## 🎯 What This Does

In healthcare consultancy, reporting speed is critical. Manual reporting from NHS datasets is slow, error-prone, and hard to audit.

This portal **automates the full pipeline** from raw NHS A&E performance data to interactive, client-ready visualisations — using Generalised Linear Models (GLM) to provide statistical rigour beyond simple averages.

Built to mirror the kind of tools used in real-world Health Technology Assessment (HTA) submissions and HEOR consultancy workflows.

---

## ✨ Key Features

### 📉 Tornado Diagrams
Visualise sensitivity of cost-effectiveness results to changes in individual input parameters. Essential for deterministic sensitivity analysis (DSA) in HTA submissions.

### 📐 Cost-Effectiveness Planes (CE Planes)
Graphical comparison of incremental costs vs incremental effects across model runs. Supports decision-making at different willingness-to-pay (WTP) thresholds.

### 📈 Cost-Effectiveness Acceptability Curves (CEACs)
Shows the probability that an intervention is cost-effective across a range of WTP thresholds — a standard output in NICE submissions.

### 🗄 PostgreSQL Backend
Persistent storage of model run data using PostgreSQL, enabling reproducible analyses and historical comparison across scenarios.

### 📊 NHS A&E Performance Analysis
Automated ETL pipeline ingesting NHS A&E performance data, with GLM-based trend modelling for trust-level performance benchmarking.

---

## 🏗 Architecture

```
UK-healthcare-analytics-portal/
│
├── app.R                      # Main Shiny application entry point
├── modules/                   # Shiny modules (tornado, CE plane, CEAC)
├── utils/                     # Helper functions and data processing
├── config/                    # Configuration files (DB connection, parameters)
├── requirements.txt           # R package dependencies
└── README.md
```

---

## 🚀 Installation & Running Locally

### Prerequisites
- R (≥ 4.0)
- PostgreSQL (for backend storage)
- RStudio (recommended)

### Setup

```r
# Install required R packages
install.packages(c("shiny", "tidyverse", "ggplot2", "DBI", "RPostgreSQL", "plotly"))

# Clone the repository
# git clone https://github.com/omiiii274/UK-healthcare-analytics-portal

# Open app.R in RStudio and click "Run App"
# Or from terminal:
Rscript -e "shiny::runApp('app.R')"
```

---

## 🛠 Tech Stack

| Category | Tools |
|---|---|
| Dashboard Framework | R Shiny |
| Statistical Modelling | GLM (Generalised Linear Models) |
| Data Processing | tidyverse, dplyr |
| Visualisation | ggplot2, plotly |
| Database | PostgreSQL via DBI / RPostgreSQL |
| Data Source | NHS England A&E Performance Data |

---

## 🔬 Domain Context

This project applies methods used in:
- **HEOR** (Health Economics & Outcomes Research)
- **HTA submissions** (e.g. NICE technology appraisals)
- **Real-World Evidence (RWE)** analysis for NHS commissioning decisions

Key outputs (tornado diagrams, CE planes, CEACs) are standard deliverables in pharmaceutical and health economics consultancy.

---

## 📌 Related Skills

`R Shiny` · `Health Economics` · `HEOR` · `GLM` · `NHS Data` · `Cost-Effectiveness Analysis` · `PostgreSQL` · `ETL Automation`

---

## 👤 Author

**Omkar Salekar** — MSc Data Science & AI, Oxford Brookes University
PSI Member · IEEE Published Researcher

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=flat-square&logo=linkedin)](https://linkedin.com/in/omkar-salekar-23188026b)
