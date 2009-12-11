with Ahven; use Ahven;

package body FL_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "Tests sur FatLoutre");

        -- Les Mots
        Framework.Add_Test_Routine(T, test_Mot_Vide'Access, "Mot vide");
        Framework.Add_Test_Routine(T, test_Mot_Plein'Access, "Mot vide Fail");
        Framework.Add_Test_Routine(T, test_Mot_Taille'Access, "Taille Mot");
        Framework.Add_Test_Routine(T, test_Mot_Suffixe'Access, "Suffixe");
        Framework.Add_Test_Routine(T, test_Mot_Suffixe_Fail'Access, "Suffixe Fail");
        Framework.Add_Test_Routine(T, test_Mot_Prefixe'Access, "Prefixe");
        Framework.Add_Test_Routine(T, test_Mot_Prefixe_Fail'Access, "Prefixe Fail");
        Framework.Add_Test_Routine(T, test_Mot_Facteur'Access, "Facteur");
        Framework.Add_Test_Routine(T, test_Mot_Facteur_Fail'Access, "Facteur Fail");
        Framework.Add_Test_Routine(T, test_Mot_Egaux'Access, "Mot Egaux");
        Framework.Add_Test_Routine(T, test_Mot_Egaux_Fail'Access, "Mot Egaux Fail");
        
        -- Les Couples
        Framework.Add_Test_Routine(T, test_Couple_Egaux'Access, "Egalité");
        Framework.Add_Test_Routine(T, test_Couple_Egaux_Fail'Access, "Egalité Fail");
        Framework.Add_Test_Routine(T, test_Couple_Superieur'Access, "Superieur");
        Framework.Add_Test_Routine(T, test_Couple_Superieur_Fail'Access, "Superieur Fail");
        Framework.Add_Test_Routine(T, test_Couple_Occurrence'Access, "Occurrence");
        Framework.Add_Test_Routine(T, test_Couple_Mot'Access, "Get Mot");
        
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
        
        assert(mots_Egaux(Mot, Mot2) = True, "La verification de facteur ne marche pas");
    end test_Mot_Egaux;

    procedure test_Mot_Egaux_Fail is
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
        
        ajout_Lettre_Fin(Mot2, 'C');
        ajout_Lettre_Fin(Mot2, 'a');
        ajout_Lettre_Fin(Mot2, 's');
        ajout_Lettre_Fin(Mot2, 't');
        ajout_Lettre_Fin(Mot2, 'o');
        ajout_Lettre_Fin(Mot2, 'r');
        
        assert(mots_Egaux(Mot, Mot2) = False, "La verification de facteur ne marche pas");
    end test_Mot_Egaux_Fail;
    
    
-- Test sur le PCouple
    procedure test_Couple_Egaux is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	    creer_Mot(Mot1);
	    ajout_Lettre_Fin(Mot1, 'M');
        ajout_Lettre_Fin(Mot1, 'e');
        ajout_Lettre_Fin(Mot1, 'h');
        creer_Couple(Couple1, Mot1, 3);

        creer_Mot(Mot2);
	    ajout_Lettre_Fin(Mot2, 'M');
        ajout_Lettre_Fin(Mot2, 'e');
        ajout_Lettre_Fin(Mot2, 'h');
	    creer_Couple(Couple2, Mot2, 3);
        
        assert(couples_Egaux(Couple1, Couple2) = True, "Les deux mots ne sont pas égaux");
    end test_Couple_Egaux;

    procedure test_Couple_Egaux_Fail is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	    creer_Mot(Mot1);
	    ajout_Lettre_Fin(Mot1, 'M');
        ajout_Lettre_Fin(Mot1, 'e');
        ajout_Lettre_Fin(Mot1, 'h');
        creer_Couple(Couple1, Mot1, 3);

        creer_Mot(Mot2);
	    ajout_Lettre_Fin(Mot2, 'N');
        ajout_Lettre_Fin(Mot2, 'i');
        ajout_Lettre_Fin(Mot2, 'h');
	    creer_Couple(Couple2, Mot2, 2);
        
        assert(couples_Egaux(Couple1, Couple2) = False, "Les deux mots sont égaux");
    end test_Couple_Egaux_Fail;

    procedure test_Couple_Superieur is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
    	ajout_Lettre_Fin(Mot1, 'M');
        ajout_Lettre_Fin(Mot1, 'e');
        ajout_Lettre_Fin(Mot1, 'h');
        creer_Couple(Couple1, Mot1, 3);

        creer_Mot(Mot2);
	    ajout_Lettre_Fin(Mot2, 'N');
        ajout_Lettre_Fin(Mot2, 'i');
        ajout_Lettre_Fin(Mot2, 'h');
	    creer_Couple(Couple2, Mot2, 2);

	    assert(couple_Superieur(Couple1, Couple2) = True, "Le couple 2 est Supérieur au couple 1");
    end test_Couple_Superieur;

    procedure test_Couple_Superieur_Fail is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	    ajout_Lettre_Fin(Mot1, 'N');
	    ajout_Lettre_Fin(Mot1, 'i');
	    ajout_Lettre_Fin(Mot1, 'h');
	    creer_Couple(Couple1, Mot1, 3);

	    creer_Mot(Mot2);
	    ajout_Lettre_Fin(Mot2, 'M');
	    ajout_Lettre_Fin(Mot2, 'e');
	    ajout_Lettre_Fin(Mot2, 'h');
	    creer_Couple(Couple2, Mot2, 2);

	    assert(couple_Superieur(Couple1, Couple2) = True, "Le couple 2 n'est pas Supérieur au couple 1");
    end test_Couple_Superieur_Fail;

    procedure test_Couple_Mot is
        Couple: TCouple;
        Mot: TMot;
    begin
        ajout_Lettre_Fin(Mot, 'N');
        ajout_Lettre_Fin(Mot, 'i');
        ajout_Lettre_Fin(Mot, 'h');
        creer_Couple(Couple, Mot, 3);

        assert(mot_Couple(Couple) = Mot, "Le Couple.Mot est égal au Mot");
    end test_Couple_Mot;

    procedure test_Couple_Occurrence is
        Couple: TCouple;
        Mot: TMot;
    begin
	    ajout_Lettre_Fin(Mot, 'N');
	    ajout_Lettre_Fin(Mot, 'i');
	    ajout_Lettre_Fin(Mot, 'h');
	    creer_Couple(Couple, Mot, 3);

	    assert(occurrence(Couple) = 3, "Le Couple.occurrence est égal à l'occurence donnée");
    end test_Couple_Occurrence;


-- Test sur le PListe_Couple
    procedure test_Liste_Couple_Vide is
        Liste_Couple: TListe_Couple;
    begin
	    creer_Liste_Couple(Liste_Couple);

        assert(liste_Couple_Vide(Liste_Couple) = True, "La création de liste ne renvoi pas une liste vide");
    end test_Liste_Couple_Vide;

    procedure test_Liste_Couple_Plein is   
	Liste_Couple: TListe_Couple;
	Mot : TMot;
    begin
	ajout_Lettre_Fin(Mot, 'N');
	ajout_Lettre_Fin(Mot, 'i');
	ajout_Lettre_Fin(Mot, 'h');
	creer_Couple(Liste_Couple, Mot, 3);

	creer_Liste_Couple(Liste_Couple);
	ajout_Fin(Liste_Couple, Mot);

        assert(liste_Couple_Vide(Liste_Couple) = False, "L'ajout de Couple en fin n'ajoute rien");
    end test_Liste_Couple_Plein;

end FL_Tests;