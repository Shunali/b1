@isTest
public class SOQLDynamTest {   // Test Class


    @isTest
    static void testSOQLDynamOneTest() {   // test class method 1

        SOQLDynam obj = new SOQLDynam();
        obj.selectedObjects='a__c';
        obj.Details();
        system.assertequals(obj.fields.size(),13);
    }

    @isTest
    static void testSOQLDynamSecondTest() {   // test class method 2
        list<String>sfields=new List<String>();
        sfields.add('name');
        sfields.add('lastmodifieddate');
        SOQLDynam obj = new SOQLDynam();
        obj.selectedObjects='a__c';
        obj.sfields=sfields;
        obj.Details();
        obj.addFields();
        system.assertequals(obj.fSelected.size(),2);
    }

    @isTest
    static void testSOQLDynamThirdTest() {   // test class method 3
        list<String>sfields=new List<String>();
        sfields.add('name');
        sfields.add('lastmodifieddate');
        list<String>rfields=new List<String>();
        rfields.add('lastmodifieddate');
        SOQLDynam obj = new SOQLDynam();
        obj.selectedObjects='a__c';
        obj.sfields=sfields;
        obj.rfields=rfields;
        obj.Details();
        obj.addFields();
        obj.removeFields();
        system.assertequals(obj.fSelected.size(),1);
    }



    @isTest
    static void testSOQLDynamFiveTest() {   // test class method 5
        list<String>sfields=new List<String>();
        SOQLDynam obj = new SOQLDynam();
        obj.selectedObjects='None';
        obj.myQueryData();
        List<Apexpages.Message> msg = ApexPages.getMessages();
        boolean b = false;
        for(Apexpages.Message msgs:msg){
            if (msgs.getDetail().contains('NO records to display'))
                 b = true;
            }
        system.assert(b);
        }
}