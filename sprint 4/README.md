# Day 4 – Apex Basics

## Project

**Complaint Management System (Salesforce)**

## Goal

Learn the fundamentals of Apex programming and build the first custom Apex class for the project.

---

# Topics Covered

## 1. Introduction to Apex

### What is Apex?

Apex is Salesforce's object-oriented programming language used to implement custom business logic on the Salesforce platform.

### Why do we use Apex?

Apex is used when standard Salesforce features or declarative tools (Validation Rules, Flows, Formula Fields, etc.) cannot efficiently solve a business requirement.

### Salesforce Development Approach

```
Business Requirement
        ↓
Can Standard Features solve it?
        ↓
Yes → Use Standard Features
        ↓
No
        ↓
Can Declarative Tools solve it?
(Validation Rules, Formula Fields, Flows)
        ↓
Yes → Use Declarative Tools
        ↓
No
        ↓
Use Apex
```

---

# 2. Apex Class

A class is a blueprint that contains business logic.

Example:

```apex
public class ComplaintService {

}
```

### Class Components

* `public` → Access Modifier
* `class` → Declares an Apex class
* `ComplaintService` → Class Name
* `{ }` → Class Body

---

# 3. Methods

A method performs a specific task.

Example:

```apex
public static void createComplaint(){

}
```

Method Components:

* `public` → Accessible from other classes
* `static` → Can be called without creating an object
* `void` → Returns nothing
* `createComplaint()` → Method Name

### Best Practice

One Method = One Responsibility

Examples:

* createComplaint()
* updateComplaint()
* deleteComplaint()

---

# 4. Understanding static

### Definition

A static method belongs to the class itself and can be called without creating an object.

Example:

```apex
ComplaintService.createComplaint();
```

instead of

```apex
ComplaintService cs = new ComplaintService();
cs.createComplaint();
```

---

# 5. Understanding void

`void` means the method performs a task but does not return any value.

Example:

```apex
public static void createComplaint(){

}
```

If the method needs to return a message, use a return type such as `String`.

Example:

```apex
public static String createComplaint(){

    return 'Complaint Created Successfully';

}
```

---

# 6. Variables

Variables are containers used to store data.

Syntax:

```apex
DataType variableName = value;
```

Examples:

```apex
String customerName = 'Rahul';

Integer age = 20;

Decimal cgpa = 8.9;

Boolean isResolved = false;

Date today = Date.today();
```

---

# 7. Salesforce Custom Objects in Apex

Custom Objects can also be used as data types.

Example:

```apex
Complaint__c complaint = new Complaint__c();
```

Explanation:

* `Complaint__c` → Data Type
* `complaint` → Variable
* `new` → Creates a new object in memory

---

# 8. Assigning Values

Example:

```apex
Complaint__c complaint = new Complaint__c();

complaint.Name = 'Login Issue';
complaint.Status__c = 'Open';
complaint.Priority__c = 'High';
```

At this point, the record exists only in memory.

---

# 9. DML (Data Manipulation Language)

DML is used to modify Salesforce records.

Operations:

* insert
* update
* delete
* upsert
* undelete

### Insert Example

```apex
insert complaint;
```

Creates a new record in Salesforce.

### Update Example

```apex
update complaint;
```

Updates an existing record.

---

# 10. Object Lifecycle

```
Create Object
        ↓
Assign Field Values
        ↓
Insert / Update
        ↓
Record Saved in Salesforce
```

---

# 11. Parameters

Methods can accept objects as input.

Example:

```apex
public static void createComplaint(Complaint__c complaint){

    insert complaint;

}
```

This is better than hardcoding values because the same method can be reused for different complaint records.

---

# 12. System.debug() vs return

### System.debug()

Used for debugging.

```apex
System.debug('Complaint Created');
```

* Visible only in Debug Logs
* Used by developers

### return

Returns a value to the method that called it.

```apex
return 'Complaint Created Successfully';
```

Used when another class, LWC, or caller needs the result.

---

# ComplaintService (Basic Version)

```apex
public with sharing class ComplaintService {

    public static String createComplaint(Complaint__c complaint){

        insert complaint;

        return 'Complaint Created Successfully';

    }

    public static String updateComplaint(Complaint__c complaint){

        update complaint;

        return 'Complaint Updated Successfully';

    }

}
```

---

# Key Learnings

* Understood the purpose of Apex.
* Learned how to create Apex classes.
* Learned how to write methods.
* Understood the use of `public`, `static`, and `void`.
* Learned how to create custom object instances.
* Understood the `new` keyword.
* Learned how to assign values to object fields.
* Learned DML operations (`insert` and `update`).
* Understood the difference between `System.debug()` and `return`.
* Built the first version of the `ComplaintService` Apex class.

---

# Interview Questions Practiced

### 1. What is Apex?

Apex is Salesforce's object-oriented programming language used to implement custom business logic.

### 2. What is a class?

A class is a blueprint that contains variables, methods, and business logic.

### 3. What is a method?

A method is a block of code that performs a specific task.

### 4. What is the purpose of `static`?

A static method belongs to the class itself and can be called without creating an object.

### 5. What does `void` mean?

`void` means the method does not return any value.

### 6. What is DML?

DML (Data Manipulation Language) is used to create, update, delete, restore, or upsert Salesforce records.

### 7. What is the difference between `System.debug()` and `return`?

* `System.debug()` prints messages to the Debug Log.
* `return` sends a value back to the calling method or component.

---

# Day 4 Outcome

✅ Learned Apex fundamentals.

✅ Wrote the first Apex class.

✅ Created custom object instances.

✅ Performed DML operations.

✅ Built the initial `ComplaintService` class following real-world Salesforce development practices.

---
