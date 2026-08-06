# Day 5 – SOQL & SOSL

## 🎯 Goal

Learn how to retrieve data efficiently using SOQL and SOSL for the Complaint Management System.

---

# 📚 Topics Covered

## SOQL

Learned:

- SELECT
- FROM
- WHERE
- AND
- OR
- IN
- LIKE
- ORDER BY
- LIMIT
- OFFSET

---

## Relationship Queries

### Child to Parent

Used __r relationship to retrieve parent fields.

Example:

Complaint → Customer

---

### Parent to Child

Used nested SELECT queries.

Example:

Customer → Complaints

---

## Aggregate Queries

Learned:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING

---

## SOSL

Learned:

- FIND
- IN ALL FIELDS
- IN NAME FIELDS
- RETURNING
- Searching multiple objects
- LIMIT inside RETURNING

---

# Difference Between SOQL and SOSL

## SOQL

- Searches one object
- Structured queries
- Uses SELECT

## SOSL

- Searches multiple objects
- Keyword-based searching
- Uses FIND

---

# SOQL Query Structure

SELECT

FROM

WHERE

GROUP BY

HAVING

ORDER BY

LIMIT

OFFSET

---

# SOSL Structure

FIND 'Keyword'

IN ALL FIELDS

RETURNING Object(Field1, Field2)

---

# Practice Completed

Created queries using:

- WHERE
- LIKE
- IN
- ORDER BY
- LIMIT
- Aggregate Functions
- Relationship Queries
- SOSL

---

# Learning Outcome

After Day 5 I can:

- Retrieve Salesforce data using SOQL
- Search records using SOSL
- Write relationship queries
- Use aggregate functions
- Build complex queries with filters
- Understand Salesforce query optimization
