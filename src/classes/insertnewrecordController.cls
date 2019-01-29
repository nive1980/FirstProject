public class insertnewrecordController{

public Component__c cds{get; set;}

public Component__c setcds(Component__c op){
this.cds=op;
return cds;

}

public insertnewrecordController(ApexPages.StandardController controller) {
cds=new Component__c();
}

public pagereference Save(){

Component__c cd = new Component__c();
cd.Name__c=cds.Name__c;
insert cd;
Pagereference pg = new Pagereference('/' + cd.id);
pg.setredirect(true);
return pg;


}

 

}