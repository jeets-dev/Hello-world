/*********************************
* Name: QuoteHandler_c 
**********************************
* Author:   Jitendra Kumar
* Purpose:  Controller class for pricing grid
*
***********************************/
Global class QuoteHandler_c {
    
    private Quote theQuote;
    public QuoteHandler_c(ApexPages.StandardController stdController) {
        
       // this.theQuote = (Quote)stdController.getRecord();
    }
    
    @remoteAction
    global static List<Custom_Quote_Item__c> getQuoteItems(String quoteId){
    	system.debug('..qutoeid...'+quoteId);
        List<Custom_Quote_Item__c> Qitems = [select id, name, Parent_Item_ID__c, quote__c, level__c from Custom_Quote_Item__c where Quote__c = :quoteId ORDER BY level__c ASC  ];
        return Qitems;
    }
    

}