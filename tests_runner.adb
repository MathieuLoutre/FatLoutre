--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/tests_runner.adb

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