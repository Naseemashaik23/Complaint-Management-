# 📅 Day 1 – Project Planning & Salesforce Data Model

## 🎯 Objective

Understand the business requirements of a Complaint Management System and design the Salesforce data model before starting development.

---

# 📚 Learning Outcomes

## Salesforce Concepts Learned

- Salesforce Architecture
- Standard Objects vs Custom Objects
- Custom Object Creation
- Fields & Data Types
- Lookup Relationships
- Business Workflow Design
- Data Modeling
- Picklists
- Auto Number
- Record Design

---

# 🏢 Business Understanding

The Complaint Management System follows the workflow below:

```
Customer
    │
    ▼
Customer Care Executive
    │
Creates Complaint
    │
Status = New
    │
    ▼
Admin
    │
Assigns Resolver
Sets Expected Resolution Date
    │
Status = Assigned
    │
    ▼
Resolver
    │
Status = In Progress
    │
Status = Resolved
```

---

# 🗂 Objects Designed

## 1. Customer Detail (Custom Object)

Stores customer information.

### Fields

| Field | Data Type |
|--------|-----------|
| Customer Name | Text |
| Phone Number | Phone |
| Email | Email |
| Address | Long Text Area |

---

## 2. Complaint (Custom Object)

Stores complaint information.

### Fields

| Field | Data Type |
|--------|-----------|
| Complaint Number | Auto Number |
| Subject | Text |
| Description | Long Text Area |
| Category | Picklist |
| Priority | Picklist |
| Status | Picklist |
| Complaint Date | Date |
| Expected Resolution Date | Date |
| Customer Detail | Lookup(Customer Detail) |
| Assigned To | Lookup(User) |

---

## 3. User (Standard Object)

The standard Salesforce User object is used for:

- Admin
- Customer Care Executive
- Resolver

Instead of creating separate objects, different responsibilities will be controlled using Profiles and Permission Sets.

---

# 🔗 Relationships

## Customer Detail → Complaint

- Relationship: One-to-Many
- Type: Lookup Relationship

**Reason**

Complaint history should remain available for reporting and auditing purposes.

---

## User → Complaint

- Relationship: One-to-Many
- Type: Lookup Relationship

**Reason**

A resolver can handle multiple complaints, and complaint history should remain even if the resolver leaves the organization.

---

# 📝 Picklist Values

## Status

- New
- Assigned
- In Progress
- Resolved

---

## Priority

- High
- Medium
- Low

---

## Category

Business-defined complaint categories using Picklist.

---

# 💻 Development Completed

- ✅ Created Customer Detail Custom Object
- ✅ Created Complaint Custom Object
- ✅ Added all required fields
- ✅ Configured Auto Number
- ✅ Created Lookup Relationships
- ✅ Configured Picklists
- ✅ Created Customer Records
- ✅ Created Complaint Records
- ✅ Verified Lookup Relationships

---

# 🚧 Challenges Faced & Solutions

## Challenge 1

### Problem

Why should Customer and Complaint use Lookup instead of Master-Detail?

### Solution

Lookup preserves complaint history, which is essential for reporting, analytics, and auditing.

---

## Challenge 2

### Problem

Why are Admin and Resolver not separate objects?

### Solution

Both are Salesforce Users. Their responsibilities are controlled using Profiles, Roles, and Permission Sets instead of creating separate objects.

---

## Challenge 3

### Problem

Why is Customer not stored in the User object?

### Solution

Customers do not log into Salesforce. They are external entities, so a custom Customer Detail object is more appropriate.

---

## Challenge 4

### Problem

Why is Category a Picklist instead of a separate object?

### Solution

The project only requires selecting predefined categories. Additional category information is not required.

---

## Challenge 5

### Problem

Why use Auto Number for Complaint Number?

### Solution

Auto Number automatically generates unique complaint IDs such as CMP-0001, preventing duplicate values.

---

## Challenge 6

### Problem

Two Customer objects appeared in Salesforce.

### Solution

Salesforce already contained a standard Customer object. The custom object was renamed to **Customer Detail** to avoid confusion.

---

## Challenge 7

### Problem

Customer records were not visible inside the Complaint lookup field.

### Solution

The lookup initially referenced the standard Customer object. It was updated to reference the custom Customer Detail object.

---

## Challenge 8

### Problem

Why are "Assigned To" and "Expected Resolution Date" visible while creating a complaint?

### Solution

Currently, the application is accessed using the **System Administrator** profile, which can view every field.

In future development:

- Customer Care Executive will not see these fields.
- Admin will assign complaints and set the expected resolution date.
- Resolver will update complaint status.

This will be implemented using Profiles, Page Layouts, and Permission Sets.

---

# 🎯 Key Takeaways

- Business understanding comes before development.
- Data modeling is the foundation of every Salesforce application.
- Relationships are chosen based on business requirements.
- Lookup relationships preserve historical data.
- Standard objects should be reused whenever possible.
- Profiles and Permissions determine what users can access.
- Good Salesforce development starts with proper planning before automation and coding.
