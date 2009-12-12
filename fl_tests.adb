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
        Framework.Add_Test_Routine(T, test_Mot_Superieur'Access, "Mot Superieur");
        Framework.Add_Test_Routine(T, test_Mot_Superieur_Fail'Access, "Mot Superieur Fail");
        
        -- Les Couples
        Framework.Add_Test_Routine(T, test_Couple_Egaux'Access, "Egalité");
        Framework.Add_Test_Routine(T, test_Couple_Egaux_Fail'Access, "Egalité Fail");
        Framework.Add_Test_Routine(T, test_Couple_Superieur_Occurrence'Access, "Superieur Occurrence");
        Framework.Add_Test_Routine(T, test_Couple_Superieur_Occurrence_Fail'Access, "Superieur Occurrence Fail");
        Framework.Add_Test_Routine(T, test_Couple_Inferieur_Mot'Access, "Superieur Inferieur");
        Framework.Add_Test_Routine(T, test_Couple_Inferieur_Mot_Fail'Access, "Superieur Inferieur Fail");
        Framework.Add_Test_Routine(T, test_Couple_Occurrence'Access, "Occurrence");
        Framework.Add_Test_Routine(T, test_Couple_Mot'Access, "Get Mot");
        
        -- Liste de couples
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Vide'Access, "Liste Couple Vide");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Plein'Access, "Liste Couple Plein");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_valeur'Access, "Liste Couple Valeur");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Superieur'Access, "Liste Couple nb Superieur");
        
    end Initialize;
      
    procedure test_Mot_Vide is
    begin
        assert(mot_Vide(creer_Mot) = True, "La création de mot ne renvoi pas un mot vide");
    end test_Mot_Vide;
    
    procedure test_Mot_Plein is
        Mot: TMot;
    begin
        Mot := creer_Mot;
        Mot := ajout_Lettre_Fin(Mot, 'l');
        
        assert(mot_Vide(Mot) = False, "L'ajout de lettre en fin n'ajoute rien");
    end test_Mot_Plein;

    procedure test_Mot_Taille is
        Mot: TMot;
    begin
        Mot := creer_Mot;
        Mot := ajout_Lettre_Fin(Mot, 'M');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        Mot := ajout_Lettre_Fin(Mot, 'h');
        
        assert(longueur_Mot(Mot) = 3, "La taille ne correspond pas au nombre d'ajout");
    end test_Mot_Taille;

    procedure test_Mot_Suffixe is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot := ajout_Lettre_Fin(Mot2, 't');
        Mot := ajout_Lettre_Fin(Mot2, 'r');
        Mot := ajout_Lettre_Fin(Mot2, 'e');
        
        assert(suffixe(Mot, Mot2) = True, "La verification de suffixe ne marche pas");
    end test_Mot_Suffixe;
    
    procedure test_Mot_Suffixe_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 't');
        Mot2 := ajout_Lettre_Fin(Mot2, 'r');
        Mot2 := ajout_Lettre_Fin(Mot2, 'e');
        
        assert(suffixe(Mot, Mot2) = False, "La verification de suffixe ne marche pas");
    end test_Mot_Suffixe_Fail;

    procedure test_Mot_Prefixe is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'L');
        Mot2 := ajout_Lettre_Fin(Mot2, 'o');
        Mot2 := ajout_Lettre_Fin(Mot2, 'u');
        
        assert(prefixe(Mot, Mot2) = True, "La verification de préfixe ne marche pas");
    end test_Mot_Prefixe;

    procedure test_Mot_Prefixe_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'M');
        Mot2 := ajout_Lettre_Fin(Mot2, 'e');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
        
        assert(prefixe(Mot, Mot2) = False, "La verification de préfixe ne marche pas");
    end test_Mot_Prefixe_Fail;

    procedure test_Mot_Facteur is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'o');
        Mot2 := ajout_Lettre_Fin(Mot2, 'u');
        
        assert(facteur(Mot, Mot2) = True, "La verification de facteur ne marche pas");
    end test_Mot_Facteur;
    
    procedure test_Mot_Facteur_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'm');
        Mot2 := ajout_Lettre_Fin(Mot2, 'e');
        
        assert(facteur(Mot, Mot2) = False, "La verification de facteur ne marche pas");
    end test_Mot_Facteur_Fail;

    procedure test_Mot_Egaux is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'L');
        Mot2 := ajout_Lettre_Fin(Mot2, 'o');
        Mot2 := ajout_Lettre_Fin(Mot2, 'u');
        Mot2 := ajout_Lettre_Fin(Mot2, 't');
        Mot2 := ajout_Lettre_Fin(Mot2, 'r');
        Mot2 := ajout_Lettre_Fin(Mot2, 'e');
        
        assert(mots_Egaux(Mot, Mot2) = True, "La verification de facteur ne marche pas");
    end test_Mot_Egaux;

    procedure test_Mot_Egaux_Fail is
        Mot: TMot;
        Mot2: TMot;
    begin
        Mot := creer_Mot;
        Mot2 := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'L');
        Mot := ajout_Lettre_Fin(Mot, 'o');
        Mot := ajout_Lettre_Fin(Mot, 'u');
        Mot := ajout_Lettre_Fin(Mot, 't');
        Mot := ajout_Lettre_Fin(Mot, 'r');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'C');
        Mot2 := ajout_Lettre_Fin(Mot2, 'a');
        Mot2 := ajout_Lettre_Fin(Mot2, 's');
        Mot2 := ajout_Lettre_Fin(Mot2, 't');
        Mot2 := ajout_Lettre_Fin(Mot2, 'o');
        Mot2 := ajout_Lettre_Fin(Mot2, 'r');
        
        assert(mots_Egaux(Mot, Mot2) = False, "La verification de facteur ne marche pas");
    end test_Mot_Egaux_Fail;
    
    procedure test_Mot_Superieur is
        Mot1: TMot;
        Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot1, 'M');
        Mot2 := ajout_Lettre_Fin(Mot1, 'e');
        Mot2 := ajout_Lettre_Fin(Mot1, 'h');

        Mot2 := creer_Mot;
	    Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');

	    assert(mot_Superieur(Couple2, Couple1) = True, "Le couple 2 ne devrait pas être superieur au couple 1");
    end test_Mot_Superieur;

    procedure test_Mot_Superieur_Fail is
        Mot1: TMot;
        Mot2: TMot;
    begin
        Mot1 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot1, 'M');
        Mot2 := ajout_Lettre_Fin(Mot1, 'e');
        Mot2 := ajout_Lettre_Fin(Mot1, 'h');

        Mot2 := creer_Mot;
	    Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');


	assert(mot_Superieur(Couple2, Couple1) = False, "Le couple1 devrait être inferieur au couple2");
    end test_Mot_Superieur_Fail;
    
