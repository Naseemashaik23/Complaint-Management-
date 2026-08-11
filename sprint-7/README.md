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
- Apex to LWC Communication
- Event Handling
- Conditional Rendering
- `for:each`
- `NavigationMixin`

---

# 🔗 LWC and Apex Communication

The LWC components retrieve Salesforce data through Apex.

```text
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
```

---

# 🏠 Complaint Management Dashboard

The **Complaint Dashboard** acts as the main admin interface.

### Dashboard Features

- Total Complaints
- Open Complaints
- High Priority Complaints
- Recent Complaints
- New Complaint button
- View All Complaints button
- Customers button

---

# 📋 Complaint Management Workflow

```text
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
```

---

# 📋 All Complaints Page

A separate **Lightning App Page** was created for administrators to view all complaints.

### Workflow

```text
┌──────────────────────────┐
│   Complaint Dashboard    │
└────────────┬─────────────┘
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
```

---

# 👥 Customer Management Page

A separate **Customers Lightning App Page** was created to display customer records.

The page uses the `customerList` LWC.

### Customer Information

The following information is displayed:

- Customer Name
- Email
- Phone
- Address

---

# 👥 Customer Workflow

```text
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
```

---

# 🔙 Navigation Workflow

Navigation between Lightning App Pages was implemented using `NavigationMixin`.

### Main Navigation

```text
                    ┌──────────────────────┐
                    │  Complaint Dashboard │
                    └──────────┬───────────┘
                               │
                    ┌──────────┴──────────┐
                    │                     │
                    ▼                     ▼
           ┌─────────────────┐    ┌─────────────────┐
           │ All Complaints  │    │  All Customers  │
           └─────────────────┘    └─────────────────┘
```

### Complaint Navigation

```text
Dashboard
    │
    ▼
All Complaints
    │
    ▼
Complaint Details
    │
    ▼
Back to Dashboard
```

### Customer Navigation

```text
Dashboard
    │
    ▼
All Customers
    │
    ▼
Customer Details
    │
    ▼
Back to Customers
    │
    ▼
Back to Dashboard
```

---

# 🔄 Customer Data Flow

```text
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
```

---

# 🔄 Complaint Data Flow

```text
┌───────────────────────────┐
│       Complaint__c        │
│     Salesforce Object     │
└─────────────┬─────────────┘
              │
              │ SOQL
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
```

---

# 🧠 LWC Concepts Practiced

## 1. Data Binding

Data binding is used to display Salesforce data dynamically in the HTML template using JavaScript properties.

Example:

```html
{customer.Name}
```

The value comes from the customer object stored in JavaScript.

---

## 2. `@wire`

`@wire` was used to retrieve Salesforce data from Apex.

Example:

```javascript
@wire(getAllCustomers)
wiredCustomers({ data, error }) {

    if (data) {
        this.customers = data;
    }

}
```

The wired method receives the data returned by the Apex method.

---

## 3. Event Handling

Buttons can execute JavaScript methods using event handlers.

Example:

```html
<lightning-button
    label="View Details"
    onclick={handleViewDetails}>
</lightning-button>
```

The `onclick` event calls the `handleViewDetails()` method in JavaScript.

---

## 4. Conditional Rendering

Conditional rendering allows different parts of the UI to be displayed depending on the component state.

Example:

```html
<template if:true={selectedCustomer}>
```

This was used to switch between:

```text
Customer List
      ↓
Customer Details
```

inside the same LWC.

---

## 5. Iteration Using `for:each`

Multiple Salesforce records can be displayed dynamically using `for:each`.

Example:

```html
<template
    for:each={customers}
    for:item="customer">

    {customer.Name}

</template>
```

This allows the component to display every customer returned from Salesforce.

---

## 6. `NavigationMixin`

`NavigationMixin` was used to navigate between Lightning App Pages.

Example:

```javascript
this[NavigationMixin.Navigate]({

    type: 'standard__navItemPage',

    attributes: {
        apiName: 'Customers'
    }

});
```

This allows the Customers button on the dashboard to open the Customers Lightning App Page.

---

# 🏗️ Component Structure

The main LWC components used during Day 7 were:

```text
force-app/main/default/lwc/
│
├── complaintDashboard/
│   ├── complaintDashboard.html
│   ├── complaintDashboard.js
│   ├── complaintDashboard.css
│   └── complaintDashboard.js-meta.xml
│
└── customerList/
    ├── customerList.html
    ├── customerList.js
    ├── customerList.css
    └── customerList.js-meta.xml
```

