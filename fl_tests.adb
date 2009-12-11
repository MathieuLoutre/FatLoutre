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
        
        assert(prefixe(Mot, Mot2) = True, "La verification de préfixe ne marche pas")
    end test_Mot_Prefixe;

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
        
        assert(prefixe(Mot, Mot2) = True, "La verification de suffixe ne marche pas")
    end test_Mot_Suffixe;

    procedure test_Mot_Facteur is
    begin
    end test_Mot_Facteur;

    procedure test_Mot_Egaux is
    begin
    end test_Mot_Egaux;

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
        
        assert(prefixe(Mot, Mot2) = False, "La verification de préfixe ne marche pas")
    end test_Mot_Prefixe_Fail;

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
        
        assert(prefixe(Mot, Mot2) = True, "La verification de suffixe ne marche pas")
    end test_Mot_Suffixe;

    procedure test_Mot_Facteur_Fail;

    procedure test_Mot_Egaux_Fail;


-- Test sur le PCouple
    procedure test_Couple_Egaux is
    Couple1: TCouple;
    Couple2: TCouple;
    Mot1: TMot;
    Mot2: TMot;

    begin
	creer_Mot(Mot1);
	ajout_Lettre_Fin(Mot2, 'M');
        ajout_Lettre_Fin(Mot2, 'e');
        ajout_Lettre_Fin(Mot2, 'h');
        creer_Couple(Couple1, Mot1, 3);

        creer_Mot(Mot2);
	ajout_Lettre_Fin(Mot2, 'M');
        ajout_Lettre_Fin(Mot2, 'e');
        ajout_Lettre_Fin(Mot2, 'h');
	creer_Couple(Couple2, Mot2, 3);
        
        assert(couple_Egaux(Couple1, Couple2) = True, "Les deux mots sont égaux");
    end test_Couple_Egaux;

    procedure test_Couple_Egaux_Fail is
    Couple1: TCouple;
    Couple2: TCouple;
    Mot1: TMot;
    Mot2: TMot;

    begin
	creer_Mot(Mot1);
	ajout_Lettre_Fin(Mot2, 'M');
        ajout_Lettre_Fin(Mot2, 'e');
        ajout_Lettre_Fin(Mot2, 'h');
        creer_Couple(Couple1, Mot1, 3);

        creer_Mot(Mot2);
	ajout_Lettre_Fin(Mot2, 'N');
        ajout_Lettre_Fin(Mot2, 'i');
        ajout_Lettre_Fin(Mot2, 'h');
	creer_Couple(Couple2, Mot2, 2);
        
        assert(couple_Egaux(Couple1, Couple2) = False, "Les deux mots ne sont pas égaux");
    end test_Couple_Egaux_Fail;

    procedure test_couple_Superieur is
    Couple1: TCouple;
    Couple2: TCouple;
    Mot1: TMot;
    Mot2: TMot;
    begin
    	ajout_Lettre_Fin(Mot2, 'M');
        ajout_Lettre_Fin(Mot2, 'e');
        ajout_Lettre_Fin(Mot2, 'h');
        creer_Couple(Couple1, Mot1, 3);

        creer_Mot(Mot2);
	ajout_Lettre_Fin(Mot2, 'N');
        ajout_Lettre_Fin(Mot2, 'i');
        ajout_Lettre_Fin(Mot2, 'h');
	creer_Couple(Couple2, Mot2, 2);

	assert(couple_Superieur(Couple1, Couple2) = True, "Le couple 2 est Supérieur au couple 1");
    end test_couple_Superieur;

    procedure test_couple_Superieur_Fail is
    Couple1: TCouple;
    Couple2: TCouple;
    Mot1: TMot;
    Mot2: TMot;
    begin
	ajout_Lettre_Fin(Mot2, 'N');
	ajout_Lettre_Fin(Mot2, 'i');
	ajout_Lettre_Fin(Mot2, 'h');
	creer_Couple(Couple1, Mot1, 3);

	creer_Mot(Mot2);
	ajout_Lettre_Fin(Mot2, 'M');
	ajout_Lettre_Fin(Mot2, 'e');
	ajout_Lettre_Fin(Mot2, 'h');
	creer_Couple(Couple2, Mot2, 2);

	assert(couple_Superieur(Couple1, Couple2) = True, "Le couple 2 n'est pas Supérieur au couple 1");
    end test_couple_Superieur_Fail;

      
end FL_Tests;