-- Test sur le PCouple
    procedure test_Couple_Egaux is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	Mot1 :=creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot1, 'M');
        Mot2 := ajout_Lettre_Fin(Mot1, 'e');
        Mot2 := ajout_Lettre_Fin(Mot1, 'h');
        Couple1 := creer_Couple(Mot1, 3);

        Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'M');
        Mot2 := ajout_Lettre_Fin(Mot2, 'e');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	Couple2 := creer_Couple(Mot2, 3);
        
        assert(couples_Egaux_Mot(Couple1, Couple2) = True, "Les deux mots ne sont pas égaux");
    end test_Couple_Egaux;

    procedure test_Couple_Egaux_Fail is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	Mot1 :=creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot1, 'M');
        Mot2 := ajout_Lettre_Fin(Mot1, 'e');
        Mot2 := ajout_Lettre_Fin(Mot1, 'h');
        Couple1 := creer_Couple(Mot1, 3);

        Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	Couple2 := creer_Couple(Mot2, 2);
        
        assert(couples_Egaux_Mot(Couple1, Couple2) = False, "Les deux ne devrait pas être égaux");
    end test_Couple_Egaux_Fail;

    procedure test_Couple_Superieur_Occurrence is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	Mot1 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot1, 'M');
        Mot2 := ajout_Lettre_Fin(Mot1, 'e');
        Mot2 := ajout_Lettre_Fin(Mot1, 'h');
        Couple1 := creer_Couple(Mot1, 3);

        Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	Couple2 := creer_Couple(Mot2, 2);

	    assert(couple_Superieur_Occurrence(Couple2, Couple1) = True, "Le couple 2 ne devrait pas avoir plus d'occurrence que le couple 1");
    end test_Couple_Superieur_Occurrence;

    procedure test_Couple_Superieur_Occurrence_Fail is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	Mot1 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot1, 'N');
	Mot2 := ajout_Lettre_Fin(Mot1, 'i');
	Mot2 := ajout_Lettre_Fin(Mot1, 'h');
	Couple1 := creer_Couple(Mot1, 3);

	Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'M');
	Mot2 := ajout_Lettre_Fin(Mot2, 'e');
	Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	Couple2 := creer_Couple(Mot2, 2);

	assert(couple_Superieur_Occurrence(Couple2, Couple1) = False, "Le couple1 ne devrait pas avoir plus d'occurrence que le couple2");
    end test_Couple_Superieur_Occurrence_Fail;

    procedure test_Couple_Inferieur_Mot is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	Mot1 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot1, 'M');
        Mot2 := ajout_Lettre_Fin(Mot1, 'e');
        Mot2 := ajout_Lettre_Fin(Mot1, 'h');
        Couple1 := creer_Couple(Mot1, 3);

        Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	Couple2 := creer_Couple(Mot2, 2);

	    assert(couple_Inferieur_Mot(Couple1, Couple2) = True, "Le couple 2 devrait être inferieur au couple 1");
    end test_Couple_Inferieur_Mot;

    procedure test_Couple_Inferieur_Mot_Fail is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	Mot1 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot1, 'N');
	Mot2 := ajout_Lettre_Fin(Mot1, 'i');
	Mot2 := ajout_Lettre_Fin(Mot1, 'h');
	Couple1 := creer_Couple(Mot1, 3);

	Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'M');
	Mot2 := ajout_Lettre_Fin(Mot2, 'e');
	Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	Couple2 := creer_Couple(Mot2, 2);

	assert(couple_Inferieur_Mot(Couple1, Couple2) = False, "Le couple1 devrait être inferieur au couple2");
    end test_Couple_Inferieur_Mot_Fail;
    

    procedure test_Couple_Mot is
        Couple: TCouple;
        Mot: TMot;
    begin
	Mot := creer_Mot;
        Mot := ajout_Lettre_Fin(Mot, 'N');
        Mot := ajout_Lettre_Fin(Mot, 'i');
        Mot := ajout_Lettre_Fin(Mot, 'h');
        Couple := creer_Couple(Mot, 3);

        assert(mots_Egaux(mot_Couple(Couple), Mot) = True, "Le Couple.Mot n'est pas égal au Mot");
    end test_Couple_Mot;

    procedure test_Couple_Occurrence is
        Couple: TCouple;
        Mot: TMot;
    begin
	Mot := creer_Mot;
	Mot := ajout_Lettre_Fin(Mot, 'N');
	Mot := ajout_Lettre_Fin(Mot, 'i');
	Mot := ajout_Lettre_Fin(Mot, 'h');
	Couple := creer_Couple(Mot, 3);

	assert(occurrence(Couple) = 3, "Le Couple.occurrence n'est pas égal à l'occurence donnée");
    end test_Couple_Occurrence;


