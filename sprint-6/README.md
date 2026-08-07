# Day 6 – Apex Triggers (Complaint Management System)

## Objective

The objective of Day 6 was to understand Apex Triggers in depth and implement backend automation for the Complaint Management System using industry-standard practices.

---

# Topics Learned

## 1. Apex Triggers

Learned what Apex Triggers are and why they are used in Salesforce.

Understood that triggers execute automatically whenever a DML operation is performed on a Salesforce object.

Learned that triggers are used to automate backend business logic without requiring manual user intervention.

---

## 2. Trigger Events

Studied different trigger events and understood when each event is executed.

- Before Insert
- Before Update
- Before Delete
- After Insert
- After Update
- After Delete
- After Undelete

Learned how to choose the appropriate trigger event based on business requirements.

---

## 3. Before vs After Triggers

Understood the difference between Before and After triggers.

### Before Trigger

Used when modifying the same record before it is saved.

Examples:
- Validation
- Setting default values
- Updating fields
- Preventing duplicate records

### After Trigger

Used when creating or updating related records after the record is successfully saved.

Examples:
- Creating history records
- Sending notifications
- Integrating with other objects

---

## 4. Trigger Context Variables

Learned the purpose of Trigger Context Variables.

- Trigger.new
- Trigger.old
- Trigger.newMap
- Trigger.oldMap
- Trigger.isInsert
- Trigger.isUpdate
- Trigger.isDelete
- Trigger.isBefore
- Trigger.isAfter
- Trigger.size

Understood where each variable is available and its purpose.

---

## 5. Trigger.new vs Trigger.old

Learned the difference between old and new records.

Trigger.new contains the latest values.

Trigger.old contains the previous values before the update.

Used Trigger.oldMap to compare field changes during updates.

---

## 6. Trigger Handler Pattern

Learned the industry-standard Trigger Handler Pattern.

Instead of writing all business logic inside the trigger, the trigger only calls methods from a separate handler class.

Architecture followed:

ComplaintTrigger

↓

ComplaintTriggerHandler

This makes the code:

- Cleaner
- Easier to maintain
- Reusable
- Scalable

---

## 7. Bulkification

Studied Bulkification in detail.

Understood that a trigger executes once for multiple records.

Learned how to write code that efficiently processes bulk records while staying within Salesforce Governor Limits.

Bulkification techniques learned:

- Using collections
- Processing multiple records together
- Avoiding SOQL inside loops
- Avoiding DML inside loops

---

## 8. Collections

Used different Apex collections.

### Set

Used Set<Id> to collect unique Customer IDs.

Used Set<String> to store composite keys for duplicate detection.

### List

Used List<Complaint__c> for processing multiple complaint records.

Used List<Complaint_History__c> for bulk insertion of history records.

---

## 9. Duplicate Prevention

Implemented duplicate complaint validation.

Business Rule:

A customer cannot create another complaint with the same subject while an existing complaint is still active.

Used:

- Set<Id>
- One SOQL Query
- Set<String> Composite Keys
- addError()

to prevent duplicate complaints.

Also improved the logic to detect duplicate complaints within the same transaction.

---

## 10. Trigger.oldMap

Used Trigger.oldMap for comparing old and new values.

This helped identify when the complaint status actually changed.

---

## 11. Automatic Timestamping

Implemented automatic timestamps.

When Status changes to **Resolved**

Automatically populated:

Resolved_Date__c

When Status changes to **Closed**

Automatically populated:

Closed_Date__c

Used:

System.now()

inside Before Update Trigger.

---

## 12. Complaint History Tracking

Implemented Complaint History feature.

Whenever complaint status changes, a new Complaint History record is created.

History stores:

- Complaint
- Old Status
- New Status
- Changed On
- Changed By

Learned why related records are created inside After Update triggers.

---

## 13. addError()

Learned how addError() prevents a record from being saved.

Instead of throwing exceptions, Salesforce displays validation messages directly to the user.

---

## 14. Bulk DML

Learned how to insert multiple history records efficiently.

Instead of inserting records inside loops,

all records are added into a List and inserted together using a single DML statement.

---

## 15. Best Practices Learned

- Keep Trigger logic minimal.
- Move business logic into Trigger Handler.
- Use meaningful method names.
- Use Sets for uniqueness.
- Use Maps for fast lookups.
- Avoid SOQL inside loops.
- Avoid DML inside loops.
- Compare old and new values before updating fields.
- Handle null values safely.
- Build scalable and bulk-safe Apex code.

---

# Development Completed

Successfully implemented:

- Complaint Trigger
- Complaint Trigger Handler
- Duplicate Complaint Validation
- Automatic Resolved Date
- Automatic Closed Date
- Complaint History Tracking
- Bulkified Trigger Logic
- Composite Key Based Duplicate Detection

---

# Challenges Faced

- Understanding Trigger execution flow.
- Differentiating Before and After triggers.
- Understanding Trigger Context Variables.
- Learning Trigger Handler architecture.
- Implementing bulkified duplicate validation.
- Understanding why SOQL and DML should not be used inside loops.
- Understanding Trigger.oldMap comparisons.
- Creating history records using After Update trigger.
- Implementing efficient duplicate detection using composite keys.

---

# Outcome

By the end of Day 6, I gained a strong understanding of Apex Triggers, Trigger Context Variables, Trigger Handler Pattern, Bulkification, Duplicate Validation, Automatic Field Updates, and History Tracking. I successfully implemented production-style backend automation for the Complaint Management System using Salesforce Apex best practices.
