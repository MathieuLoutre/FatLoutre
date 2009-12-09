with Ahven; use Ahven;

package body FL_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "Tests sur FatLoutre");

        Framework.Add_Test_Routine(T, My_First_Test'Access, "My first test");
    end Initialize;
      
    procedure My_First_Test is
        L: TMot;
    begin
        L := creer_Liste(L);
        Assert(vide(L), "MEH");
    end My_First_Test;
      
   end FL_Tests;