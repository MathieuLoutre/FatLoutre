--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/fl_tests.ads

with Ahven.Framework;
with Text_IO; use Text_IO;
with ada.integer_text_io; use ada.integer_text_io;
with PMot; use PMot;
with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PListe_Trio; use PListe_Trio;
with PFichier; use PFichier;
--with PNoeud; use PNoeud;
with PTree_Noeud; use PTree_Noeud;

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
    procedure test_Liste_Fusion_Couple; 
        
-- Test sur les fichiers
    procedure test_Fichier_Gen_Liste_Couples;
    procedure test_Fichier_Gen_Tree;
        
-- Test sur les listes de trios
    procedure test_Liste_Trio_Fusion_Listes;  
    procedure test_Liste_Trio_Mots_Communs;  
    procedure test_Liste_Trio_Mots_Differents;

-- Test sur les Tries
    procedure test_Tree_nb_Superieur;
    procedure test_Tree_nb_Occurrence;
    procedure test_Tree_Taille;
    procedure test_Tree_Presence;
    procedure test_Tree_Presence_Fail;
    procedure test_Tree_nb_Prefixe;
    procedure test_Tree_nb_Suffixe;
    procedure test_Tree_nb_Facteur;
    procedure test_Tree_Moy_Occur;
    procedure test_Tree_Moy_Long;
    procedure test_Tree_nb_Occur_Mot;  
    procedure test_Tree_Fusion;
        
end FL_Tests;
