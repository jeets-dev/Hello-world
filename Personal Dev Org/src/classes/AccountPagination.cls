public class AccountPagination {
    
    private Account account{get;set;}
    
    public AccountPagination(ApexPages.StandardSetController controller) {
        this.account = (Account)controller.getRecord();
    }
    
    public Apexpages.StandardSetcontroller accRecords{
        get{
           if( accRecords == null ){
               accRecords = new Apexpages.StandardSetcontroller(Database.getQueryLocator([select Name from Account]));
           }
           return accRecords;
        }
    
       private set;
       }
  public List<Account> getaccountPagination(){
      return accRecords.getRecords();
  }
}