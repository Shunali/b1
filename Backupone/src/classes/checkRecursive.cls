public Class checkRecursive{
    private static boolean run = true;
    public static boolean runOnce(){
    if(run){
     run=false;
     return true;
    }else{
        return run;
    }
    }
    private static boolean run1 = true;
    public static boolean runOnce1(){
    if(run1){
     run1=false;
     return true;
    }else{
        return run1;
    }
    }
}