-- Test sur le PListe_Couple
    procedure test_Liste_Couple_Vide is
        Liste_Couple: TListe_Couple;
    begin
	Liste_Couple := creer_Liste_Couple;

        assert(liste_Couple_Vide(Liste_Couple) = True, "La création de liste ne renvoi pas une liste vide");
    end test_Liste_Couple_Vide;

    procedure test_Liste_Couple_Plein is   
	Liste_Couple: TListe_Couple;
	Mot : TMot;
    begin
	Mot := creer_Mot;
	Mot := ajout_Lettre_Fin(Mot, 'N');
	Mot := ajout_Lettre_Fin(Mot, 'i');
	Mot := ajout_Lettre_Fin(Mot, 'h');

	Liste_Couple := creer_Liste_Couple;
	Liste_Couple := ajout_Mot(Liste_Couple, Mot);

        assert(liste_Couple_Vide(Liste_Couple) = False, "L'ajout de Couple en fin n'ajoute rien");
    end test_Liste_Couple_Plein;

    procedure test_Liste_Couple_valeur is
	Liste_Couple: TListe_Couple;
	Mot : TMot;
	Couple : TCouple;
    begin
	Mot := creer_Mot;

	Mot := ajout_Lettre_Fin(Mot, 'N');
	Mot := ajout_Lettre_Fin(Mot, 'i');
	Mot := ajout_Lettre_Fin(Mot, 'h');

	Couple := creer_Couple(Mot, 1);

	Liste_Couple := creer_Liste_Couple;
	Liste_Couple := ajout_Mot(Liste_Couple, Mot);

        assert(valeur_Couple(Liste_Couple) = Couple, "Le Liste_Couple.valeur n'est pas la même valeur que celle entrée");
    end test_Liste_Couple_valeur;

    procedure test_Liste_Couple_nb_Superieur is
	Liste_Couple: TListe_Couple;
	Mot1, Mot2 : TMot;
	Couple1, Couple2 : TCouple;
    begin
	Mot1 := creer_Mot;
	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
	Couple1 := creer_Couple(Mot1, 1);

	Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'N');
	Couple2 := creer_Couple(Mot2, 1);

	Liste_Couple := creer_Liste_Couple;
	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);

        assert(nb_Superieur(Liste_Couple, 2) = 1, "Le nombre de mots supérieur n'est pas bon");
    end test_Liste_Couple_nb_Superieur;

end FL_Tests;