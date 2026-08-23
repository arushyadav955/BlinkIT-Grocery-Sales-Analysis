# BlinkIT-Grocery-Sales-Analysis


# BlinkIT Grocery Sales Analysis Dashboard

## 📌 Project Overview
This project focuses on analyzing the **BlinkIT Grocery Sales dataset** using **SQL**, **Power BI**, and **Python** to extract insights, visualize trends, and enhance decision-making for business growth.

Key highlights:
- Built an **interactive Power BI dashboard**.
- Performed **data cleaning & transformation** using Python and SQL.
- Analyzed sales patterns, customer preferences, ratings, and outlet performance.
- Delivered actionable insights for business strategy.

---

## 📂 Dataset Details
- **Dataset Name:** BlinkIT Grocery Data
- **Rows:** 8,523
- **Columns:** 12
- **Key Features:**
    - Item details (type, weight, fat content, visibility)
    - Outlet attributes (location, size, establishment year, type)
    - Sales performance metrics
    - Customer ratings

---

## 🛠️ Tools & Technologies Used
| Tool / Technology | Purpose |
|--------------------|---------|
| **SQL (MS SQL Server)** | Data cleaning, transformation, aggregation |
| **Python (Pandas, Matplotlib, Seaborn)** | Exploratory Data Analysis |
| **Power BI** | Interactive dashboards & KPIs |
| **Jupyter Notebook** | Data exploration & insights |
| **CSV Dataset** | Raw data source |

---

## 🔄 Project Workflow

### **Step 1: Data Preparation (SQL)**
- Imported the dataset into a SQL database.
- Cleaned inconsistent values (e.g., fat content standardization).
- Performed aggregations and derived metrics like:
    - Total Sales & Avg Sales
    - Outlet-wise performance
    - Rating distribution
    - Sales percentage by size & type

**Example SQL Queries:**
```sql
-- Total Sales in Millions
select cast(sum(sales)/1000000 as decimal(10,2)) as total_sales_in_millions
from blinkit_data;

-- Total Sales by Item Type
select item_type, cast(sum(sales) as decimal(10,2)) as total_sales
from blinkit_data
group by item_type;
```

---

### **Step 2: Exploratory Data Analysis (Python)**
- Used **Pandas** for data cleaning & transformation.
- Performed **EDA** to find:
    - Correlation between **Item Weight** and **Sales**
    - Ratings vs. Sales patterns
    - Outlet establishment trends
- Plotted insights using **Matplotlib & Seaborn**.

---

### **Step 3: Power BI Dashboard Development**
Built an **interactive BlinkIT dashboard** showing:
- **KPIs:** Total Sales, Avg Rating, Avg Weight
- **Visuals:**
    - Sales by Item Type & Fat Content
    - Outlet performance trends
    - Outlet-wise sales contribution
    - Item visibility vs. sales correlation
- Added multiple **slicers** for:
    - Item Type, Outlet Type, Tier, Size, Year

---

## 🔍 Key Insights
- **Supermarket Type-1** generates the **highest sales** (~65%).
- **Frozen Foods** & **Fruits/Vegetables** dominate total sales.
- **Tier-3 outlets** perform better than Tier-1 & Tier-2.
- Low-fat products contribute more to overall revenue.
- Item visibility strongly impacts sales performance.

---

## 🚀 How to Use This Project

### **1. Open the Power BI Dashboard**
```
Blinkit Sales_Analysis Dashboard.pbix
```

### **2. Run the SQL Queries**
```
SQL_Query.sql
```

### **3. Execute the EDA Notebook**
```
Untitled.ipynb
```

---

## 📦 Deliverables
| Deliverable            | File Name                  |
|----------------------|----------------------------|
| **Power BI Dashboard** | `Blinkit Sales_Analysis Dashboard.pbix` |
| **SQL Code**          | `SQL_Query.sql` |
| **EDA Notebook**      | `Untitled.ipynb` |
| **Dataset**          | `BlinkIT Grocery Data.csv` |
| **Dashboard Snapshot** | `Dashboard.png` |

---
