--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/fl_tests.adb

with Ahven; use Ahven;

package body FL_Tests is
    procedure Initialize (T : in out Test) is
    begin
        Set_Name (T, "Tests sur FatLoutre");

        -- Les Mots
        Framework.Add_Test_Routine(T, test_Mot_Vide'Access, "Mot vide");
        Framework.Add_Test_Routine(T, test_Mot_Plein'Access, "Mot vide Fail");
        Framework.Add_Test_Routine(T, test_Mot_Taille'Access, "Mot Taille");
        Framework.Add_Test_Routine(T, test_Mot_Suffixe'Access, "Mot Suffixe");
        Framework.Add_Test_Routine(T, test_Mot_Suffixe_Fail'Access, "Mot Suffixe Fail");
        Framework.Add_Test_Routine(T, test_Mot_Prefixe'Access, "Mot Prefixe");
        Framework.Add_Test_Routine(T, test_Mot_Prefixe_Fail'Access, "Mot Prefixe Fail");
        Framework.Add_Test_Routine(T, test_Mot_Facteur'Access, "Mot Facteur");
        Framework.Add_Test_Routine(T, test_Mot_Facteur_Fail'Access, "Mot Facteur Fail");
        Framework.Add_Test_Routine(T, test_Mot_Egaux'Access, "Mot Egaux");
        Framework.Add_Test_Routine(T, test_Mot_Egaux_Fail'Access, "Mot Egaux Fail");
        Framework.Add_Test_Routine(T, test_Mot_Superieur'Access, "Mot Superieur");
        Framework.Add_Test_Routine(T, test_Mot_Superieur_Fail'Access, "Mot Superieur Fail");
        Framework.Add_Test_Routine(T, test_Mot_Petit'Access, "Mot Petit");
        Framework.Add_Test_Routine(T, test_Mot_Petit_Fail'Access, "Mot Petit Fail");
        
        -- Les Couples
        Framework.Add_Test_Routine(T, test_Couple_Egaux'Access, "Couple Egalité");
        Framework.Add_Test_Routine(T, test_Couple_Egaux_Fail'Access, "Couple Egalité Fail");
        Framework.Add_Test_Routine(T, test_Couple_Superieur_Occurrence'Access, "Couple Superieur Occurrence");
        Framework.Add_Test_Routine(T, test_Couple_Superieur_Occurrence_Fail'Access, "Couple Superieur Occurrence Fail");
        Framework.Add_Test_Routine(T, test_Couple_Inferieur_Mot'Access, "Couple Inferieur");
        Framework.Add_Test_Routine(T, test_Couple_Inferieur_Mot_Fail'Access, "Couple Inferieur Fail");
        Framework.Add_Test_Routine(T, test_Couple_Occurrence'Access, "Couple Occurrence");
        Framework.Add_Test_Routine(T, test_Couple_Mot'Access, "Couple Get Mot");
        
        -- Liste de couples
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Vide'Access, "Liste Couple Vide");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Plein'Access, "Liste Couple Plein");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_valeur'Access, "Liste Couple Valeur");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Superieur'Access, "Liste Couple nb Superieur");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Occurrence'Access, "Liste Couple nb Occurrence");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Mots'Access, "Liste Couple nb Mots Differents");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Taille'Access, "Liste Couple Taille");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Presence'Access, "Liste Couple Presence");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Presence_Fail'Access, "Liste Couple Presence Fail");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Prefixe'Access, "Liste Couple nb Prefixe");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Suffixe'Access, "Liste Couple nb Suffixe");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Facteur'Access, "Liste Couple nb Facteur");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Moy_Occur'Access, "Liste Couple moy Occurrence");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_Moy_Long'Access, "Liste Couple moy Longueur");
	    Framework.Add_Test_Routine(T, test_Liste_Couple_nb_Occur_Mot'Access, "Liste Couple nb Occurrence Mot");
	    Framework.Add_Test_Routine(T, test_Liste_Fusion_Couple'Access, "Fusion de Mots");
	    
	    -- Sur les fichiers
	    Framework.Add_Test_Routine(T, test_Fichier_Gen_Liste_Couples'Access, "Generer Fichier");
	    Framework.Add_Test_Routine(T, test_Fichier_Gen_Tree'Access, "Generer Fichier Tree");
	    
	    -- Sur les listes de Trio
	    Framework.Add_Test_Routine(T, test_Liste_Trio_Fusion_Listes'Access, "Fusion de listes");
	    Framework.Add_Test_Routine(T, test_Liste_Trio_Mots_Communs'Access, "Mots Communs");
	    Framework.Add_Test_Routine(T, test_Liste_Trio_Mots_Differents'Access, "Mots Différents");
	    
	    -- TESTS SUR LES MEHHHHH
	    Framework.Add_Test_Routine(T, test_Tree_nb_Superieur'Access, "Tree nb Superieur");
	    Framework.Add_Test_Routine(T, test_Tree_nb_Occurrence'Access, "Tree nb Occurrence");
	    Framework.Add_Test_Routine(T, test_Tree_Taille'Access, "Tree nb mots differents");
	    Framework.Add_Test_Routine(T, test_Tree_Presence'Access, "Tree Presence");
	    Framework.Add_Test_Routine(T, test_Tree_Presence_Fail'Access, "Tree Presence Fail");
	    Framework.Add_Test_Routine(T, test_Tree_nb_Prefixe'Access, "Tree nb Prefixe");
	    Framework.Add_Test_Routine(T, test_Tree_nb_Suffixe'Access, "Tree nb Suffixe");
	    Framework.Add_Test_Routine(T, test_Tree_nb_Facteur'Access, "Tree nb Facteur");
	    Framework.Add_Test_Routine(T, test_Tree_Moy_Occur'Access, "Tree moy Occurrence");
	    Framework.Add_Test_Routine(T, test_Tree_Moy_Long'Access, "Tree moy Longueur");
	    Framework.Add_Test_Routine(T, test_Tree_nb_Occur_Mot'Access, "Tree nb Occurrence Mot");
	    Framework.Add_Test_Routine(T, test_Tree_Fusion'Access, "Tree Fusion de Mots");
	    
        -- TESTS SUR LES MEHHHHH GROOOOOS
	    Framework.Add_Test_Routine(T, test_Tree_Gros_nb_Superieur'Access, "Tree Gros nb Superieur");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_nb_Occurrence'Access, "Tree Gros nb Occurrence");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Taille'Access, "Tree Gros nb mots differents");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Presence'Access, "Tree Gros Presence");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Presence_Fail'Access, "Tree Gros Presence Fail");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_nb_Prefixe'Access, "Tree Gros nb Prefixe");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_nb_Suffixe'Access, "Tree Gros nb Suffixe");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_nb_Facteur'Access, "Tree Gros nb Facteur");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Moy_Occur'Access, "Tree Gros moy Occurrence");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Moy_Long'Access, "Tree Gros moy Longueur");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_nb_Occur_Mot'Access, "Tree Gros nb Occurrence Mot");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Fusion'Access, "Tree Gros Fusion de Mots");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Fusion_Tree'Access, "Fusion de Tree Gros");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Mots_Communs'Access, "Mots Communs Tree Gros");
	    Framework.Add_Test_Routine(T, test_Tree_Gros_Mots_Differents'Access, "Mots Différents Tree Gros");
	    
	    -- TESTS SUR LES ARN
	    Framework.Add_Test_Routine(T, test_ARN_nb_Superieur'Access, "ARN nb Superieur");
	    Framework.Add_Test_Routine(T, test_ARN_nb_Occurrence'Access, "ARN nb Occurrence");
	    Framework.Add_Test_Routine(T, test_ARN_Taille'Access, "ARN nb mots differents");
	    Framework.Add_Test_Routine(T, test_ARN_Presence'Access, "ARN Presence");
	    Framework.Add_Test_Routine(T, test_ARN_Presence_Fail'Access, "ARN Presence Fail");
	    Framework.Add_Test_Routine(T, test_ARN_nb_Prefixe'Access, "ARN nb Prefixe");
	    Framework.Add_Test_Routine(T, test_ARN_nb_Suffixe'Access, "ARN nb Suffixe");
	    Framework.Add_Test_Routine(T, test_ARN_nb_Facteur'Access, "ARN nb Facteur");
	    Framework.Add_Test_Routine(T, test_ARN_Moy_Occur'Access, "ARN moy Occurrence");
	    Framework.Add_Test_Routine(T, test_ARN_Moy_Long'Access, "ARN moy Longueur");
	    Framework.Add_Test_Routine(T, test_ARN_nb_Occur_Mot'Access, "ARN nb Occurrence Mot");
	    Framework.Add_Test_Routine(T, test_ARN_Fusion'Access, "ARN Fusion de Mots");
        -- Framework.Add_Test_Routine(T, test_ARN_Fusion_Tree'Access, "Fusion de ARN");
        -- Framework.Add_Test_Routine(T, test_ARN_Mots_Communs'Access, "Mots Communs ARN");
        -- Framework.Add_Test_Routine(T, test_ARN_Mots_Differents'Access, "Mots Différents ARN");
        
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
        
        assert(suffixe(Mot, Mot2) = True, "Mot2 devrait être suffixe de Mot1");
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
        Mot2 := ajout_Lettre_Fin(Mot2, 'a');
        
        assert(suffixe(Mot, Mot2) = False, "Mot2 ne devrait pas être suffixe de Mot1");
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
        
        assert(prefixe(Mot, Mot2) = True, "Mot2 devrait être préfixe de Mot1");
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
        
        Mot2 := ajout_Lettre_Fin(Mot2, 'L');
        Mot2 := ajout_Lettre_Fin(Mot2, 'e');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
        
        assert(prefixe(Mot, Mot2) = False, "Mot2 ne devrait pas être suffixe de Mot1");
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
        
        assert(facteur(Mot, Mot2) = True, "Mot2 devrait être facteur de Mot1");
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
        
        assert(facteur(Mot, Mot2) = False, "Mot2 ne devrait pas être facteur de Mot1");
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
        
        assert(mots_Egaux(Mot, Mot2) = True, "Les 2 mots devraient être égaux");
    end test_Mot_Egaux;
    
    procedure test_Mot_Petit is
        Mot: TMot;
    begin
        Mot := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'm');
        Mot := ajout_Lettre_Fin(Mot, 'e');
        Mot := ajout_Lettre_Fin(Mot, 'h');
        
        assert(significatif(Mot) = True, "Le mot devrait être significatif");
    end test_Mot_Petit;
    
    procedure test_Mot_Petit_Fail is
        Mot: TMot;
    begin
        Mot := creer_Mot;
        
        Mot := ajout_Lettre_Fin(Mot, 'n');
        Mot := ajout_Lettre_Fin(Mot, 'i');
        Mot := ajout_Lettre_Fin(Mot, 'h');
        
        assert(significatif(Mot) = False, "Le mot ne devrait pas être significatif");
    end test_Mot_Petit_Fail;

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
        
        assert(mots_Egaux(Mot, Mot2) = False, "Les 2 mots ne devraient pas être égaux");
    end test_Mot_Egaux_Fail;
    
    procedure test_Mot_Superieur is
        Mot1: TMot;
        Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'M');
        Mot1 := ajout_Lettre_Fin(Mot1, 'e');
        Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        Mot2 := creer_Mot;
	    Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');

	    assert(mot_Superieur(Mot1, Mot2) = True, "Le Mot2 ne devrait pas être superieur au Mot1");
    end test_Mot_Superieur;

    procedure test_Mot_Superieur_Fail is
        Mot1: TMot;
        Mot2: TMot;
    begin
        Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'M');
        Mot1 := ajout_Lettre_Fin(Mot1, 'e');
        Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        Mot2 := creer_Mot;
	    Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');

	    assert(mot_Superieur(Mot2, Mot1) = False, "Le Mot1 devrait être inferieur au Mot2");
    end test_Mot_Superieur_Fail;
    
-- Test sur le PCouple
    procedure test_Couple_Egaux is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	    Mot1 :=creer_Mot;
	    Mot1 := ajout_Lettre_Fin(Mot1, 'M');
        Mot1 := ajout_Lettre_Fin(Mot1, 'e');
        Mot1 := ajout_Lettre_Fin(Mot1, 'h');
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
	    Mot1 := ajout_Lettre_Fin(Mot1, 'M');
        Mot1 := ajout_Lettre_Fin(Mot1, 'e');
        Mot1 := ajout_Lettre_Fin(Mot1, 'h');
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
    	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
    	Couple1 := creer_Couple(Mot1, 3);

    	Mot2 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot2, 'M');
    	Mot2 := ajout_Lettre_Fin(Mot2, 'e');
    	Mot2 := ajout_Lettre_Fin(Mot2, 'h');
    	Couple2 := creer_Couple(Mot2, 2);

    	assert(couple_Superieur_Occurrence(Couple1, Couple2) = False, "Le couple1 ne devrait pas avoir plus d'occurrence que le couple2");
    end test_Couple_Superieur_Occurrence_Fail;

    procedure test_Couple_Inferieur_Mot is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'M');
        Mot1 := ajout_Lettre_Fin(Mot1, 'e');
        Mot1 := ajout_Lettre_Fin(Mot1, 'h');
        Couple1 := creer_Couple(Mot1, 3);

        Mot2 := creer_Mot;
	    Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
        Mot2 := ajout_Lettre_Fin(Mot2, 'h');
	    Couple2 := creer_Couple(Mot2, 2);

	    assert(couple_Inferieur_Mot(Couple2, Couple1) = True, "Le couple 2 devrait être inferieur au couple 1");
    end test_Couple_Inferieur_Mot;

    procedure test_Couple_Inferieur_Mot_Fail is
        Couple1: TCouple;
        Couple2: TCouple;
        Mot1: TMot;
        Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
        Mot1 := ajout_Lettre_Fin(Mot1, 'M');
        Mot1 := ajout_Lettre_Fin(Mot1, 'e');
        Mot1 := ajout_Lettre_Fin(Mot1, 'h');
        Couple1 := creer_Couple(Mot1, 3);

        Mot2 := creer_Mot;
	    Mot2 := ajout_Lettre_Fin(Mot2, 'N');
        Mot2 := ajout_Lettre_Fin(Mot2, 'i');
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
    	Mot := ajout_Lettre_Fin(Mot, 'L');

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
    	Mot1, Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
    	
    	Mot2 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot2, 'N');

    	Liste_Couple := creer_Liste_Couple;
    	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
    	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
        
        assert(nb_Superieur(Liste_Couple, 2) = 1, "Le nombre de mots supérieur n'est pas bon");
    end test_Liste_Couple_nb_Superieur;
    
    procedure test_Liste_Couple_Presence is
	    Liste_Couple: TListe_Couple;
    	Mot1: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

    	Liste_Couple := creer_Liste_Couple;
    	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
        
        assert(present(Liste_Couple, Mot1) = True, "Le Mot1 devrait être présent dans la liste");
    end test_Liste_Couple_Presence;
    
    procedure test_Liste_Couple_Presence_Fail is
	    Liste_Couple: TListe_Couple;
    	Mot1, Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
    	
    	Mot2 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot2, 'N');

    	Liste_Couple := creer_Liste_Couple;
    	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
        
        assert(present(Liste_Couple, Mot2) = False, "Le Mot2 ne devrait pas être présent dans la liste");
    end test_Liste_Couple_Presence_Fail;
    
    procedure test_Liste_Couple_Taille is
	Liste_Couple: TListe_Couple;
	Mot1, Mot2: TMot;
    begin
	Mot1 := creer_Mot;
	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
	
	Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'N');

	Liste_Couple := creer_Liste_Couple;
	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
	Liste_Couple := ajout_Mot(Liste_Couple, Mot2); -- ajout de 2 fois le même mot pour test

        assert(nb_Mots_Differents(Liste_Couple) = 2, "Le nombre de mots différents n'est pas bon");
    end test_Liste_Couple_Taille;
    
    procedure test_Liste_Couple_nb_Occurrence is
 	    Liste_Couple: TListe_Couple;
 	    Mot1, Mot2: TMot;
     begin
     	Mot1 := creer_Mot;
     	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
     	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
     	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

     	Mot2 := creer_Mot;
     	Mot2 := ajout_Lettre_Fin(Mot2, 'N');

     	Liste_Couple := creer_Liste_Couple;
     	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
     	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
     	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
     	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);

        assert(nb_Total_Occurrence(Liste_Couple) = 4, "Le nombre d'occurrence n'est pas bon");
     end test_Liste_Couple_nb_Occurrence;
     
     procedure test_Liste_Couple_nb_Mots is
  	    Liste_Couple: TListe_Couple;
  	    Mot1, Mot2: TMot;
      begin
      	Mot1 := creer_Mot;
      	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
      	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

      	Mot2 := creer_Mot;
      	Mot2 := ajout_Lettre_Fin(Mot2, 'N');

      	Liste_Couple := creer_Liste_Couple;
      	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
      	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
      	Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
      	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);

         assert(nb_Mots_Differents(Liste_Couple) = 2, "Le nombre total de mot est incorrect");
      end test_Liste_Couple_nb_Mots;
      
      procedure test_Liste_Couple_nb_Prefixe is
          Liste_Couple: TListe_Couple;
          Mot1, Mot2, Mot3: TMot;
      begin
          Mot1 := creer_Mot;
          Mot1 := ajout_Lettre_Fin(Mot1, 'N');
          Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          Mot1 := ajout_Lettre_Fin(Mot1, 'h');
        	
          Mot3 := creer_Mot;
          Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          Mot3 := ajout_Lettre_Fin(Mot3, 'N');
          Mot3 := ajout_Lettre_Fin(Mot3, 'h');

    	  Mot2 := creer_Mot;
          Mot2 := ajout_Lettre_Fin(Mot2, 'N');

    	  Liste_Couple := creer_Liste_Couple;
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
        	
          assert(nb_Prefixe(Liste_Couple, Mot2) = 2, "Le nombre de préfixes est incorrect");
      end test_Liste_Couple_nb_Prefixe;
        
      procedure test_Liste_Couple_nb_Suffixe is
          Liste_Couple: TListe_Couple;
      	  Mot1, Mot2, Mot3: TMot;
      begin
          	Mot1 := creer_Mot;
          	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
          	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          	Mot3 := creer_Mot;
          	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          	Mot3 := ajout_Lettre_Fin(Mot3, 'N');
          	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

          	Mot2 := creer_Mot;
          	Mot2 := ajout_Lettre_Fin(Mot2, 'i');
          	Mot2 := ajout_Lettre_Fin(Mot2, 'h');

          	Liste_Couple := creer_Liste_Couple;
          	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
          	Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
          	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
          	Liste_Couple := ajout_Mot(Liste_Couple, Mot3);

            assert(nb_Suffixe(Liste_Couple, Mot2) = 2, "Le nombre de suffixes est incorrect");
          end test_Liste_Couple_nb_Suffixe;
          
          procedure test_Liste_Couple_nb_Facteur is
              Liste_Couple: TListe_Couple;
              Mot1, Mot2, Mot3: TMot;
          begin
            Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        	Mot3 := creer_Mot;
        	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
        	Mot3 := ajout_Lettre_Fin(Mot3, 'N');
        	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

        	Mot2 := creer_Mot;
        	Mot2 := ajout_Lettre_Fin(Mot2, 'i');

        	Liste_Couple := creer_Liste_Couple;
        	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
        	Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
        	Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
        	Liste_Couple := ajout_Mot(Liste_Couple, Mot3);

            assert(nb_Facteur(Liste_Couple, Mot2) = 4, "Le nombre de facteurs est incorrect");
      end test_Liste_Couple_nb_Facteur;

      procedure test_Liste_Couple_Moy_Occur is
  	      Liste_Couple: TListe_Couple;
      	  Mot1, Mot2, Mot3: TMot;
      begin
  	      Mot1 := creer_Mot;
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'N');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
      	  
      	  Mot2 := creer_Mot;
      	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');

      	  Liste_Couple := creer_Liste_Couple;
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);

          assert(moy_Occurrence(Liste_Couple) = 2.00, "La moyenne d'occurrence n'est pas bonne");
      end test_Liste_Couple_Moy_Occur;
      
      procedure test_Liste_Couple_Moy_Long is
  	      Liste_Couple: TListe_Couple;
      	  Mot1, Mot2, Mot3: TMot;
      begin
  	      Mot1 := creer_Mot;
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'N');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
      	  
      	  Mot2 := creer_Mot;
      	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');

      	  Liste_Couple := creer_Liste_Couple;
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
      	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
          
          assert(moy_Longueur(Liste_Couple) = 3.00, "La moyenne n'est pas bonne");
      end test_Liste_Couple_Moy_Long;

       procedure test_Liste_Couple_nb_Occur_Mot is
    	      Liste_Couple: TListe_Couple;
        	  Mot1, Mot2, Mot3: TMot;
        begin
    	      Mot1 := creer_Mot;
        	  Mot1 := ajout_Lettre_Fin(Mot1, 'N');
        	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

        	  Mot2 := creer_Mot;
        	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');

        	  Liste_Couple := creer_Liste_Couple;
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
        	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);

              assert(nb_Occurrences(Liste_Couple, Mot2) = 3, "Le nombre d'occurence n'est pas bon");
        end test_Liste_Couple_nb_Occur_Mot;
    
    
    procedure test_Liste_Fusion_Couple is
        Liste_Couple: TListe_Couple;
    	Mot1, Mot2, Mot3: TMot;
    	lol, lol2: integer;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'N');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
       	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
    	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
    	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
    	  Mot3 := ajout_Lettre_Fin(Mot3, 's');

    	  Mot2 := creer_Mot;
    	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');

    	  Liste_Couple := creer_Liste_Couple;
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
    	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
          
          lol := nb_Occurrences(Liste_Couple, Mot1);
          lol2 := nb_Occurrences(Liste_Couple, Mot2);
          
          Liste_Couple := fusion_Mots(Liste_Couple, Mot1, Mot2);
          --affichage_decroissant(Liste_Couple, 100);
          assert(nb_Occurrences(Liste_Couple, Mot1) = lol+lol2 and (present(Liste_Couple, Mot2) = False), "La Fusion ne marche pas");
    end test_Liste_Fusion_Couple;
    
    procedure test_Liste_Trio_Fusion_Listes is 
        Liste_Couple, Liste_Couple2: TListe_Couple;
	Liste_Couple3 : TListe_Trio;
      	Mot1, Mot2, Mot3, Mot4: TMot;
    begin
  	    Mot1 := creer_Mot;
  	    Mot1 := ajout_Lettre_Fin(Mot1, 'N');
  	    Mot1 := ajout_Lettre_Fin(Mot1, 'i');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

      Mot3 := creer_Mot;
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
  
  	  Mot2 := creer_Mot;
  	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');
  	  
  	  Mot4 := creer_Mot;
      Mot4 := ajout_Lettre_Fin(Mot4, 'M');
      Mot4 := ajout_Lettre_Fin(Mot4, 'e');
      Mot4 := ajout_Lettre_Fin(Mot4, 'h');

  	  Liste_Couple := creer_Liste_Couple;
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);
  	  
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot3);
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot2);
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot4);
  	  
  	  Liste_Couple3 := fusion_Listes(Liste_Couple, Liste_Couple2);
  	  assert(nb_Mots_Differents_Trio(Liste_Couple3) = 4, "La Fusion de listes ne marche pas");
    end test_Liste_Trio_Fusion_Listes;
    
    procedure test_Liste_Trio_Mots_Communs is
        Liste_Couple, Liste_Couple2: TListe_Couple;
	Liste_Couple3 : TListe_Trio;
      	Mot1, Mot2, Mot3, Mot4: TMot;
    begin
  	    Mot1 := creer_Mot;
  	    Mot1 := ajout_Lettre_Fin(Mot1, 'N');
  	    Mot1 := ajout_Lettre_Fin(Mot1, 'i');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

      Mot3 := creer_Mot;
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

  	  Mot2 := creer_Mot;
  	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');

  	  Mot4 := creer_Mot;
      Mot4 := ajout_Lettre_Fin(Mot4, 'M');
      Mot4 := ajout_Lettre_Fin(Mot4, 'e');
      Mot4 := ajout_Lettre_Fin(Mot4, 'h');

  	  Liste_Couple := creer_Liste_Couple;
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);

  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot3);
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot2);
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot4);

  	  Liste_Couple3 := mots_Communs(Liste_Couple, Liste_Couple2);

  	  assert(nb_Mots_Differents_Trio(Liste_Couple3) = 2, "L'intersection ne marche pas");
    end test_Liste_Trio_Mots_Communs;
    
    procedure test_Liste_Trio_Mots_Differents is
        Liste_Couple, Liste_Couple2: TListe_Couple;
	Liste_Couple3 : TListe_Trio;
      	Mot1, Mot2, Mot3, Mot4: TMot;
    begin
  	    Mot1 := creer_Mot;
  	    Mot1 := ajout_Lettre_Fin(Mot1, 'N');
  	    Mot1 := ajout_Lettre_Fin(Mot1, 'i');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
  	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

      Mot3 := creer_Mot;
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'N');
  	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

  	  Mot2 := creer_Mot;
  	  Mot2 := ajout_Lettre_Fin(Mot2, 'N');

  	  Mot4 := creer_Mot;
      Mot4 := ajout_Lettre_Fin(Mot4, 'M');
      Mot4 := ajout_Lettre_Fin(Mot4, 'e');
      Mot4 := ajout_Lettre_Fin(Mot4, 'h');

  	  Liste_Couple := creer_Liste_Couple;
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot1);
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot3);
  	  Liste_Couple := ajout_Mot(Liste_Couple, Mot2);

  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot3);
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot2);
  	  Liste_Couple2 := ajout_Mot(Liste_Couple2, Mot4);

  	  Liste_Couple3 := mots_Differents(Liste_Couple, Liste_Couple2);

  	  assert(nb_Mots_Differents_Trio(Liste_Couple3) = 2, "La différence ne marche pas");
    end test_Liste_Trio_Mots_Differents;
    
-- Sur les Tries Couples

    procedure test_Tree_nb_Superieur is
	    Tree: TTree_Noeud;
    	Mot1, Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
    	
    	Mot2 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

    	Tree := creer_Tree_Noeud;
    	Tree := ajout_Mot_Tree(Tree, Mot1);
    	Tree := ajout_Mot_Tree(Tree, Mot2);
        
        assert(nb_Superieur_Tree(Tree, 2) = 1, "Le nombre de mots supérieur n'est pas bon");
    end test_Tree_nb_Superieur;
    
    procedure test_Tree_Presence is
	    Tree: TTree_Noeud;
    	Mot1: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

    	Tree := creer_Tree_Noeud;
    	Tree := ajout_Mot_Tree(Tree, Mot1);
        
        assert(present_Tree(Tree, Mot1) = True, "Le Mot1 devrait être présent dans la liste");
    end test_Tree_Presence;
    
    procedure test_Tree_Presence_Fail is
	    Tree: TTree_Noeud;
    	Mot1, Mot2: TMot;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
    	
    	Mot2 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

    	Tree := creer_Tree_Noeud;
    	Tree := ajout_Mot_Tree(Tree, Mot1);
        
        assert(present_Tree(Tree, Mot2) = False, "Le Mot2 ne devrait pas être présent dans la liste");
    end test_Tree_Presence_Fail;
    
    procedure test_Tree_Taille is
	Tree: TTree_Noeud;
	Mot1, Mot2: TMot;
    begin
	Mot1 := creer_Mot;
	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
	Mot1 := ajout_Lettre_Fin(Mot1, 'h');
	
	Mot2 := creer_Mot;
	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

	Tree := creer_Tree_Noeud;
	Tree := ajout_Mot_Tree(Tree, Mot1);
	Tree := ajout_Mot_Tree(Tree, Mot2);
	Tree := ajout_Mot_Tree(Tree, Mot2); -- ajout de 2 fois le même mot pour test

        assert(nb_Mots_Tree(Tree) = 2, "Le nombre de mots différents n'est pas bon");
    end test_Tree_Taille;
    
    procedure test_Tree_nb_Occurrence is
 	    Tree: TTree_Noeud;
 	    Mot1, Mot2: TMot;
     begin
     	Mot1 := creer_Mot;
     	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
     	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
     	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

     	Mot2 := creer_Mot;
     	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

     	Tree := creer_Tree_Noeud;
     	Tree := ajout_Mot_Tree(Tree, Mot1);
     	Tree := ajout_Mot_Tree(Tree, Mot2);
     	Tree := ajout_Mot_Tree(Tree, Mot2);
     	Tree := ajout_Mot_Tree(Tree, Mot2);
            
        assert(nb_Occurrences_Total(Tree) = 4, "Le nombre d'occurrence n'est pas bon");
     end test_Tree_nb_Occurrence;
      
      procedure test_Tree_nb_Prefixe is
          Tree: TTree_Noeud;
          Mot1, Mot2, Mot3: TMot;
      begin
          Mot1 := creer_Mot;
          Mot1 := ajout_Lettre_Fin(Mot1, 'n');
          Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          Mot1 := ajout_Lettre_Fin(Mot1, 'h');
        	
          Mot3 := creer_Mot;
          Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          Mot3 := ajout_Lettre_Fin(Mot3, 'n');
          Mot3 := ajout_Lettre_Fin(Mot3, 'h');

    	  Mot2 := creer_Mot;
          Mot2 := ajout_Lettre_Fin(Mot2, 'n');

    	  Tree := creer_Tree_Noeud;
    	  Tree := ajout_Mot_Tree(Tree, Mot1);
    	  Tree := ajout_Mot_Tree(Tree, Mot3);
    	  Tree := ajout_Mot_Tree(Tree, Mot1);
    	  Tree := ajout_Mot_Tree(Tree, Mot3);
        	
          assert(nb_Prefixe_Tree(Tree, Mot2) = 2, "Le nombre de préfixes est incorrect");
      end test_Tree_nb_Prefixe;
        
      procedure test_Tree_nb_Suffixe is
          Tree: TTree_Noeud;
      	  Mot1, Mot2, Mot3: TMot;
      begin
          	Mot1 := creer_Mot;
          	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
          	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          	Mot3 := creer_Mot;
          	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          	Mot3 := ajout_Lettre_Fin(Mot3, 'n');
          	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

          	Mot2 := creer_Mot;
          	Mot2 := ajout_Lettre_Fin(Mot2, 'i');
          	Mot2 := ajout_Lettre_Fin(Mot2, 'h');

          	Tree := creer_Tree_Noeud;
          	Tree := ajout_Mot_Tree(Tree, Mot1);
          	Tree := ajout_Mot_Tree(Tree, Mot3);
          	Tree := ajout_Mot_Tree(Tree, Mot1);
          	Tree := ajout_Mot_Tree(Tree, Mot3);

            assert(nb_Suffixe_Tree(Tree, Mot2) = 2, "Le nombre de suffixes est incorrect");
          end test_Tree_nb_Suffixe;
          
          procedure test_Tree_nb_Facteur is
              Tree: TTree_Noeud;
              Mot1, Mot2, Mot3: TMot;
          begin
            Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        	Mot3 := creer_Mot;
        	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
        	Mot3 := ajout_Lettre_Fin(Mot3, 'n');
        	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

        	Mot2 := creer_Mot;
        	Mot2 := ajout_Lettre_Fin(Mot2, 'i');

        	Tree := creer_Tree_Noeud;
        	Tree := ajout_Mot_Tree(Tree, Mot1);
        	Tree := ajout_Mot_Tree(Tree, Mot3);
        	Tree := ajout_Mot_Tree(Tree, Mot1);
        	Tree := ajout_Mot_Tree(Tree, Mot3);
            
            assert(nb_Facteur_Tree(Tree, Mot2) = 4, "Le nombre de facteurs est incorrect");
      end test_Tree_nb_Facteur;

      procedure test_Tree_Moy_Occur is
  	      Tree: TTree_Noeud;
      	  Mot1, Mot2, Mot3: TMot;
      begin
  	      Mot1 := creer_Mot;
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
      	  
      	  Mot2 := creer_Mot;
      	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

      	  Tree := creer_Tree_Noeud;
      	  Tree := ajout_Mot_Tree(Tree, Mot1);
      	  Tree := ajout_Mot_Tree(Tree, Mot3);
      	  Tree := ajout_Mot_Tree(Tree, Mot1);
      	  Tree := ajout_Mot_Tree(Tree, Mot3);
      	  Tree := ajout_Mot_Tree(Tree, Mot2);
      	  Tree := ajout_Mot_Tree(Tree, Mot2);

          assert(moy_Occurrence_Tree(Tree) = 2.00, "La moyenne d'occurrence n'est pas bonne");
      end test_Tree_Moy_Occur;
      
      procedure test_Tree_Moy_Long is
  	      Tree: TTree_Noeud;
      	  Mot1, Mot2, Mot3: TMot;
      begin
  	      Mot1 := creer_Mot;
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
      	  
      	  Mot2 := creer_Mot;
      	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

      	  Tree := creer_Tree_Noeud;
      	  Tree := ajout_Mot_Tree(Tree, Mot1);
      	  Tree := ajout_Mot_Tree(Tree, Mot3);
      	  Tree := ajout_Mot_Tree(Tree, Mot1);
      	  Tree := ajout_Mot_Tree(Tree, Mot2);
      	  Tree := ajout_Mot_Tree(Tree, Mot3);
      	  Tree := ajout_Mot_Tree(Tree, Mot2);
      	  Tree := ajout_Mot_Tree(Tree, Mot2);
          
          assert(moy_Longueur_Tree(Tree) = 3.00, "La moyenne n'est pas bonne");
      end test_Tree_Moy_Long;

       procedure test_Tree_nb_Occur_Mot is
    	      Tree: TTree_Noeud;
        	  Mot1, Mot2, Mot3: TMot;
        begin
    	      Mot1 := creer_Mot;
        	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

        	  Mot2 := creer_Mot;
        	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

        	  Tree := creer_Tree_Noeud;
        	  Tree := ajout_Mot_Tree(Tree, Mot1);
        	  Tree := ajout_Mot_Tree(Tree, Mot3);
        	  Tree := ajout_Mot_Tree(Tree, Mot1);
        	  Tree := ajout_Mot_Tree(Tree, Mot2);
        	  Tree := ajout_Mot_Tree(Tree, Mot3);
        	  Tree := ajout_Mot_Tree(Tree, Mot2);
        	  Tree := ajout_Mot_Tree(Tree, Mot2);
              
              assert(nb_Occurrence_Mot_Tree(Tree, Mot2) = 3, "Le nombre d'occurence n'est pas bon");
        end test_Tree_nb_Occur_Mot;
    
    procedure test_Tree_Fusion is
        Tree: TTree_Noeud;
    	Mot1, Mot2, Mot3: TMot;
    	lol, lol2: integer;
    begin
	    Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
       	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
    	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
    	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
    	  Mot3 := ajout_Lettre_Fin(Mot3, 's');

    	  Mot2 := creer_Mot;
    	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

    	  Tree := creer_Tree_Noeud;
    	  Tree := ajout_Mot_Tree(Tree, Mot1);
    	  Tree := ajout_Mot_Tree(Tree, Mot3);
    	  Tree := ajout_Mot_Tree(Tree, Mot1);
    	  Tree := ajout_Mot_Tree(Tree, Mot2);
    	  Tree := ajout_Mot_Tree(Tree, Mot3);
    	  Tree := ajout_Mot_Tree(Tree, Mot2);
    	  Tree := ajout_Mot_Tree(Tree, Mot2);
          
          lol := nb_Occurrence_Mot_Tree(Tree, Mot1);
          lol2 := nb_Occurrence_Mot_Tree(Tree, Mot2);
          
          Tree := fusion_Mot_Tree(Tree, Mot1, Mot2);
          assert(nb_Occurrence_Mot_Tree(Tree, Mot1) = lol+lol2 and (present_Tree(Tree, Mot2) = False), "La Fusion ne marche pas");
    end test_Tree_Fusion;
    
    
    -- Sur les Tries Gros

        procedure test_Tree_Gros_nb_Superieur is
    	    Tree: TTree_Gros_Noeud;
        	Mot1, Mot2: TMot;
        begin
    	    Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        	Mot2 := creer_Mot;
        	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

        	Tree := creer_Tree_Gros_Noeud;
        	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
        	Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);

            assert(nb_Superieur_Tree_Gros(Tree, 2) = 1, "Le nombre de mots supérieur n'est pas bon");
        end test_Tree_Gros_nb_Superieur;

        procedure test_Tree_Gros_Presence is
    	    Tree: TTree_Gros_Noeud;
        	Mot1: TMot;
        begin
    	    Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        	Tree := creer_Tree_Gros_Noeud;
        	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);

            assert(present_Tree_Gros(Tree, Mot1) = True, "Le Mot1 devrait être présent dans la liste");
        end test_Tree_Gros_Presence;

        procedure test_Tree_Gros_Presence_Fail is
    	    Tree: TTree_Gros_Noeud;
        	Mot1, Mot2: TMot;
        begin
    	    Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        	Mot2 := creer_Mot;
        	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

        	Tree := creer_Tree_Gros_Noeud;
        	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);

            assert(present_Tree_Gros(Tree, Mot2) = False, "Le Mot2 ne devrait pas être présent dans la liste");
        end test_Tree_Gros_Presence_Fail;

        procedure test_Tree_Gros_Taille is
    	Tree: TTree_Gros_Noeud;
    	Mot1, Mot2: TMot;
        begin
    	Mot1 := creer_Mot;
    	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
    	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

    	Mot2 := creer_Mot;
    	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

    	Tree := creer_Tree_Gros_Noeud;
    	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
    	Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
    	Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 0, 1); -- ajout de 2 fois le même mot pour test

            assert(nb_Mots_Tree_Gros(Tree) = 2, "Le nombre de mots différents n'est pas bon");
        end test_Tree_Gros_Taille;

        procedure test_Tree_Gros_nb_Occurrence is
     	    Tree: TTree_Gros_Noeud;
     	    Mot1, Mot2: TMot;
         begin
         	Mot1 := creer_Mot;
         	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
         	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
         	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

         	Mot2 := creer_Mot;
         	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

         	Tree := creer_Tree_Gros_Noeud;
         	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);
         	Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
         	Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 0, 1);
         	Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 0, 1);
            
            assert(nb_Occurrences_Total_Gros(Tree) = 4, "Le nombre d'occurrence n'est pas bon");
         end test_Tree_Gros_nb_Occurrence;

          procedure test_Tree_Gros_nb_Prefixe is
              Tree: TTree_Gros_Noeud;
              Mot1, Mot2, Mot3: TMot;
          begin
              Mot1 := creer_Mot;
              Mot1 := ajout_Lettre_Fin(Mot1, 'n');
              Mot1 := ajout_Lettre_Fin(Mot1, 'i');
              Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
              Mot3 := ajout_Lettre_Fin(Mot3, 'i');
              Mot3 := ajout_Lettre_Fin(Mot3, 'n');
              Mot3 := ajout_Lettre_Fin(Mot3, 'h');

        	  Mot2 := creer_Mot;
              Mot2 := ajout_Lettre_Fin(Mot2, 'n');

        	  Tree := creer_Tree_Gros_Noeud;
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 1, 0);

              assert(nb_Prefixe_Tree_Gros(Tree, Mot2) = 2, "Le nombre de préfixes est incorrect");
          end test_Tree_Gros_nb_Prefixe;

          procedure test_Tree_Gros_nb_Suffixe is
              Tree: TTree_Gros_Noeud;
          	  Mot1, Mot2, Mot3: TMot;
          begin
              	Mot1 := creer_Mot;
              	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
              	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
              	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              	Mot3 := creer_Mot;
              	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
              	Mot3 := ajout_Lettre_Fin(Mot3, 'n');
              	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

              	Mot2 := creer_Mot;
              	Mot2 := ajout_Lettre_Fin(Mot2, 'i');
              	Mot2 := ajout_Lettre_Fin(Mot2, 'h');

              	Tree := creer_Tree_Gros_Noeud;
              	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
              	Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 1, 0);
              	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
              	Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);

                assert(nb_Suffixe_Tree_Gros(Tree, Mot2) = 2, "Le nombre de suffixes est incorrect");
              end test_Tree_Gros_nb_Suffixe;

              procedure test_Tree_Gros_nb_Facteur is
                  Tree: TTree_Gros_Noeud;
                  Mot1, Mot2, Mot3: TMot;
              begin
                Mot1 := creer_Mot;
            	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

            	Mot3 := creer_Mot;
            	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
            	Mot3 := ajout_Lettre_Fin(Mot3, 'n');
            	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

            	Mot2 := creer_Mot;
            	Mot2 := ajout_Lettre_Fin(Mot2, 'i');

            	Tree := creer_Tree_Gros_Noeud;
            	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
            	Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 1, 0);
            	Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
            	Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);

                assert(nb_Facteur_Tree_Gros(Tree, Mot2) = 4, "Le nombre de facteurs est incorrect");
          end test_Tree_Gros_nb_Facteur;

          procedure test_Tree_Gros_Moy_Occur is
      	      Tree: TTree_Gros_Noeud;
          	  Mot1, Mot2, Mot3: TMot;
          begin
      	      Mot1 := creer_Mot;
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

          	  Mot2 := creer_Mot;
          	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

          	  Tree := creer_Tree_Gros_Noeud;
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 1, 0);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);

              assert(moy_Occurrence_Tree_Gros(Tree) = 2.00, "La moyenne d'occurrence n'est pas bonne");
          end test_Tree_Gros_Moy_Occur;

          procedure test_Tree_Gros_Moy_Long is
      	      Tree: TTree_Gros_Noeud;
          	  Mot1, Mot2, Mot3: TMot;
          begin
      	      Mot1 := creer_Mot;
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

          	  Mot2 := creer_Mot;
          	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

          	  Tree := creer_Tree_Gros_Noeud;
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 1, 1);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 0, 1);
          	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);

              assert(moy_Longueur_Tree_Gros(Tree) = 3.00, "La moyenne n'est pas bonne");
          end test_Tree_Gros_Moy_Long;

           procedure test_Tree_Gros_nb_Occur_Mot is
        	      Tree: TTree_Gros_Noeud;
            	  Mot1, Mot2, Mot3: TMot;
            begin
        	      Mot1 := creer_Mot;
            	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
            	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
            	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                  Mot3 := creer_Mot;
            	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
            	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
            	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

            	  Mot2 := creer_Mot;
            	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

            	  Tree := creer_Tree_Gros_Noeud;
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 0, 1);
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 1, 0);
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
            	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 0, 1);
                  
                  assert(nb_Occurrence_Mot_Tree_Gros(Tree, Mot2) = 3, "Le nombre d'occurence n'est pas bon");
            end test_Tree_Gros_nb_Occur_Mot;

        procedure test_Tree_Gros_Fusion is
            Tree: TTree_Gros_Noeud;
        	Mot1, Mot2, Mot3: TMot;
        	lol, lol2: integer;
        begin
    	    Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
           	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
        	  Mot3 := ajout_Lettre_Fin(Mot3, 's');

        	  Mot2 := creer_Mot;
        	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

        	  Tree := creer_Tree_Gros_Noeud;
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 1, 0);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot1, 0, 1);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot3, 0, 1);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);
        	  Tree := ajout_Mot_Tree_Gros(Tree, Mot2, 1, 0);

              lol := nb_Occurrence_Mot_Tree_Gros(Tree, Mot1);
              lol2 := nb_Occurrence_Mot_Tree_Gros(Tree, Mot2);

              Tree := fusion_Mot_Tree_Gros(Tree, Mot1, Mot2);
              assert(nb_Occurrence_Mot_Tree_Gros(Tree, Mot1) = lol+lol2 and (present_Tree_Gros(Tree, Mot2) = False), "La Fusion ne marche pas");
        end test_Tree_Gros_Fusion;
        
        procedure test_Tree_Gros_Fusion_Tree is 
             Tree_Noeud, Tree_Noeud2: TTree_Noeud;
        	Tree_Noeud3 : TTree_Gros_Noeud;
              	Mot1, Mot2, Mot3, Mot4: TMot;
            begin
          	    Mot1 := creer_Mot;
          	    Mot1 := ajout_Lettre_Fin(Mot1, 'n');
          	    Mot1 := ajout_Lettre_Fin(Mot1, 'i');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
          	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

              Mot3 := creer_Mot;
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
          	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

          	  Mot2 := creer_Mot;
          	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

          	  Mot4 := creer_Mot;
              Mot4 := ajout_Lettre_Fin(Mot4, 'm');
              Mot4 := ajout_Lettre_Fin(Mot4, 'e');
              Mot4 := ajout_Lettre_Fin(Mot4, 'h');

          	  Tree_Noeud := creer_Tree_Noeud;
          	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot1);
          	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot3);
          	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot2);

              Tree_Noeud2 := creer_Tree_Noeud;
          	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot3);
          	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot2);
          	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot4);

          	  Tree_Noeud3 := fusion_Tree(Tree_Noeud, Tree_Noeud2);
          	  
      	  assert(nb_Mots_Tree_Gros(Tree_Noeud3) = 4, "La Fusion de listes ne marche pas");
        end test_Tree_Gros_Fusion_Tree;

        procedure test_Tree_Gros_Mots_Communs is
            Tree_Noeud, Tree_Noeud2: TTree_Noeud;
    	Tree_Noeud3 : TTree_Gros_Noeud;
          	Mot1, Mot2, Mot3, Mot4: TMot;
        begin
      	    Mot1 := creer_Mot;
      	    Mot1 := ajout_Lettre_Fin(Mot1, 'n');
      	    Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

      	  Mot2 := creer_Mot;
      	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

      	  Mot4 := creer_Mot;
          Mot4 := ajout_Lettre_Fin(Mot4, 'm');
          Mot4 := ajout_Lettre_Fin(Mot4, 'e');
          Mot4 := ajout_Lettre_Fin(Mot4, 'h');
          
      	  Tree_Noeud := creer_Tree_Noeud;
      	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot1);
      	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot3);
      	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot2);
          
          Tree_Noeud2 := creer_Tree_Noeud;
      	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot3);
      	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot2);
      	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot4);
          
      	  Tree_Noeud3 := mots_Communs_Tree(Tree_Noeud, Tree_Noeud2);
      	  
      	  assert(nb_Mots_Tree_Gros(Tree_Noeud3) = 2, "L'intersection ne marche pas");
        end test_Tree_Gros_Mots_Communs;

        procedure test_Tree_Gros_Mots_Differents is
            Tree_Noeud, Tree_Noeud2: TTree_Noeud;
    	Tree_Noeud3 : TTree_Gros_Noeud;
          	Mot1, Mot2, Mot3, Mot4: TMot;
        begin
      	    Mot1 := creer_Mot;
      	    Mot1 := ajout_Lettre_Fin(Mot1, 'n');
      	    Mot1 := ajout_Lettre_Fin(Mot1, 'i');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
      	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

          Mot3 := creer_Mot;
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
      	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

      	  Mot2 := creer_Mot;
      	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

      	  Mot4 := creer_Mot;
          Mot4 := ajout_Lettre_Fin(Mot4, 'm');
          Mot4 := ajout_Lettre_Fin(Mot4, 'e');
          Mot4 := ajout_Lettre_Fin(Mot4, 'h');
          
      	  Tree_Noeud := creer_Tree_Noeud;
      	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot1);
      	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot3);
      	  Tree_Noeud := ajout_Mot_Tree(Tree_Noeud, Mot2);
          
          Tree_Noeud2 := creer_Tree_Noeud;
      	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot3);
      	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot2);
      	  Tree_Noeud2 := ajout_Mot_Tree(Tree_Noeud2, Mot4);
          
      	  Tree_Noeud3 := mots_Differents_Tree(Tree_Noeud, Tree_Noeud2);
      	  
      	  assert(nb_Mots_Tree_Gros(Tree_Noeud3) = 2, "L'intersection ne marche pas");
        end test_Tree_Gros_Mots_Differents;
        
        
        -- Sur les ARN

            procedure test_ARN_nb_Superieur is
        	    Tree: TARN;
            	Mot1, Mot2: TMot;
            begin
        	    Mot1 := creer_Mot;
            	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

            	Mot2 := creer_Mot;
            	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

            	Tree := creer_ARN;
            	Tree := ajout_Mot_ARN(Tree, Mot1);
            	Tree := ajout_Mot_ARN(Tree, Mot2);

                assert(nb_Superieur_ARN(Tree, 2) = 1, "Le nombre de mots supérieur n'est pas bon");
            end test_ARN_nb_Superieur;

            procedure test_ARN_Presence is
        	    Tree: TARN;
            	Mot1: TMot;
            begin
        	    Mot1 := creer_Mot;
            	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

            	Tree := creer_ARN;
            	Tree := ajout_Mot_ARN(Tree, Mot1);

                assert(present_ARN(Tree, Mot1) = True, "Le Mot1 devrait être présent dans la liste");
            end test_ARN_Presence;

            procedure test_ARN_Presence_Fail is
        	    Tree: TARN;
            	Mot1, Mot2: TMot;
            begin
        	    Mot1 := creer_Mot;
            	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

            	Mot2 := creer_Mot;
            	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

            	Tree := creer_ARN;
            	Tree := ajout_Mot_ARN(Tree, Mot1);

                assert(present_ARN(Tree, Mot2) = False, "Le Mot2 ne devrait pas être présent dans la liste");
            end test_ARN_Presence_Fail;

            procedure test_ARN_Taille is
        	Tree: TARN;
        	Mot1, Mot2: TMot;
            begin
        	Mot1 := creer_Mot;
        	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
        	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

        	Mot2 := creer_Mot;
        	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

        	Tree := creer_ARN;              
        	Tree := ajout_Mot_ARN(Tree, Mot1);
        	Tree := ajout_Mot_ARN(Tree, Mot2);
        	Tree := ajout_Mot_ARN(Tree, Mot2); -- ajout de 2 fois le même mot pour test

                assert(nb_Noeuds(Tree) = 2, "Le nombre de mots différents n'est pas bon");
            end test_ARN_Taille;

            procedure test_ARN_nb_Occurrence is
         	    Tree: TARN;
         	    Mot1, Mot2: TMot;
             begin
             	Mot1 := creer_Mot;
             	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
             	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
             	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

             	Mot2 := creer_Mot;
             	Mot2 := ajout_Lettre_Fin(Mot2, 'n');

             	Tree := creer_ARN;              
             	Tree := ajout_Mot_ARN(Tree, Mot1);
             	Tree := ajout_Mot_ARN(Tree, Mot2);
             	Tree := ajout_Mot_ARN(Tree, Mot2);
             	Tree := ajout_Mot_ARN(Tree, Mot2);
                                                
                assert(nb_Total_Occurrence_ARN(Tree) = 4, "Le nombre d'occurrence n'est pas bon");
             end test_ARN_nb_Occurrence;

              procedure test_ARN_nb_Prefixe is
                  Tree: TARN;
                  Mot1, Mot2, Mot3: TMot;
              begin
                  Mot1 := creer_Mot;
                  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
                  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
                  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                  Mot3 := creer_Mot;
                  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
                  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
                  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

            	  Mot2 := creer_Mot;
                  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

            	  Tree := creer_ARN;              
            	  Tree := ajout_Mot_ARN(Tree, Mot1);
            	  Tree := ajout_Mot_ARN(Tree, Mot3);
            	  Tree := ajout_Mot_ARN(Tree, Mot1);
            	  Tree := ajout_Mot_ARN(Tree, Mot3);
                                                  
                  assert(nb_Prefixe_ARN(Tree, Mot2) = 2, "Le nombre de préfixes est incorrect");
              end test_ARN_nb_Prefixe;

              procedure test_ARN_nb_Suffixe is
                  Tree: TARN;
              	  Mot1, Mot2, Mot3: TMot;
              begin
                  	Mot1 := creer_Mot;
                  	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
                  	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
                  	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                  	Mot3 := creer_Mot;
                  	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
                  	Mot3 := ajout_Lettre_Fin(Mot3, 'n');
                  	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

                  	Mot2 := creer_Mot;
                  	Mot2 := ajout_Lettre_Fin(Mot2, 'i');
                  	Mot2 := ajout_Lettre_Fin(Mot2, 'h');

                  	Tree := creer_ARN;              
                  	Tree := ajout_Mot_ARN(Tree, Mot1);
                  	Tree := ajout_Mot_ARN(Tree, Mot3);
                  	Tree := ajout_Mot_ARN(Tree, Mot1);
                  	Tree := ajout_Mot_ARN(Tree, Mot3);
                                                    
                    assert(nb_Suffixe_ARN(Tree, Mot2) = 2, "Le nombre de suffixes est incorrect");
                  end test_ARN_nb_Suffixe;

                  procedure test_ARN_nb_Facteur is
                      Tree: TARN;
                      Mot1, Mot2, Mot3: TMot;
                  begin
                    Mot1 := creer_Mot;
                	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
                	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
                	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                	Mot3 := creer_Mot;
                	Mot3 := ajout_Lettre_Fin(Mot3, 'i');
                	Mot3 := ajout_Lettre_Fin(Mot3, 'n');
                	Mot3 := ajout_Lettre_Fin(Mot3, 'h');

                	Mot2 := creer_Mot;
                	Mot2 := ajout_Lettre_Fin(Mot2, 'i');

                	Tree := creer_ARN;
                	Tree := ajout_Mot_ARN(Tree, Mot1);
                	Tree := ajout_Mot_ARN(Tree, Mot3);
                	Tree := ajout_Mot_ARN(Tree, Mot1);
                	Tree := ajout_Mot_ARN(Tree, Mot3);

                    assert(nb_Facteur_ARN(Tree, Mot2) = 4, "Le nombre de facteurs est incorrect");
              end test_ARN_nb_Facteur;

              procedure test_ARN_Moy_Occur is
          	      Tree: TARN;
              	  Mot1, Mot2, Mot3: TMot;
              begin
          	      Mot1 := creer_Mot;
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                  Mot3 := creer_Mot;
              	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
              	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
              	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

              	  Mot2 := creer_Mot;
              	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

              	  Tree := creer_ARN;              
              	  Tree := ajout_Mot_ARN(Tree, Mot1);
              	  Tree := ajout_Mot_ARN(Tree, Mot3);
              	  Tree := ajout_Mot_ARN(Tree, Mot1);
              	  Tree := ajout_Mot_ARN(Tree, Mot3);
              	  Tree := ajout_Mot_ARN(Tree, Mot2);
              	  Tree := ajout_Mot_ARN(Tree, Mot2);

                  assert(moy_Occurrence_ARN(Tree) = 2.00, "La moyenne d'occurrence n'est pas bonne");
              end test_ARN_Moy_Occur;

              procedure test_ARN_Moy_Long is
          	      Tree: TARN;
              	  Mot1, Mot2, Mot3: TMot;
              begin
          	      Mot1 := creer_Mot;
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');
              	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                  Mot3 := creer_Mot;
              	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
              	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
              	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

              	  Mot2 := creer_Mot;
              	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

              	  Tree := creer_ARN;
              	  Tree := ajout_Mot_ARN(Tree, Mot1);
              	  Tree := ajout_Mot_ARN(Tree, Mot3);
              	  Tree := ajout_Mot_ARN(Tree, Mot1);
              	  Tree := ajout_Mot_ARN(Tree, Mot2);
              	  Tree := ajout_Mot_ARN(Tree, Mot3);
              	  Tree := ajout_Mot_ARN(Tree, Mot2);
              	  Tree := ajout_Mot_ARN(Tree, Mot2);

                  assert(moy_Longueur_ARN(Tree) = 3.00, "La moyenne n'est pas bonne");
              end test_ARN_Moy_Long;

               procedure test_ARN_nb_Occur_Mot is
            	      Tree: TARN;
                	  Mot1, Mot2, Mot3: TMot;
                begin
            	      Mot1 := creer_Mot;
                	  Mot1 := ajout_Lettre_Fin(Mot1, 'n');
                	  Mot1 := ajout_Lettre_Fin(Mot1, 'i');
                	  Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                      Mot3 := creer_Mot;
                	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
                	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
                	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');

                	  Mot2 := creer_Mot;
                	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

                	  Tree := creer_ARN;
                	  Tree := ajout_Mot_ARN(Tree, Mot1);
                	  Tree := ajout_Mot_ARN(Tree, Mot3);
                	  Tree := ajout_Mot_ARN(Tree, Mot1);
                	  Tree := ajout_Mot_ARN(Tree, Mot2);
                	  Tree := ajout_Mot_ARN(Tree, Mot3);
                	  Tree := ajout_Mot_ARN(Tree, Mot2);
                	  Tree := ajout_Mot_ARN(Tree, Mot2);

                      assert(nb_Occurrences_ARN(Tree, Mot2) = 3, "Le nombre d'occurence n'est pas bon");
                end test_ARN_nb_Occur_Mot;

            procedure test_ARN_Fusion is
                Tree: TARN;
            	Mot1, Mot2, Mot3: TMot;
            	lol, lol2: integer;
            begin
        	    Mot1 := creer_Mot;
            	Mot1 := ajout_Lettre_Fin(Mot1, 'n');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'i');
            	Mot1 := ajout_Lettre_Fin(Mot1, 'h');

                  Mot3 := creer_Mot;
               	  Mot3 := ajout_Lettre_Fin(Mot3, 'n');
            	  Mot3 := ajout_Lettre_Fin(Mot3, 'i');
            	  Mot3 := ajout_Lettre_Fin(Mot3, 'h');
            	  Mot3 := ajout_Lettre_Fin(Mot3, 's');

            	  Mot2 := creer_Mot;
            	  Mot2 := ajout_Lettre_Fin(Mot2, 'n');

            	  Tree := creer_ARN;
            	  Tree := ajout_Mot_ARN(Tree, Mot1);
            	  Tree := ajout_Mot_ARN(Tree, Mot3);
            	  Tree := ajout_Mot_ARN(Tree, Mot1);
            	  Tree := ajout_Mot_ARN(Tree, Mot2);
            	  Tree := ajout_Mot_ARN(Tree, Mot3);
            	  Tree := ajout_Mot_ARN(Tree, Mot2);
            	  Tree := ajout_Mot_ARN(Tree, Mot2);

                  lol := nb_Occurrences_ARN(Tree, Mot1);
                  lol2 := nb_Occurrences_ARN(Tree, Mot2);

                  Tree := fusion_Mots_ARN(Tree, Mot1, Mot2);
                  assert(nb_Occurrences_ARN(Tree, Mot1) = lol+lol2 and (present_ARN(Tree, Mot2) = False), "La Fusion ne marche pas");
            end test_ARN_Fusion;
        
        -- Sur les fichiers

            procedure test_Fichier_Gen_Liste_Couples is
                Liste_Couple, Liste_Couple2: TListe_Couple;
                Fichier: File_Type;
                Fichier2: File_Type;
                Fichier3: File_Type;
            begin

                gen_Liste_Couples(Fichier, Liste_Couple, "texte.txt");

                --gen_Fichier(Liste_Couple, Fichier2, "liste-mot.txt");

                --regen_Liste_Couples(Fichier3, Liste_Couple2, "liste-mot.txt");

                --affichage_decroissant(Liste_Couple2, 200);

                --assert(gen_(Liste_Couple, Mot2) = 3, "Le nombre d'occurence n'est pas bon");
            end test_Fichier_Gen_Liste_Couples;

            procedure test_Fichier_Gen_Tree is
                   Tree, Tree2: TTree_Noeud;
                   Fichier: File_Type;
                   Fichier2: File_Type;
                   Fichier3: File_Type;
               begin

                   gen_Tree(Fichier, Tree, "texte.txt");

                   --gen_Fichier_Tree(Tree, Fichier2, "liste-mot.txt");

                   --regen_Tree(Fichier3, Tree2, "liste-mot.txt");

                   --affiche_Decroissant_Occurrence(Tree2, 200);

                   --assert(gen_(Liste_Couple, Mot2) = 3, "Le nombre d'occurence n'est pas bon");
               end test_Fichier_Gen_Tree;
    
end FL_Tests;
