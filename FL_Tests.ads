with Ahven.Framework;
with PListe_Gen;
with PMot; use PMot;

package FL_Tests is
    type Test is new Ahven.Framework.Test_Case with null record;

    procedure Initialize(T : in out Test);

    procedure My_First_Test;
        
end FL_Tests;