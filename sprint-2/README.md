# Day 2 – User Interface Development

## 🎯 Objective
Build a user-friendly interface for the Complaint Management System by creating a Lightning App, configuring navigation, designing page layouts, implementing record types, and organizing records using List Views.

---

# 📚 Topics Learned

## 1. Tabs
- Learned the purpose of Custom Object Tabs.
- Created tabs for custom objects to make them accessible from the Lightning App.
- Understood that tabs act as the entry point to an object.

### Key Learning
- Without a tab, users cannot easily access custom object records.
- Tabs improve navigation and usability.

---

## 2. Lightning App

Created a new Lightning App named:

**Complaint Management System**

Configured the application with navigation items including:

- Home
- Complaints
- Customer Details
- Reports
- Dashboards

### Key Learning
- A Lightning App groups multiple objects into a single business application.
- Navigation Items determine what users can access from the application.

---

## 3. Navigation

Configured the application navigation to provide quick access to important objects.

### Navigation Items
- Home
- Complaint
- Customer Details
- Reports
- Dashboards

### Key Learning
Navigation makes frequently used objects easily accessible without opening Setup.

---

## 4. Page Layouts

Customized the Complaint page layout.

Organized fields into logical sections to improve readability and usability.

### Sections Created
- Complaint Information
- Description
- Assignment
- System Information

### Key Learning
Page Layouts determine:
- Which fields are displayed
- Field order
- Buttons
- Related Lists
- User interface appearance

---

## 5. Default Field Values

Configured the Complaint Date field.

Implemented:

```text
TODAY()
```

as the default value.

### Key Learning

Instead of asking users to enter today's date manually, Salesforce automatically populates it during record creation.

---

## 6. Record Types

Created multiple Record Types for the Complaint object.

### Record Types

- Technical Complaint
- Billing Complaint
- Product Complaint
- Service Complaint
- Other Complaint

Currently all Record Types use the same Page Layout.

### Key Learning

Record Types allow:

- Different business processes
- Different page layouts
- Different picklist values

Although the same layout is currently used, it can be customized later for different complaint types.

---

## 7. List Views

Created multiple List Views to organize Complaint records.

### List Views Created

- All Complaints
- Open Complaints
- High Priority Complaints
- Closed Complaints
- Technical Complaints
- Billing Complaints
- Product Complaints
- Service Complaints

### Key Learning

List Views are saved filters that allow users to quickly access specific records without repeatedly applying filters.

---

## 8. Sample Data

Created sample Customer and Complaint records to test:

- Record Types
- List Views
- Navigation
- Page Layouts

---

# 💡 Concepts Understood

## Lightning App
A Lightning App groups related objects and features into one business application.

---

## Tab
Provides an entry point for accessing object records.

---

## Page Layout
Controls how record pages appear to users.

---

## Record Type
Allows multiple business processes within a single object.

---

## List View
A saved filter used to quickly retrieve records matching specific criteria.

---

## Default Value
Automatically populates a field during record creation.

---

# 🛠️ Challenges Faced

## 1. Category Field Design

Initially created a Category Picklist while also using Record Types.

### Issue

Both represented the same information, resulting in duplicate data entry.

### Solution

Decided to use Record Types as the complaint classification and avoid duplicating the Category field.

---

## 2. Record Type Planning

Considered creating separate Page Layouts for each complaint type.

### Decision

Postponed implementation until later stages of the project when additional fields are introduced.

---

## 3. Understanding List Views

Initially confused temporary filters with List Views.

### Learned

Temporary Filters
- Applied every time manually.

List Views
- Saved once.
- Reusable by all users.
- Improve productivity.

---

## 4. Standard vs Custom Customer Object

Encountered confusion between Salesforce Standard Customer object and Custom Customer Detail object.

### Issue

The standard object displayed unwanted fields such as:

- Party
- Individual
- Privacy Preferences

### Resolution

Identified the difference between Standard and Custom Objects.

Decided to continue development using the Custom Customer Detail object throughout the project.

---

# 📖 Interview Questions Practiced

### What is a Tab?
A Tab provides access to records of an object.

---

### What is a Lightning App?
A collection of related objects and functionality grouped into one application.

---

### What is a Page Layout?
A Page Layout controls the appearance of record pages.

---

### What is a Record Type?
Record Types allow different business processes, page layouts, and picklist values within the same object.

---

### What is a List View?
A saved filter that displays a subset of records based on defined criteria.

---

### Difference Between Temporary Filters and List Views?

Temporary Filter
- Used once
- Must be recreated every time

List View
- Saved permanently
- Reusable
- Improves productivity

---

### Why use Record Types instead of multiple objects?

Record Types allow multiple business processes while keeping all records inside a single object.

---

# 🧠 Reflection

Day 2 focused on building the user interface of the Complaint Management System.

I learned how Salesforce applications are organized using Lightning Apps, Tabs, Record Types, and List Views. I also understood how Page Layouts improve usability and how Record Types support different business scenarios within the same object.

One important lesson was understanding the difference between Standard Objects and Custom Objects. I encountered an issue where the standard Customer object was being used instead of my custom object, which helped me understand the importance of selecting the correct object throughout development.

Overall, Day 2 transformed the project from a basic database into a usable Salesforce application with organized navigation and an intuitive user experience.

---

# ✅ Day 2 Status

✔ Tabs Created

✔ Lightning App Configured

✔ Navigation Completed

✔ Page Layouts Customized

✔ Default Values Implemented

✔ Record Types Created

✔ List Views Created

✔ Sample Data Added

✔ User Interface Functional
