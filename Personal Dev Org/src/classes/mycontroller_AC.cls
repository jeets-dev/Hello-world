public class mycontroller_AC {
 
   
   public List<SelectOption> accOptions{
   get{
       List<SelectOption> ListOfOptions = new List<SelectOption>();
       for( Account a : [Select id, Name, parentId from Account]){
           ListOfOptions.add(new selectOption(a.id, a.name));
       }  
       return ListOfOptions;
   }set;}
   
   public List<Opportunity> relatedOpps{get;set;}   
   public String selectedAccountId{get;set;}
   
   public mycontroller_AC(){
       relatedOpps = new List<Opportunity>();
   }
   
   public void populateOppList(){
        system.debug('selectedAccountId :: '+selectedAccountId);
       relatedOpps = [select Id, name from Opportunity where accountId = :selectedAccountId];
       system.debug('relatedOpps :: '+relatedOpps);
   }    
}