import java.util.Random;
import java.io.*;
public class InitValGen{
  private double p;  //the total density  
  private int n;  //the matrix size nxn
  private int val[][];
  private String fileName;
  public InitValGen(double prob,int n,String fname)
  {
     p=prob;
     this.n=n;
     val=new int [n][n];
     fileName=fname+".val"; 
  } 
 
  public void genInitFile()
  {
    Random pRand=new Random(1200);
    Random abRand=new Random(3000);
    Random valRand=new Random(4000);
    double pval;
    boolean abval;
    int cellval,i,j;
    String sVal="";
    i=0;
    j=0;
    
    for (i=0; i<n; i++)
    {
      for (j=0;j<n;j++)
      {
        abval=abRand.nextBoolean();
        if (abval)
        {
          val[i][j]=1;
        }   
        else
          val[i][j]=0; 
      }

    } 

    for (i=0; i<n; i++)
    {
       for (j=0;j<n;j++)
      {
         pval=pRand.nextDouble();
         if (pval<=p)
        {
          cellval=valRand.nextInt(4);
          //abval=abRand.nextBoolean();
          if (val[i][j]==1)
            cellval+=11 ;  //A particle
          else
            cellval+=21; //B particle
         }
         else
         {
           cellval=0;   //empty cell
         }
         //val[i][j]=cellval;
         sVal+="("+i+","+j+")="+cellval+"\n";
      }//end of j loop
    } //end of i loop 
    try
    {
       FileOutputStream outFile=new FileOutputStream(fileName,true);
       outFile.write(sVal.getBytes());
       outFile.close(); 
       System.out.println("initial values have been created in"+fileName); 
     }
     catch (java.io.IOException e)
     {
        System.out.println("error opening file:"+fileName);
        System.exit(1);
     }


  }

  public static void main(String [] args)
  {
    if (args.length<3)
    {
     System.out.println("Parameters are incomplete! require:probability, size,filename");
     System.exit(0);
    }
    double p=(new Double(args[0])).doubleValue();
   if (p<0||p>1)
    {
      System.out.println("probability should be in the range [0,1]");
      System.exit(0);
    }
    int size=(new Integer(args[1])).intValue();
    if (size<0)
    {
      System.out.println("size should be positive and integer!");
      System.exit(0);
    }  
   InitValGen valGen=new InitValGen(p,size,args[2]);
   valGen.genInitFile();
   System.exit(0);

  } //end of main

 }  //end of class
 
