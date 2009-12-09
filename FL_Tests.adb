with Ahven; use Ahven;

package body My_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "My tests");

        Framework.Add_Test_Routine(T, My_First_Test'Access, "My first test");
    end Initialize;
      
      procedure My_First_Test is
      begin
         Assert (1 /= 4, "1 /= 4 failed!");
      end My_First_Test;
      
   end My_Tests;