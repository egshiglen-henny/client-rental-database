# 🏠 Client Rental Database

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Type](https://img.shields.io/badge/Project-Academic-orange)
![Tool](https://img.shields.io/badge/Tool-MySQL%20Workbench-lightgrey)

## 📖 Overview
The **Client Rental Database** is a relational database system designed for a real estate agency to manage clients, property owners, and rental information.  
It demonstrates full database normalization (1NF → 3NF), ERD design, and advanced SQL querying for analytical insights.

---

## 🎯 Objectives
- Build a normalized database to ensure data consistency and integrity.  
- Create entities representing Clients, Owners, Properties, and Rent Information.  
- Use **ERD diagrams** (Chen and Crow’s Foot) to model relationships.  
- Populate tables with dummy data using SQL DML.  
- Execute **10 analytical queries** to extract meaningful business insights.

---

## 🧱 Database Schema

| Table | Description |
|--------|--------------|
| **Clients** | Stores client details. |
| **Owners** | Stores property owner details. |
| **Properties** | Contains property info with rent and owner linkage. |
| **RentInfo** | Junction table linking clients to rented properties. |

### 🔑 Key Relationships
- One **Owner** → Many **Properties**  
- One **Client** → Many **RentInfo** records  
- One **Property** → One **Owner**  

---

## ⚙️ Implementation
Developed using **MySQL Workbench**.  
The script includes:
- Schema creation (DDL)  
- Dummy data insertion (DML)  
- Foreign key relationships with cascading deletes  
- Queries for analysis and reporting  

Run the SQL script:
```sql
SOURCE client-rental-database.sql;
```
---
## 📊 Analytical Queries
| # | Query Description | SQL Concepts Used |
|---|--------------------|-------------------|
| 1 | Retrieve clients with their rented properties | `JOIN` |
| 2 | List properties rented by clients whose name begins with ‘D’ | `LIKE`, `JOIN` |
| 3 | List clients renting between two dates | `WHERE`, `BETWEEN` |
| 4 | Calculate total monthly rent per client | `SUM`, `GROUP BY` |
| 5 | Find the owner of a specific property | `JOIN`, `WHERE` |
| 6 | Count total properties owned by each owner | `COUNT`, `GROUP BY` |
| 7 | Identify owners with multiple properties | `HAVING`, `GROUP BY` |
| 8 | Calculate total annual rent per client | `ORDER BY`, `SUM` |
| 9 | Find the highest rent-paying client | `MAX`, subquery |
| 10 | Find properties above average rent | `AVG`, subquery |

---

## 📈 Results & Insights
- Identified high-paying clients and top property owners.  
- Determined properties exceeding average rent values.  
- Demonstrated effective use of aggregation and subqueries.  
- Validated normalization and relational integrity principles.

---

## 🧰 Tools & Technologies
| Tool | Purpose |
|------|----------|
| **MySQL Workbench** | Database design & query execution |
| **SQL** | Data definition and manipulation |
| **Random Name Generator** | Used for dummy client and owner data |
| **Excel / MySQL Output** | Visualization of query results |

---

## 🧠 Key Learnings
- Gained strong understanding of **1NF–3NF normalization**.  
- Practiced ERD modeling and foreign key constraints.  
- Improved proficiency with `JOIN`, `GROUP BY`, and subqueries.  
- Learned to interpret query results for real business scenarios.

---

## 📂 Project Files
| File | Description |
|------|--------------|
| `client-rental-database.sql` | Complete SQL script (DDL, DML, and queries) |
| `client-rental-database-report.pdf` | Full project documentation and analysis |
| `README.md` | Project summary and usage instructions |

---

## 👩‍💻 Author
**Egshiglen Enkhbayar**   
📍 Dublin, Ireland  
🔗 [GitHub](https://github.com/egshiglen-henny) | [LinkedIn](https://linkedin.com/in/egshiglen)
