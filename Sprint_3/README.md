# Day 3 – Validation & Business Rules
## Complaint Management System | Salesforce Developer Learning Journey

---

# 📅 Day Overview

**Goal:** Protect data quality and automate calculations using Salesforce declarative features.

Today I learned how Salesforce ensures that only valid data is saved using **Validation Rules**, how to automatically calculate values using **Formula Fields**, how **Auto Number** generates unique record IDs, and why **Roll-Up Summary Fields** only work with **Master-Detail Relationships**.

---

# 📚 Topics Covered

- Validation Rules
- Formula Fields
- Auto Number
- Roll-Up Summary Fields

---

# 1️⃣ Validation Rules

## What is a Validation Rule?

A Validation Rule is a formula that validates user input before a record is saved.

If the formula returns:

- **TRUE** → Salesforce shows an error and prevents the record from being saved.
- **FALSE** → Salesforce allows the record to be saved.

### Key Point

> Validation Rules always represent the **invalid business condition**, not the valid one.

---

## Why Validation Rules?

Validation Rules help maintain data quality by ensuring users enter correct information before saving records.

Examples:

- Prevent closing complaints without entering a resolution.
- Prevent future complaint dates.
- Prevent invalid phone numbers.

---

## Formula Functions Learned

### AND()

Returns TRUE only when all conditions are TRUE.

Example:

```text
AND(
ISPICKVAL(Status__c,"Resolved"),
ISBLANK(Resolution__c)
)
```

---

### OR()

Returns TRUE if at least one condition is TRUE.

Example:

```text
OR(
ISBLANK(Subject__c),
ISBLANK(Description__c)
)
```

---

### ISBLANK()

Checks whether a field is empty.

Example:

```text
ISBLANK(Resolution__c)
```

Returns:

- TRUE → Blank
- FALSE → Contains a value

---

### ISPICKVAL()

Checks the selected value of a Picklist.

Example:

```text
ISPICKVAL(Status__c,"Resolved")
```

---

### LEN()

Returns the number of characters.

Example:

```text
LEN(Phone__c) <> 10
```

Used for validating phone number length.

---

### REGEX()

Checks whether a value matches a specific pattern.

Example:

```text
NOT(
REGEX(
Phone__c,
"[0-9]{10}"
)
)
```

Used to validate that a phone number contains exactly 10 digits.

---

### TODAY()

Returns today's current date.

Example:

```text
Complaint_Date__c > TODAY()
```

Used to prevent future complaint dates.

---

# Validation Rules Implemented

## Rule 1

### Resolution Required Before Resolving Complaint

Business Rule

A complaint cannot be marked as **Resolved** without entering a resolution.

Formula

```text
AND(
ISPICKVAL(Status__c,"Resolved"),
ISBLANK(Resolution__c)
)
```

---

## Rule 2

### Expected Date Cannot Be Earlier Than Complaint Date

Formula

```text
Expected_date__c < Complaint_Date__c
```

---

## Rule 3

### Complaint Date Cannot Be In Future

Formula

```text
Complaint_Date__c > TODAY()
```

---

## Additional Validation Rules Learned

- High Priority complaints must be assigned.
- Description cannot be blank.
- Subject can be made Required instead of using Validation Rules.
- Phone number validation using LEN().
- Phone number validation using REGEX().

---

# Important Learning

Validation Rules should only be used for **business logic**.

Basic mandatory fields such as Subject or Customer can simply be made **Required** instead of writing Validation Rules.

---

# 2️⃣ Formula Fields

## What is a Formula Field?

A Formula Field is a read-only field whose value is automatically calculated by Salesforce.

Users cannot edit Formula Fields.

Whenever the fields used in the formula change, Salesforce automatically recalculates the value.

---

## Difference Between Formula Field and Validation Rule

| Validation Rule | Formula Field |
|-----------------|---------------|
| Validates data | Calculates data |
| Prevents invalid records | Displays calculated values |
| Returns TRUE/FALSE | Returns Text, Number, Date, etc. |
| Runs before saving | Calculates automatically |

---

# Formula Functions Learned

## TODAY()

Returns current date.

Example

```text
TODAY()
```

---

## IF()

Used for decision making.

Syntax

```text
IF(
Condition,
True Value,
False Value
)
```

Example

```text
IF(
ISPICKVAL(Priority__c,"High"),
"Urgent",
"Normal"
)
```

---

## TEXT()

Converts values such as Picklists into Text.

Example

```text
TEXT(Priority__c)
```

Useful for displaying or concatenating Picklist values.

---

## CASE()

Used when comparing one field against multiple possible values.

Example

```text
CASE(
TEXT(Priority__c),
"High","Urgent",
"Medium","Normal",
"Low","Low Risk",
"Unknown"
)
```