---

# 🔧 Apex Classes Used

```text
force-app/main/default/classes/
│
├── ComplaintDashboardController.cls
├── ComplaintService.cls
└── CustomerService.cls
```

### ComplaintService

Responsible for complaint-related operations such as:

- Getting all complaints
- Getting recent complaints
- Getting complaint counts
- Getting open complaint counts
- Searching complaints

### CustomerService

Responsible for customer-related operations such as:

- Registering customers
- Updating customers
- Getting all customers

### ComplaintDashboardController

Acts as the Apex controller used by the LWC to access the required Salesforce data.

---

# ⚠️ Challenges Faced

## 1. Apex Method Not Found

The LWC initially showed an error when an Apex method such as:

```text
ComplaintDashboardController.getComplaintDetails
```

was not available in the deployed controller.

The required Apex method was added and deployed.

---

## 2. Duplicate Apex Method

While implementing customer functionality, `getAllCustomers()` was accidentally added multiple times.

This caused a duplicate method error.

The duplicate methods were removed and responsibilities were separated correctly.

```text
ComplaintService
       │
       └── Complaint-related methods


CustomerService
       │
       └── Customer-related methods
```

---

## 3. Apex Class/File Name Mismatch

An error occurred when `CustomerService` code was accidentally placed inside `ComplaintService.cls`.

The correct structure was restored:

```text
ComplaintService.cls
        ↓
ComplaintService


CustomerService.cls
        ↓
CustomerService
```

---

## 4. LWC Navigation Issue

The Customers button initially did not work because the button was missing the event handler.

The button was updated to:

```html
<lightning-button
    label="Customers"
    icon-name="standard:contact"
    onclick={handleCustomers}>
</lightning-button>
```

Navigation was then handled using `NavigationMixin`.

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Salesforce | CRM Platform |
| Lightning Web Components | Custom UI |
| HTML | UI Structure |
| JavaScript | Component Logic |
| CSS | UI Styling |
| XML | Component Metadata |
| Apex | Backend Logic |
| SOQL | Database Queries |
| `@wire` | Apex to LWC Communication |
| `NavigationMixin` | Page Navigation |

---

# ✅ Day 7 Deliverables

- [x] Learned LWC structure
- [x] Worked with HTML templates
- [x] Worked with JavaScript
- [x] Worked with XML metadata
- [x] Worked with CSS
- [x] Practiced data binding
- [x] Used `@wire`
- [x] Connected LWC with Apex
- [x] Implemented event handling
- [x] Implemented conditional rendering
- [x] Used `for:each`
- [x] Implemented `NavigationMixin`
- [x] Built Complaint Dashboard navigation
- [x] Built All Complaints page
- [x] Built Complaint Details view
- [x] Built Customer List
- [x] Built Customer Details view
- [x] Added Back navigation
- [x] Tested the complete workflow

---

# 🏆 Day 7 Result

The Complaint Management System now has a functional custom UI built using **Lightning Web Components**.

The administrator can:

- View the Complaint Dashboard
- View all complaints
- Open individual complaint details
- Navigate back to the dashboard
- View all customers
- Open individual customer details
- Navigate back to the customer list
- Navigate back to the dashboard

---

# 📊 Final Workflow

```text
                         ┌──────────────────────┐
                         │   ADMIN DASHBOARD    │
                         └──────────┬───────────┘
                                    │
                  ┌─────────────────┴─────────────────┐
                  │                                   │
                  ▼                                   ▼
         ┌──────────────────┐                ┌──────────────────┐
         │  ALL COMPLAINTS  │                │  ALL CUSTOMERS   │
         └────────┬─────────┘                └────────┬─────────┘
                  │                                   │
                  ▼                                   ▼
         ┌──────────────────┐                ┌──────────────────┐
         │ COMPLAINT DETAILS│                │ CUSTOMER DETAILS │
         └────────┬─────────┘                └────────┬─────────┘
                  │                                   │
                  ▼                                   ▼
         ┌──────────────────┐                ┌──────────────────┐
         │ BACK TO DASHBOARD│                │BACK TO CUSTOMERS │
         └──────────────────┘                └────────┬─────────┘
                                                       │
                                                       ▼
                                              ┌──────────────────┐
                                              │ BACK TO DASHBOARD│
                                              └──────────────────┘
```

---

# 🎯 Day 7 Status

## ✅ COMPLETED

The first LWC-based frontend layer of the **Complaint Management System** has been successfully implemented and tested.
