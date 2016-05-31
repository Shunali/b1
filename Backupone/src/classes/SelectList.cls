public class SelectList 
{
    public List<selectoption> myoptions{get;set;}
    public String myval{set;get;}
    public SelectList() 
    {
        myoptions=new List<selectoption>();
        selectoption s1=new selectoption('fi','Jan');
        selectoption s2=new selectoption('se','Feb');
        selectoption s3=new selectoption('th','Mar');
        myoptions.add(s1);
        myoptions.add(s2);
        myoptions.add(s3);
        myoptions.add(new selectoption('fo','apr'));
system.debug(myoptions);
    }


public void findLabel()
{ 
    for (SelectOption so : myoptions)
    {
               system.debug('22222'+myval);
    system.debug('22222'+so);
            if (so.getValue() == myval)
            {
               system.debug('22222'+myval);
                myval = so.getLabel();
            }
        }
    }
}