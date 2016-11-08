public class demoTestController_AC {
 
     List<String> NameList;
     String Name;

   public demoTestController_AC( ){
       
       ApexPages.Message emsg = new ApexPages.Message(Apexpages.severity.Info, ' Messsage showed !!!');
       ApexPages.addMessage(emsg);    
   }
}