---

## '&' Operator

Used to concatenate Text.

Example

```text
Subject__c &
" - " &
TEXT(Status__c)
```

Output

```
Printer Issue - Resolved
```

---

# Formula Field Implemented

## Days Open

Purpose

Automatically calculates how many days a complaint has been open.

Formula

```text
TODAY() - Complaint_Date__c
```

Return Type

```
Number
```

Decimal Places

```
0
```

---

# Important Learning

Formula Fields always calculate values automatically.

Users cannot manually enter values into Formula Fields.

---

# 3️⃣ Auto Number

## What is Auto Number?

Auto Number automatically generates unique sequential values whenever a new record is created.

Users cannot edit these values.

---

## Why Use Auto Number?

- Eliminates duplicate IDs.
- No manual typing.
- Professional record numbering.
- Automatically increments.

---

## Complaint Auto Number

Display Format

```text
CMP-{000}
```

Generated Values

```
CMP-001
CMP-002
CMP-003
```

---

## Auto Number Components

### Display Format

Defines how the generated value should appear.

Example

```text
CMP-{000}
```

---

### Starting Number

Defines the first generated number.

Example

```
1
```

---

# Important Learning

Auto Number is preferable to Text fields for record identifiers because Salesforce guarantees uniqueness.

---

# 4️⃣ Roll-Up Summary Fields

## What is a Roll-Up Summary?

A Roll-Up Summary Field automatically summarizes child records and stores the result on the Parent object.

Supported calculations:

- COUNT
- SUM
- MIN
- MAX

---

## Example

Customer

↓

Complaints

↓

Roll-Up Summary

```
Total Complaints = 5
```

---

## Relationship Requirement

Roll-Up Summary Fields work **only with Master-Detail Relationships**.

They cannot be created on Lookup Relationships.

---

## My Project Design Decision

Customer and Complaint use a **Lookup Relationship**.

Reason:

Even if a Customer record is deleted, Complaint records should remain available for reporting and historical analysis.

Therefore,

Roll-Up Summary Fields cannot be used in this project.

Alternative approaches:

- Flow
- Apex
- Declarative Lookup Rollup Summaries (DLRS)

---

# Challenges Faced Today

## 1. Validation Rule Using "Closed"

Problem

Initially used

```text
ISPICKVAL(Status__c,"Closed")
```

Issue

The Status Picklist did not contain a "Closed" value.

Solution

Changed it to

```text
ISPICKVAL(Status__c,"Resolved")
```

---

## 2. Days Open Showing Large Number

Problem

Formula Field displayed 19515.

Reason

Viewed inside the Page Layout preview instead of an actual record.

Solution

Opened an actual Complaint record after saving.

Formula worked correctly.

---

## 3. Assigned To Validation

Problem

Created Validation Rule requiring Assigned To.

Issue

Customers create complaints and should not assign support agents.

Solution

Decided to remove this Validation Rule and instead implement different user experiences using:

- Profiles
- Page Layouts
- Field-Level Security

---

## 4. Lookup vs Master-Detail

Initially considered Master-Detail.

Finally selected Lookup because complaint records should remain available even if customer records are deleted.

---

# Key Concepts Learned

- Validation Rules always represent invalid conditions.
- Formula Fields automatically calculate values.
- Auto Number automatically generates unique record IDs.
- Roll-Up Summary Fields are available only for Master-Detail Relationships.
- Formula language is shared across Validation Rules, Formula Fields, Flows, and other declarative tools.
- Business requirements determine whether to use Validation Rules, Required Fields, Formula Fields, or Automation.

---

# Interview Questions Prepared

### What is a Validation Rule?

A Validation Rule checks whether entered data satisfies business requirements before saving a record. If the formula returns TRUE, Salesforce prevents the record from being saved.

---

### What is a Formula Field?

A Formula Field automatically calculates values based on other fields and updates whenever referenced data changes.

---

### Difference Between Validation Rule and Formula Field?

Validation Rules validate data.

Formula Fields calculate data.

---

### Why use Auto Number?

Auto Number automatically generates unique sequential identifiers without manual user input.

---

### Why can't Roll-Up Summary Fields be used in this project?

Because Complaint and Customer use a Lookup Relationship.

Roll-Up Summary Fields require Master-Detail Relationships.

---

# Today's Outcome

✅ Learned Validation Rules

✅ Built multiple business validations

✅ Learned Formula Fields

✅ Built Days Open Formula Field

✅ Understood Auto Number configuration

✅ Learned Roll-Up Summary concepts

✅ Understood Lookup vs Master-Detail business decisions

---

# Day 3 Status

**Completed Successfully ✅**
