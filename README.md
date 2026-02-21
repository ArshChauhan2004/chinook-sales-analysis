# 🎵 Chinook Sales Analysis using SQL

---

## 📖 Overview

This project focuses on exploring and analyzing the Chinook Music Store database using SQL.

The aim is to understand:
- Sales performance
- Revenue distribution
- Genre popularity
- Customer purchasing behavior

The project demonstrates:
- Data exploration
- Aggregation
- Joins
- Analytical SQL techniques (Window Functions)

---

## 🎯 Objective

The aim of this project is to:

- Analyze overall sales performance  
- Identify top revenue generating countries  
- Determine revenue contribution by genre  
- Explore track pricing patterns  
- Apply SQL joins for relational analysis  
- Use window functions for ranking analysis  

---

## 📊 Dataset

This project uses the **Chinook Music Store Database**, a sample relational database that represents a digital media store.

The database contains information about:

- Artists  
- Tracks  
- Genres  
- Invoices  
- Invoice Lines (Sales details)  
- Customers  

It allows analysis of revenue, genre popularity, and customer purchasing behavior using SQL joins and aggregations.

Dataset Link: [Chinook Music Database Dataset](https://www.kaggle.com/datasets/jacopoferretti/chinook-music-database)

---

## 🧠 Business Problems and Solutions

Below are the key business questions answered using SQL queries on the Chinook database.

---

### 1️⃣ Count Total Number of Artists

```sql
SELECT COUNT(*) AS total_artists
FROM Artist;

```
**Objective:**
- Determine how many artists exist in the database.

---

### 2️⃣ Count Total Number of Tracks

```sql
SELECT COUNT(*) AS total_tracks
FROM Track;

```
**Objective:**
- Determine how many tracks are available in the database.

---

### 3️⃣ Count Total Number of Genres

```sql
SELECT COUNT(*) AS total_genres
FROM Genre;

```
**Objective:**
Determine how many music genres exist in the database.

---

### 4️⃣ Preview Sample Tracks

```sql
SELECT *
FROM Track
LIMIT 10;

```
**Objective:**
Quickly preview sample track data to understand table structure and column details.

---

### 5️⃣ Number of Tracks per Genre

```sql
