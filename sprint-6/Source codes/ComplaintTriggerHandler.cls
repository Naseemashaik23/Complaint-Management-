public with sharing class ComplaintTriggerHandler {

    //==========================================
    // Before Insert
    //==========================================
    public static void beforeInsert(List<Complaint__c> newComplaints){

        preventDuplicateComplaints(newComplaints);

    }

    //==========================================
    // Before Update
    //==========================================
    public static void beforeUpdate(
    List<Complaint__c> newComplaints,
    Map<Id, Complaint__c> oldMap){

    setResolvedDate(newComplaints, oldMap);

    setClosedDate(newComplaints, oldMap);

}

    //==========================================
    // After Update
    //==========================================
    public static void afterUpdate(
    List<Complaint__c> newComplaints,
    Map<Id, Complaint__c> oldMap){

    createComplaintHistory(newComplaints, oldMap);

}

    //==========================================
    // Prevent Duplicate Complaints
    //==========================================
    private static void preventDuplicateComplaints(
        List<Complaint__c> newComplaints){

        // Step 1 : Collect Customer Ids

        Set<Id> customerIds = new Set<Id>();

        for(Complaint__c complaint : newComplaints){

            if(complaint.Customer_detail__c != null){

                customerIds.add(complaint.Customer_detail__c);

            }

        }

        // Step 2 : Query Existing Complaints

        List<Complaint__c> existingComplaints = [

            SELECT Id,
                   Customer_detail__c,
                   Subject__c,
                   Status__c

            FROM Complaint__c

            WHERE Customer_detail__c IN :customerIds
            AND Status__c != 'Closed'

        ];

        // Step 3 : Store Existing Complaint Keys

        Set<String> existingComplaintKeys = new Set<String>();
        Set<String> incomingComplaintKeys = new Set<String>();

        for(Complaint__c complaint : existingComplaints){

            String key =
                complaint.Customer_detail__c +
                '-' +
                complaint.Subject__c.trim().toLowerCase();

            existingComplaintKeys.add(key);

        }

        // Step 4 : Validate Incoming Complaints

        for(Complaint__c complaint : newComplaints){

            if(complaint.Customer_detail__c == null ||
   String.isBlank(complaint.Subject__c)){
    continue;
}

String key =
    complaint.Customer_detail__c +
    '-' +
    complaint.Subject__c.trim().toLowerCase();
            if(existingComplaintKeys.contains(key)){

    complaint.addError(
        'Duplicate complaint already exists for this customer.'
    );

}
else if(incomingComplaintKeys.contains(key)){

    complaint.addError(
        'Duplicate complaint found in current transaction.'
    );

}
else{

    incomingComplaintKeys.add(key);

}

        }

    }
    //==========================================
// Set Resolved Date
//==========================================
private static void setResolvedDate(
    List<Complaint__c> newComplaints,
    Map<Id, Complaint__c> oldMap){

    for(Complaint__c complaint : newComplaints){

        Complaint__c oldComplaint = oldMap.get(complaint.Id);

        if(
            oldComplaint.Status__c != 'Resolved' &&
            complaint.Status__c == 'Resolved'
        ){

            complaint.Resolved_Date__c = System.now();

        }

    }

}
//==========================================
// Set Closed Date
//==========================================
private static void setClosedDate(
    List<Complaint__c> newComplaints,
    Map<Id, Complaint__c> oldMap){

    for(Complaint__c complaint : newComplaints){

        Complaint__c oldComplaint = oldMap.get(complaint.Id);

        if(
            oldComplaint.Status__c != 'Closed' &&
            complaint.Status__c == 'Closed'
        ){

            complaint.Closed_Date__c = System.now();

        }

    }

}
//==========================================
// Create Complaint History
//==========================================
private static void createComplaintHistory(
    List<Complaint__c> newComplaints,
    Map<Id, Complaint__c> oldMap){

    List<Complaint_History__c> historyList = new List<Complaint_History__c>();

    for(Complaint__c complaint : newComplaints){

        Complaint__c oldComplaint = oldMap.get(complaint.Id);

        if(oldComplaint.Status__c != complaint.Status__c){

            Complaint_History__c history = new Complaint_History__c();

            history.Complaint__c = complaint.Id;
            history.Old_Status__c = oldComplaint.Status__c;
            history.New_Status__c = complaint.Status__c;
            history.Changed_On__c = System.now();
            history.Changed_By__c = UserInfo.getUserId();

            historyList.add(history);

        }

    }

    if(!historyList.isEmpty()){

        insert historyList;

    }

}

}
