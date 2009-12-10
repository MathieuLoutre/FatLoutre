with Ahven.Framework;
with Text_IO; use Text_IO;
with PMot; use PMot;
with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PFichier; use PFichier;

package FL_Tests is
    type Test is new Ahven.Framework.Test_Case with null record;

    procedure Initialize(T : in out Test);

    procedure My_First_Test;
        
end FL_Tests;