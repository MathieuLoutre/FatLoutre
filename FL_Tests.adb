with Ahven; use Ahven;

package body FL_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "Tests sur FatLoutre");

        Framework.Add_Test_Routine(T, My_First_Test'Access, "Test sur les mots");
    end Initialize;
      
    procedure My_First_Test is
        L: TMot;
    begin
        creer_Mot(L);
        Assert(mot_Vide(L), "MEH");
    end My_First_Test;
      
end FL_Tests;