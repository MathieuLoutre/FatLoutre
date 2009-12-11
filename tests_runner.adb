with Ahven.Text_Runner;
with Ahven.Framework;
with FL_Tests;

procedure Tests_Runner is
   S : Ahven.Framework.Test_Suite_Access :=
     Ahven.Framework.Create_Suite ("Tout les tests!");
begin
   Ahven.Framework.Add_Test (S.all, new FL_Tests.Test);
   Ahven.Text_Runner.Run (S);
   Ahven.Framework.Release_Suite (S);
end Tests_Runner;