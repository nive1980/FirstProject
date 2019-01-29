public class ActionForProcessBuilder {

   @InvocableMethod
    public static void startWorkflow()
    {
         system.debug('@@@ in startWorkflow start new' );
        //first delete LL RECORDS
        delete [SELECT Id FROM Component__c];
           delete [SELECT Id FROM Connection__c];
        delete [SELECT Id FROM WorkflowConnection__c];
           delete [SELECT Id FROM Workflw__c];
     
     
        //insert record in componet table
        Component__c component1 = new Component__c();
        component1.Name__c='NiveCompnent1';
        insert component1;
        Component__c component2 = new Component__c();
        component2.Name__c='NiveCompnent2';
        insert component2;
        Component__c component3 = new Component__c();
        component3.Name__c='NiveCompnent3';
        insert component3;   
        Component__c component4 = new Component__c();
        component4.Name__c='NiveCompnent4';
        insert component4;
        Component__c component5 = new Component__c();
        component5.Name__c='NiveCompnent5';
        insert component5;  
            system.debug('@@@ in startWorkflow new '+component1.Name__c );
       	//insert records in connections table
        Connection__c connection1 = new Connection__c();
        connection1.Component1__c=component1.Id;
        connection1.Component2__c=component2.Id;
        insert connection1;
   	    		Connection__c connection2 = new Connection__c();
        connection2.Component1__c=component2.Id;
        connection2.Component2__c=component3.Id;
        insert connection2;
       // Connection__c connection3 = new Connection__c();
        //connection3.Component1__c=component2.Id;
        //connection3.Component2__c=component3.Id;
        //insert connection3;
        Connection__c connection4 = new Connection__c();
        connection4.Component1__c=component3.Id;
        connection4.Component2__c=component4.Id;
        insert connection4;
        Workflw__c wkf= new Workflw__c();
        wkf.Name='workflow1';
        insert wkf;
        WorkflowConnection__c wkflcon1 = new WorkflowConnection__c();
        wkflcon1.Connection__c=connection1.Id;
        wkflcon1.Workflw__c=wkf.Id;
        insert wkflcon1;
      WorkflowConnection__c wkflcon2 = new WorkflowConnection__c();
        wkflcon2.Connection__c=connection2.Id;
        wkflcon2.Workflw__c=wkf.Id;
        insert wkflcon2;
    //  WorkflowConnection__c wkflcon3 = new WorkflowConnection__c();
      //  wkflcon3.Connection__c=connection3.Id;

        //wkflcon3.Workflw__c=wkf.Id;
        //insert wkflcon3;
     WorkflowConnection__c wkflcon4 = new WorkflowConnection__c();
        wkflcon4.Connection__c=connection4.Id;
        wkflcon4.Workflw__c=wkf.Id;
        insert wkflcon4;
     	String wkdId=wkf.Id;
        String finalDisplayString='';
         system.debug('@@@ in startWorkflow end'+wkdId );
            for(WorkflowConnection__c wkc:[select Id,Workflw__c,Connection__c from WorkflowConnection__c where Workflw__c=:wkdId]){
             system.debug('wkconn id is '+wkc);
                 system.debug('connection id is '+wkc.Connection__c);
               // String ConnectionId=wkc.Connection__c;
                //system.debug('connection Id is '+ConnectionId);
                for(Connection__c conn:[select Id,Component1__c,Component2__c from Connection__c where Id=:wkc.Connection__c]){
            		system.debug('connection  is '+conn);
                    String comp1Id=conn.Component1__c;
                   String comp2Id=conn.Component2__c;
                  //  system.debug('component1  is '+Component1__c);
                    Component__c comp1 = [select Id,Name,Name__c from Component__c where Id=:comp1Id];
                    system.debug('comp1  is '+comp1.Name__c);
                      Component__c comp2 = [select Id,Name,Name__c from Component__c where Id=:comp2Id];
                     system.debug('comp2  is '+comp2.Name__c);
                  	finalDisplayString=finalDisplayString+comp1.Name__c+'>'+comp2.Name__c;	
                    
            //    Connection__c conn= [select Id from Connection__c where Id=:ConnectionId];
              //  system.debug('connection record comp1 '+conn.Component1__c+' comp2 '+conn.Component2__c);
            
                
               
            }
      

    
    }
        system.debug('finaldisplaystring '+finalDisplayString);
    }
}