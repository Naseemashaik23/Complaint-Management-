# 🚀 Day 7 – Lightning Web Components (LWC) Part 1

## 📌 Complaint Management System

Day 7 focused on building the **frontend/UI layer** of the Complaint Management System using **Lightning Web Components (LWC)**.

Instead of learning LWC only theoretically, I implemented the concepts directly into the project by creating complaint and customer interfaces and connecting them with Salesforce Apex.

---

## 🎯 Goal

Build the first custom Salesforce UI using Lightning Web Components and connect the UI with Salesforce data.

---

## 📚 Topics Learned

- Lightning Web Components (LWC)
- LWC Component Structure
- HTML
- JavaScript
- XML Metadata
- CSS
- Data Binding
- `@wire`
- Apex to LWC communication
- Event Handling
- Conditional Rendering
- `for:each`
- `NavigationMixin`

---
## 🔗 LWC and Apex Communication

The LWC components retrieve Salesforce data through Apex.

┌─────────────────────┐
│        LWC          │
│   HTML + JS + CSS   │
└──────────┬──────────┘
           │
           │ @wire
           ▼
┌─────────────────────┐
│   Apex Controller   │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│    Service Class    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│     SOQL Query      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Salesforce Database │
└─────────────────────┘
## 🏠 Complaint Management Dashboard

The Complaint Dashboard acts as the main admin interface.

It contains:

Total Complaints
Open Complaints
High Priority Complaints
Recent Complaints
New Complaint button
View All Complaints button
Customers button
## 📋 Complaint Management Workflow
                    ┌───────────────────────┐
                    │   ADMIN DASHBOARD     │
                    └───────────┬───────────┘
                                │
                ┌───────────────┴────────────────┐
                │                                │
                ▼                                ▼
       ┌─────────────────┐              ┌─────────────────┐
       │ View Complaints │              │    Customers    │
       └────────┬────────┘              └────────┬────────┘
                │                                │
                ▼                                ▼
       ┌─────────────────┐              ┌─────────────────┐
       │ All Complaints  │              │  All Customers  │
       └────────┬────────┘              └────────┬────────┘
                │                                │
                ▼                                ▼
       ┌─────────────────┐              ┌─────────────────┐
       │  View Details   │              │  View Details   │
       └────────┬────────┘              └────────┬────────┘
                │                                │
                ▼                                ▼
       ┌─────────────────┐              ┌─────────────────┐
       │Complaint Details│              │Customer Details │
       └────────┬────────┘              └────────┬────────┘
                │                                │
                ▼                                ▼
       ┌─────────────────┐              ┌─────────────────┐
       │Back to Dashboard│              │Back to Customers│
       └─────────────────┘              └─────────────────┘
## 📋 All Complaints Page

A separate Lightning App Page was created for administrators to view all complaints.

Workflow
Complaint Dashboard
        │
        │ Click "View All Complaints"
        ▼
┌──────────────────────────┐
│     All Complaints       │
├──────────────────────────┤
│ Complaint 1              │
│ Complaint 2              │
│ Complaint 3              │
│ Complaint 4              │
└────────────┬─────────────┘
             │
             │ View Details
             ▼
┌──────────────────────────┐
│    Complaint Details     │
├──────────────────────────┤
│ Complaint Number         │
│ Subject                  │
│ Description              │
│ Status                   │
│ Priority                 │
│ Complaint Date           │
│ Expected Date            │
│ Resolution               │
│ Customer                 │
└────────────┬─────────────┘
             │
             ▼
     Back to Dashboard
## 👥 Customer Management Page

A separate Customers Lightning App Page was created to display customer records.

The page uses the customerList LWC.

Customer Information

The following information is displayed:

Customer Name
Email
Phone
Address
## 👥 Customer Workflow
┌──────────────────────────┐
│   Complaint Dashboard    │
└────────────┬─────────────┘
             │
             │ Customers
             ▼
┌──────────────────────────┐
│      All Customers       │
├──────────────────────────┤
│                          │
│ Customer 1               │
│ Email                    │
│ Phone                    │
│ Address                  │
│ [ View Details ]         │
│                          │
├──────────────────────────┤
│ Customer 2               │
│ Email                    │
│ Phone                    │
│ Address                  │
│ [ View Details ]         │
│                          │
└────────────┬─────────────┘
             │
             │ View Details
             ▼
┌──────────────────────────┐
│    Customer Details      │
├──────────────────────────┤
│ Name                     │
│ Email                    │
│ Phone                    │
│ Address                  │
│                          │
│ [ Back to Customers ]    │
└──────────────────────────┘
## 🔙 Navigation Workflow

Navigation between Lightning App Pages was implemented using NavigationMixin.

Complaint Dashboard
        │
        ├───────────────► All Complaints
        │
        └───────────────► Customers

For complaints:

Dashboard
    ↓
All Complaints
    ↓
Complaint Details
    ↓
Back to Dashboard

For customers:

Dashboard
    ↓
All Customers
    ↓
Customer Details
    ↓
Back to Customers
    ↓
Back to Dashboard
## 🔄 Customer Data Flow
┌───────────────────────────┐
│   Customerdetails__c      │
│     Salesforce Object     │
└─────────────┬─────────────┘
              │
              │ SOQL
              ▼
┌───────────────────────────┐
│     CustomerService       │
│                           │
│   getAllCustomers()       │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│ ComplaintDashboard        │
│ Controller                │
│                           │
│ getAllCustomers()         │
└─────────────┬─────────────┘
              │
              │ @wire
              ▼
┌───────────────────────────┐
│       customerList        │
│           LWC             │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│       Customer UI         │
│                           │
│ Name | Email | Phone      │
│ Address | View Details    │
└───────────────────────────┘
## 🔄 Complaint Data Flow
┌───────────────────────────┐
│       Complaint__c        │
│     Salesforce Object     │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│      ComplaintService     │
│                           │
│ getAllComplaints()        │
│ getRecentComplaints()     │
│ getComplaintCount()       │
│ getOpenComplaintCount()   │
└─────────────┬─────────────┘
              │
              ▼
┌───────────────────────────┐
│ ComplaintDashboard        │
│ Controller                │
└─────────────┬─────────────┘
              │
              │ @wire
              ▼
┌───────────────────────────┐
│    Complaint Dashboard    │
│           LWC             │
└───────────────────────────┘
### 🧠 LWC Concepts Practiced
## 1. Data Binding

Salesforce data can be displayed dynamically in HTML using JavaScript properties.

## 2. @wire

@wire was used to retrieve Salesforce data from Apex.

Example:

@wire(getAllCustomers)
wiredCustomers({ data, error }) {

    if (data) {
        this.customers = data;
    }

}
## 3. Event Handling

Buttons can execute JavaScript methods using event handlers.

## 4. Conditional Rendering

The UI can display different sections depending on the component state.


## 5. Iteration

Multiple Salesforce records can be displayed using for:each.


## 6. NavigationMixin

NavigationMixin was used to navigate between Lightning App Pages.


