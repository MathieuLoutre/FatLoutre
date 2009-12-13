with Ahven.Framework;
with Text_IO; use Text_IO;
with PMot; use PMot;
with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PFichier; use PFichier;

package FL_Tests is
    type Test is new Ahven.Framework.Test_Case with null record;

    procedure Initialize(T : in out Test);

-- Test sur le PMot
    procedure test_Mot_Vide;    
    procedure test_Mot_Plein;
    procedure test_Mot_Taille;
    procedure test_Mot_Prefixe;
    procedure test_Mot_Suffixe;
    procedure test_Mot_Facteur;
    procedure test_Mot_Egaux;
    procedure test_Mot_Petit;
    procedure test_Mot_Petit_Fail;
    procedure test_Mot_Prefixe_Fail;
    procedure test_Mot_Suffixe_Fail;
    procedure test_Mot_Facteur_Fail;
    procedure test_Mot_Egaux_Fail;
    procedure test_Mot_Superieur;
    procedure test_Mot_Superieur_Fail;


-- Test sur le PCouple
    procedure test_Couple_Egaux;
    procedure test_Couple_Egaux_Fail;
    procedure test_couple_Superieur_Occurrence;
    procedure test_couple_Superieur_Occurrence_Fail;
    procedure test_couple_Inferieur_Mot;
    procedure test_couple_Inferieur_Mot_Fail;
    procedure test_Couple_Mot;
    procedure test_Couple_Occurrence;


-- Test sur le PListe_Couple
    procedure test_Liste_Couple_Vide;
    procedure test_Liste_Couple_Plein;
    procedure test_Liste_Couple_valeur;
    procedure test_Liste_Couple_nb_Superieur;
    procedure test_Liste_Couple_nb_Occurrence;
    procedure test_Liste_Couple_nb_Mots;
    procedure test_Liste_Couple_Taille;
    procedure test_Liste_Couple_Presence;
    procedure test_Liste_Couple_Presence_Fail;
    procedure test_Liste_Couple_nb_Prefixe;
    procedure test_Liste_Couple_nb_Suffixe;
    procedure test_Liste_Couple_nb_Facteur;
    procedure test_Liste_Couple_Moy_Occur;
    procedure test_Liste_Couple_Moy_Long;
    procedure test_Liste_Couple_nb_Occur_Mot;        
        
end FL_Tests;