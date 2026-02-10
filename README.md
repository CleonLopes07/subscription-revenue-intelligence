# Subscription Revenue Intelligence & Customer Analytics Dashboard (SQL + Power BI + Python)

## 📌 Project Overview
Subscription-based businesses (SaaS, OTT, FinTech, EdTech) rely heavily on recurring revenue and customer retention.  
This project builds an end-to-end analytics system to track revenue intelligence metrics, plan performance, customer segmentation, customer lifetime value (LTV), and cohort retention behavior.

The project integrates **Python for data preprocessing**, **PostgreSQL for structured data modeling**, and **Power BI for interactive dashboards**.

---

## 🎯 Business Problem
Most subscription businesses struggle to understand:
- Monthly recurring revenue trends (MRR)
- Plan-wise revenue contribution
- Customer segmentation patterns
- High-value customer identification
- Long-term customer retention behavior

Traditional dashboards often show surface-level KPIs but fail to provide deeper insights such as cohort retention and lifetime value analysis.

---

## ✅ Project Objectives
- Build a structured and scalable subscription analytics model.
- Track modern subscription KPIs such as:
  - MRR (Monthly Recurring Revenue)
  - ARR (Annual Recurring Revenue)
  - ARPU (Average Revenue Per User)
  - LTV (Customer Lifetime Value)
  - Cohort Retention Heatmaps
- Compare performance across subscription plans, customer segments, and referral sources.
- Deliver consulting-style insights and actionable business recommendations.

---

## 🛠️ Tools & Technologies Used
- **Python (Pandas, NumPy)** → Data cleaning & feature engineering
- **PostgreSQL** → Star schema modeling + analytical views
- **Power BI** → Dashboard building & interactive reporting
- **DAX** → KPI measures and time-based calculations

---

## 📂 Dataset Information
The dataset contains subscription transaction records with:
- Customer demographics (age group, gender, country)
- Subscription plan type
- Referral source
- Monthly revenue activity
- Cohort month tagging for retention analysis

---

## 🏗️ Data Pipeline Workflow
1. Raw CSV dataset ingestion  
2. Python preprocessing (cleaning + transformation)  
3. Final fact table creation  
4. PostgreSQL star schema modeling  
5. SQL analytical views (MRR, LTV, cohort retention)  
6. Power BI dashboard reporting  

---

## 📊 Key KPIs Tracked
| KPI | Description |
|-----|-------------|
| MRR | Monthly recurring revenue |
| ARR | Annual recurring revenue (MRR × 12) |
| ARPU | Average revenue per active customer |
| Active Subscribers | Monthly unique paying users |
| LTV | Lifetime revenue per customer |
| Cohort Retention | Retention behavior by cohort month |

---

## 📌 Dashboard Pages (Power BI)
### Page 1: Revenue Intelligence Dashboard
- MRR, ARR, ARPU KPIs
- Revenue trend analysis
- Revenue breakdown by plan, country, referral source

### Page 2: Growth & Plan Performance Dashboard
- MRR growth tracking (MoM trend)
- Active subscriber trend
- Plan revenue contribution and ARPU comparison

### Page 3: Customer & Referral Segmentation Dashboard
- Revenue by country, age group, gender
- Referral source performance analysis
- ARPU by customer segment

### Page 4: LTV & High Value Customers Dashboard
- Average LTV and lifetime revenue
- LTV distribution
- Top 20 high-value customers
- LTV by plan and country

### Page 5: Cohort Retention & Executive Insights Dashboard
- Cohort retention heatmap
- Retention curve analysis
- Key insights and strategic recommendations

---

## 🔍 Key Insights
- Premium subscription plans contribute the highest share of total revenue.
- ARPU varies significantly across pricing tiers, indicating strong upsell potential.
- Revenue contribution is concentrated across top-performing countries.
- Referral sources differ in performance: some bring high volume but low revenue, while others bring fewer high-value customers.
- LTV analysis shows that a small segment of customers contributes a large portion of total lifetime revenue.
- Cohort retention declines after the initial months, highlighting onboarding and early engagement as key improvement areas.

---

## 💡 Business Recommendations
- Upsell customers from low-tier to premium plans through targeted upgrade campaigns.
- Prioritize acquisition channels that generate high-ARPU and high-LTV customers.
- Expand marketing focus in high-value countries while optimizing low-ARPU markets.
- Introduce loyalty rewards for top LTV customers to protect long-term revenue.
- Improve onboarding and early customer engagement to strengthen cohort retention.

---

## ⚠️ Dataset Limitation Note (Churn = 0%)
This dataset does not contain explicit churn/cancellation events.  
Therefore churn is reported as **0%**, and churn-based metrics are excluded from analysis.  
Retention is evaluated using cohort-based retention analysis instead.

---

## 📌 Project Architecture
Raw CSV → Python Cleaning → PostgreSQL Star Schema → SQL Views → Power BI Dashboard

---

## 🚀 Future Enhancements
- Add churn event logs for churn modeling
- Integrate marketing spend data to calculate CAC and ROI
- Build predictive churn model using ML classification
- Add automated forecasting models for MRR and ARR

---

## 👤 Author
**Cleon Lopes**  
B.Tech Computer Engineering | Aspiring Data Analyst / Business Analyst  
