public class slectpicklistvalues {
public string selectedValue{get;set;}
 
 public slectpicklistvalues ()
 {
     selectedValue='Amount';
 }
public List<SelectOption> getItems()
{
List<SelectOption> options = new List<SelectOption>();
options.add(new SelectOption('--Select--','--Select--'));
options.add(new SelectOption('Amount','Amount'));
options.add(new SelectOption('Percent','Percent'));
return options;
 }
}