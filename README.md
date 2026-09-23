# 🏦 Bank Loan Analysis

## 📌 Project Overview
Bank Loan Analytics is a data analysis project focused on understanding
loan performance, customer behavior, repayment patterns, and credit risk.

The project converts raw loan data into dashboards and analytical
insights using Excel, SQL, Power BI, and Tableau.

## 🎯 Business Objectives
- Analyze loan applications
- Measure loan amount and funding
- Monitor loan performance
- Identify high-risk customers
- Analyze customer segments
- Evaluate revenue and interest
- Improve credit risk management

## 🛠️ Tools & Technologies
- Microsoft Excel
- SQL
- Power BI
- Tableau

## 📂 Datasets

### Finance_1
Contains basic loan application, borrower, and loan details.

### Finance_2
Contains additional information about loan payments,
borrower credit history, and loan performance.

### Key Columns
- id
- loan_amnt
- funded_amnt
- int_rate
- grade
- annual_inc
- loan_status
- purpose
- issue_d
- addr_state
- dti
- total_pymnt
- total_rec_prncp
- total_rec_int
- recoveries
- last_pymnt_d
- last_pymnt_amnt
- revol_bal
- total_acc
- last_credit_pull_d

## 🧹 Data Cleaning & Preparation
- Imported Finance_1 and Finance_2 datasets
- Checked dataset structure and columns
- Removed duplicate and missing records
- Corrected numerical and date data types
- Converted date fields into date format
- Created Year and Month fields
- Validated the common `id` column
- Merged the datasets using common keys
- Prepared the final dataset for analysis

## 📊 KPIs & Analysis

### KPI 1: Year-wise Loan Amount
Analyzed loan amounts issued from 2007 to 2011.

### KPI 2: Grade & Sub-grade-wise Revolving Balance
Analyzed revolving balance across loan grades and sub-grades.

### KPI 3: Total Payment – Verified vs Non-Verified
Compared total payments based on verification status.

### KPI 4: State & Last Credit Pull Date-wise Loan Status
Analyzed loan status distribution across states and credit-pull periods.

### KPI 5: Home Ownership vs Last Payment Date
Analyzed the relationship between home ownership and last payment dates.

## 📈 Dashboards
The project contains dashboards developed using:
- Excel
- Power BI
- Tableau
- SQL

## 🔍 Key Findings
- Total Customers: 39,717
- Total Loan Amount: 446M
- Average Interest Rate: 12.02%
- Total Revolving Balance: 531.5M
- Average DTI: 13.32

## 📁 Project Files
- `Dataset/` – Loan datasets
- `SQL/` – SQL queries
- `PowerBI/` – Power BI dashboard
- `Tableau/` – Tableau dashboard
- `Dashboard/` – Dashboard screenshots
- `Presentation/` – Project presentation

## 👤 Author
Sravani Sarode
