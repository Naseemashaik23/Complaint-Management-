public with sharing class ComplaintService {

    // ==========================================================
    // Register Complaint
    // ==========================================================
    public static String registerComplaint(Complaint__c complaint) {

        String validationResult = validateComplaint(complaint);

        if (validationResult != 'SUCCESS') {
            return validationResult;
        }

        saveComplaint(complaint);

        return 'Complaint Registered Successfully';
    }

    // ==========================================================
    // Validate Complaint
    // ==========================================================
    private static String validateComplaint(Complaint__c complaint) {

        if (String.isBlank(complaint.Subject__c)) {
            return 'Complaint Subject is Required';
        }

        if (String.isBlank(complaint.Description__c)) {
            return 'Complaint Description is Required';
        }

        if (String.isBlank(complaint.Status__c)) {
            return 'Complaint Status is Required';
        }

        if (String.isBlank(complaint.Priority__c)) {
            return 'Complaint Priority is Required';
        }

        if (complaint.Customer_detail__c == null) {
            return 'Customer is Required';
        }

        return 'SUCCESS';
    }

    // ==========================================================
    // Save Complaint
    // ==========================================================
    private static void saveComplaint(Complaint__c complaint) {

        insert complaint;

    }

    // ==========================================================
    // Update Complaint
    // ==========================================================
    public static String updateComplaint(Complaint__c complaint) {

        String validationResult = validateComplaint(complaint);

        if (validationResult != 'SUCCESS') {
            return validationResult;
        }

        update complaint;

        return 'Complaint Updated Successfully';
    }

}
