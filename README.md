# Database Testing – OpenCart

## 📋 Overview
Database-level testing project targeting the **OpenCart** e-commerce platform's database, focusing on the `oc_product` and `oc_category` tables. Test cases were designed and executed using direct SQL queries against a MySQL database to validate data integrity, constraints, and relational rules.

## 🎯 Objective
To verify that OpenCart's backend database correctly enforces data integrity rules — such as valid data types, required fields, unique constraints, and foreign key relationships — beyond what UI-level testing can catch.

## 🛠️ Tools & Techniques
- **Database:** MySQL
- **Testing Method:** Direct SQL queries (SELECT, INSERT, UPDATE)
- **Tables Covered:** `oc_product`, `oc_category`
- **Techniques:** Constraint validation, boundary testing, referential integrity checks
- **SQL Scripts:** Raw queries used for test execution (see `sql-scripts/`)

## ✅ Covered Test Areas
- Data type & format validation (e.g., price, quantity fields)
- Required field / NOT NULL constraint validation
- Unique constraint validation (e.g., SKU/model uniqueness)
- Foreign key relationship validation (e.g., category-parent, language_id)
- Auto-increment ID behavior
- Orphan record prevention

## 🐞 Notable Findings
- Negative prices accepted by the database (missing constraint)
- Duplicate SKUs allowed despite expected uniqueness
- Invalid `status` values accepted outside expected range
- Invalid `language_id` foreign key values accepted

## 📁 Project Structure
├── sql-scripts/
│   └── OpenCart_DB_TestQueries.sql
├── test-cases/
│   └── OpenCart_DB_TestCases.xlsx
├── bug-reports/
│   └── OpenCart_DB_BugReport.xlsx
└── README.md
## 🔑 Key Skills Demonstrated
- SQL fundamentals (DDL, DML, Joins, Constraints)
- Database testing methodology & lifecycle
- Data integrity & referential integrity validation
- Writing clear, reproducible database-level bug reports
- MySQL Safe Update Mode troubleshooting

---
**Author:** Ahmed Saeed Hemdan | [LinkedIn](https://www.linkedin.com/in/ahmed-saeed-hemdan/)
