public with sharing class CustomerService {

    // ==========================================================
    // Register Customer
    // ==========================================================
    public static String registerCustomer(Customerdetails__c customer) {

        String validationResult = validateCustomer(customer);

        if (validationResult != 'SUCCESS') {
            return validationResult;
        }

        saveCustomer(customer);

        return 'Customer Registered Successfully';
    }

    // ==========================================================
    // Validate Customer
    // ==========================================================
    private static String validateCustomer(Customerdetails__c customer) {

        if (String.isBlank(customer.Name)) {
            return 'Customer Name is Required';
        }

        if (String.isBlank(customer.Email__c)) {
            return 'Customer Email is Required';
        }

        if (String.isBlank(customer.Phone__c)) {
            return 'Customer Phone Number is Required';
        }

        if (String.isBlank(customer.Address__c)) {
            return 'Customer Address is Required';
        }

        return 'SUCCESS';
    }

    // ==========================================================
    // Save Customer
    // ==========================================================
    private static void saveCustomer(Customerdetails__c customer) {

        insert customer;

    }

    // ==========================================================
    // Update Customer
    // ==========================================================
    public static String updateCustomer(Customerdetails__c customer) {

        String validationResult = validateCustomer(customer);

        if (validationResult != 'SUCCESS') {
            return validationResult;
        }

        update customer;

        return 'Customer Updated Successfully';
    }

}
