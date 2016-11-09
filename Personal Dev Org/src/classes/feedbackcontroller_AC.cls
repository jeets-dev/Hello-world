/*
Author: Jitendra Kumar
*/
public class feedbackcontroller_AC {
    public Feedback__c feedback{get;set;}
    public feedbackcontroller_AC(Apexpages.StandardController ctrlr){
        string pid = Apexpages.currentPage().getparameters().get('pID');
        this.feedback = (Feedback__c)ctrlr.getRecord();
        if(this.feedback != null && this.feedback.id != null){
            this.feedback = [select Amount_of_Material__c,Appropriateness__c,	Clariy__c,Comments__c,	Eye_Contact__c,Feedback_for__c,Handling_Questions__c,Listening__c,Structure__c,Style_of_Presentation__c,Time_Keeping__c,Use_of_visual_aids__c,Volume__c from feedback__c where id = :ctrlr.getId()];
        }else{
            this.feedback = new Feedback__c();
        }
        system.debug('pid :: '+pid);
        feedback.Comments__c = pid;
    }
    
    public pagereference SaveandClose(){
        try{
            upsert this.feedback;
        }
        catch(exception e){
            Apexpages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR, 'Error '+e));
        }
        
       
        return null;
    }
}