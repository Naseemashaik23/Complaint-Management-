public with sharing class ComplaintService {

    // ==========================================================
    // Register Complaint
    // ==========================================================
    public static String registerComplaint(Complaint__c complaint){

        String validationResult = validateComplaint(complaint);

        if(validationResult != 'SUCCESS'){
            return validationResult;
        }

        saveComplaint(complaint);

        return 'Complaint Registered Successfully';
    }

    // ==========================================================
    // Validate Complaint
    // ==========================================================
    private static String validateComplaint(Complaint__c complaint){

        if(String.isBlank(complaint.Subject__c)){
            return 'Complaint Subject is Required';
        }

        if(String.isBlank(complaint.Description__c)){
            return 'Complaint Description is Required';
        }

        if(String.isBlank(complaint.Status__c)){
            return 'Complaint Status is Required';
        }

        if(String.isBlank(complaint.Priority__c)){
            return 'Complaint Priority is Required';
        }

        if(complaint.Customer_detail__c == null){
            return 'Customer is Required';
        }

        return 'SUCCESS';
    }

    // ==========================================================
    // Save Complaint
    // ==========================================================
    private static void saveComplaint(Complaint__c complaint){

        insert complaint;

    }

    // ==========================================================
    // Update Complaint
    // ==========================================================
    public static String updateComplaint(Complaint__c complaint){

        String validationResult = validateComplaint(complaint);

        if(validationResult != 'SUCCESS'){
            return validationResult;
        }

        update complaint;

        return 'Complaint Updated Successfully';
    }

    // ==========================================================
    // Get All Complaints
    // ==========================================================
    public static List<Complaint__c> getAllComplaints(){

        return[
            SELECT Id,
                   Name,
                   Subject__c,
                   Description__c,
                   Status__c,
                   Priority__c,
                   Complaint_Date__c,
                   Expected_date__c,
                   Resolution__c,
                   Customer_detail__c
            FROM Complaint__c
            ORDER BY CreatedDate DESC
        ];

    }

    // ==========================================================
    // Get Complaints By Status
    // ==========================================================
    public static List<Complaint__c> getComplaintsByStatus(String status){

        return[
            SELECT Id,
                   Name,
                   Subject__c,
                   Status__c,
                   Priority__c
            FROM Complaint__c
            WHERE Status__c = :status
            ORDER BY CreatedDate DESC
        ];

    }

    // ==========================================================
    // Get Complaints By Priority
    // ==========================================================
    public static List<Complaint__c> getComplaintsByPriority(String priority){

        return[
            SELECT Id,
                   Name,
                   Subject__c,
                   Status__c,
                   Priority__c
            FROM Complaint__c
            WHERE Priority__c = :priority
            ORDER BY CreatedDate DESC
        ];

    }

    // ==========================================================
    // Get Complaints By Status And Priority
    // ==========================================================
    public static List<Complaint__c> getComplaintsByStatusAndPriority(String status,String priority){

        return[
            SELECT Id,
                   Name,
                   Subject__c,
                   Status__c,
                   Priority__c
            FROM Complaint__c
            WHERE Status__c = :status
            AND Priority__c = :priority
            ORDER BY CreatedDate DESC
        ];

    }

    // ==========================================================
    // Get Recent Complaints
    // ==========================================================
    public static List<Complaint__c> getRecentComplaints(Integer limitSize){

        return[
            SELECT Id,
                   Name,
                   Subject__c,
                   Status__c,
                   Priority__c
            FROM Complaint__c
            ORDER BY CreatedDate DESC
            LIMIT :limitSize
        ];

    }

    // ==========================================================
    // Get Complaint Count
    // ==========================================================
    public static Integer getComplaintCount(){

        return[
            SELECT COUNT()
            FROM Complaint__c
        ];

    }

    // ==========================================================
    // Get Open Complaint Count
    // ==========================================================
    public static Integer getOpenComplaintCount(){

        return[
            SELECT COUNT()
            FROM Complaint__c
            WHERE Status__c = 'Open'
        ];

    }

    // ==========================================================
    // Search Complaints (SOSL)
    // ==========================================================
    public static List<List<SObject>> searchComplaints(String keyword){

        return[
            FIND :keyword
            IN ALL FIELDS
            RETURNING Complaint__c(
                Id,
                Name,
                Subject__c,
                Status__c,
                Priority__c
            )
        ];

    }

}
