with Ahven; use Ahven;

package body FL_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "Tests sur FatLoutre");

        Framework.Add_Test_Routine(T, My_First_Test'Access, "Vacuité des mots");
    end Initialize;
      
    procedure My_First_Test is
        L: TCouple;
        M: TMot;
        T: TListe_Couple;
    begin
        creer_Mot(M);
        creer_Liste_Couple(T);
        
        ajout_lettre_fin(M, 'L');
        creer_Couple(L, M, 1);
        
        ajout_Mot(T, M);
        
        affiche_mot(mot_Couple(valeur_Couple(T)));
        
        assert(FALSE, "FAIL MOTHERFUCKA");
    end My_First_Test;
      
end FL_Tests;