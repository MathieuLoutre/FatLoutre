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
    procedure test_Mot_Prefixe_Fail;
    procedure test_Mot_Suffixe_Fail;
    procedure test_Mot_Facteur_Fail;
    procedure test_Mot_Egaux_Fail;


-- Test sur le PCouple
    procedure test_Couple_Egaux;
    procedure test_Couple_Egaux_Fail;
    procedure test_couple_Superieur;
    procedure test_couple_Superieur_Fail;
    procedure test_Couple_Mot;
    procedure test_Couple_Occurrence;


-- Test sur le PListe_Couple
    procedure test_Liste_Couple_Vide;
    procedure test_Liste_Couple_Plein;
    procedure test_Liste_Couple_valeur;
    procedure test_Liste_Couple_nb_Superieur;
        
end FL_Tests;