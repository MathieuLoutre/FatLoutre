with Ahven; use Ahven;

package body FL_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "Tests sur FatLoutre");

        Framework.Add_Test_Routine(T, test_Mot_Vide'Access, "Mot vide");
    end Initialize;
      
    procedure test_Mot_Vide is
        Mot: TMot;
    begin
        creer_Mot(Mot);
        
        assert(mot_Vide(Mot) = True, "La création de mot ne renvoi pas un mot vide");
    end test_Mot_Vide;
    
    procedure test_Mot_Plein is
        Mot: TMot;
    begin
        creer_Mot(Mot);
        ajout_Lettre_Fin(Mot, 'L');
        
        assert(mot_Vide(Mot) = False, "L'ajout de lettre en fin n'ajoute rien");
    end test_Mot_Plein;

    procedure test_Mot_Taille is
        Mot: TMot;
    begin
        creer_Mot(Mot);
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        
        assert(longueur_Mot(Mot) = 2, "La taille ne correspond pas au nombre d'ajout");
    end test_Mot_Taille;

    procedure test_Mot_Suffixe is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 't');
        ajout_Lettre_Fin(Mot2, 'r');
        ajout_Lettre_Fin(Mot2, 'e');
        
        assert(suffixe(Mot, Mot2) = True, "La verification de suffixe ne marche pas");
    end test_Mot_Suffixe;
    
    procedure test_Mot_Suffixe_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 't');
        ajout_Lettre_Fin(Mot2, 'r');
        ajout_Lettre_Fin(Mot2, 'e');
        
        assert(suffixe(Mot, Mot2) = False, "La verification de suffixe ne marche pas");
    end test_Mot_Suffixe_Fail;

    procedure test_Mot_Prefixe is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 'L');
        ajout_Lettre_Fin(Mot2, 'o');
        ajout_Lettre_Fin(Mot2, 'u');
        
        assert(prefixe(Mot, Mot2) = True, "La verification de préfixe ne marche pas");
    end test_Mot_Prefixe;

    procedure test_Mot_Prefixe_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 'M');
        ajout_Lettre_Fin(Mot2, 'e');
        ajout_Lettre_Fin(Mot2, 'h');
        
        assert(prefixe(Mot, Mot2) = False, "La verification de préfixe ne marche pas");
    end test_Mot_Prefixe_Fail;

    procedure test_Mot_Facteur is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 'o');
        ajout_Lettre_Fin(Mot2, 'u');
        
        assert(facteur(Mot, Mot2) = True, "La verification de facteur ne marche pas");
    end test_Mot_Facteur;
    
    procedure test_Mot_Facteur_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 'm');
        ajout_Lettre_Fin(Mot2, 'e');
        
        assert(facteur(Mot, Mot2) = False, "La verification de facteur ne marche pas");
    end test_Mot_Facteur_Fail;

    procedure test_Mot_Egaux is
        Mot: TMot;
        Mot2: TMot;
    begin
        creer_Mot(Mot);
        creer_Mot(Mot2);
        
        ajout_Lettre_Fin(Mot, 'L');
        ajout_Lettre_Fin(Mot, 'o');
        ajout_Lettre_Fin(Mot, 'u');
        ajout_Lettre_Fin(Mot, 't');
        ajout_Lettre_Fin(Mot, 'r');
        ajout_Lettre_Fin(Mot, 'e');
        
        ajout_Lettre_Fin(Mot2, 'L');
        ajout_Lettre_Fin(Mot2, 'o');
        ajout_Lettre_Fin(Mot2, 'u');
        ajout_Lettre_Fin(Mot2, 't');
        ajout_Lettre_Fin(Mot2, 'r');
        ajout_Lettre_Fin(Mot2, 'e');
        
        assert(Egaux(Mot, Mot2) = True, "La verification de facteur ne marche pas");
    end test_Mot_Egaux;
      
end FL_Tests;