@RestResource(urlMapping='/AccountService/*')
global class RestService1{
    
    @HttpGEt
    global static List<Account> getAccounts(){
        List<Account> lstAcc;
        try{
            lstAcc = [select id, name from account limit 10];
        }
        catch(Exception e){
            system.debug('ERROR: '+e.getMessage());
        }
        return lstAcc;
    }
    
    @HttpPost
    global static String createAccount(String name){
        
        Account ac = new Account();
        ac.Name = name+'_'+DateTime.now().format('E');
        insert ac;
        return '"id" : '+ac.id;
    }
    
}