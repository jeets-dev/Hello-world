public with sharing class Welcomepagectlr {

  
  public pagereference gotoFeedbackPage(){
      Pagereference pg = new pagereference('/apex/feedbackform');
      pg.setRedirect(true);
      return pg;
  }
}