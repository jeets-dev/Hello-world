public class getAccDetailsCtrl {
     public ID accID;
     public string message{get; set;}
     Public Account acc {get; set;}
     Public list<Contact> accContacts{get;set;}
     
     public ID getaccID() {return accID;}
     public void setaccID (ID accId){
         this.accID = accId;
         getAccDetailsCtrl();
     }
     
     public void getAccDetailsCtrl (){
         accContacts = new List<Contact>();
         acc = [select id, name from account where id = :accID];
         accContacts = [select Id, Name, Email from contact where accountid = :accID];
         If(acc != null){
             message = 'Account name is : '+acc.name+' and it has '+accContacts.size()+' contacts as below :';
         }
         else{
             message = 'No account returned :'+acc;
         }
     }    
}