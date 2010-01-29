--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 01/10 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_noeud.ads
--
-- Paquet qui instancie la structure générique de tree PTree_Gen. 
-- On utilisera la fonction de hashage des Noeuds
-- et les Noeuds comme élément de la structure.
-- On notera les occurrences d'un mot sur la dernière lettre de celui-ci. Si elles sont à 0, c'est simplement une lettre.
-- Si c'est superieur à 0, elle fait référence à un Mot.

with PTree_Gen;
with PMot; use PMot;
with PNoeud; use PNoeud;
with PListe_Couple; use PListe_Couple;
with PCouple; use PCouple;
with text_io; use text_io;

package PTree_Noeud is
    
    -- On instancie en utilisant la fonction de hashage des noeuds.
    -- On prend 28 pour avoir les 26 charactères minuscule + le tiret et la quote
    package Tree_Noeud is new PTree_Gen(TNoeud, 28, hash_Char); use Tree_Noeud;
    subtype TTree_Noeud is TPtrCellule;  
    
    function creer_Tree_Noeud return TTree_Noeud;
        -- Créé un tree avec une racine
        
    function present_Tree(T: in TTree_Noeud; Mot: in TMot) return Boolean;
        -- retourne True si le mot est présent dans la tree, faux sinon
        
    procedure affiche_Tree(T: in TTree_Noeud);
        -- Affiche le Tree ordonné par ordre alphabétique (comme ils ont été rentré)
        
    function fils_Existe(T: in TTree_Noeud; N: in Character) return Boolean;
        -- retourne True si le fils N de T existe, faux sinon.
        
    function ajout_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud;
        -- Ajoute un mot dans le Tree :)
    
    function supprime_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud;
        -- Supprime un mot dans le tree.
    
    function get_Mot_Tree(T: in TTree_Noeud; Mot: in TMot := creer_Mot) return TMot;
         -- recréé un mot à partir d'un T donné.
     
    function retrouve_Mot(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud;
        --Retrouve le mot passé en paramètre dans le tree. 
        -- Si il y est, on retourne le pointeur vers celui-ci, sinon retourne null.

    function nb_Mots_Tree(T: in TTree_Noeud) return Integer;
        --Renvoie le nombre de mots contenu dans le Tree donné
           
    function nb_Occurrences_Total(T: in TTree_Noeud) return Integer;
        --Renvoie la somme des occurences de tous les mots contenus dans tree.
        --Si tree est vide, on renvoie 0.
    
    function moy_Occurrence_Tree(T: in TTree_Noeud) return Float;
        -- retourne la moyenne des occurrences du Tree. Si le tree est vide, retourne 0.
  
    function moy_Longueur_Tree(T: in TTree_Noeud) return Float;
        -- retourne la moyenne des longueurs du Tree. Si le tree est vide, retourne 0.
    
    function nb_Prefixe_Tree (T: in TTree_Noeud; M: in TMot) return Integer;
        -- Retourne le nombre de mots dans le tree ayant M pour préfixe. 
        -- Si le tree est vide ou qu'il n'est préfixe de personne, retourne 0.

    function nb_Suffixe_Tree(T: in TTree_Noeud; M:in TMot) return Integer;
        -- Retourne le nombre de mots dans le tree ayant M pour suffixe. 
        -- Si le tree est vide ou qu'il n'est suffixe de personne, retourne 0.

    function nb_Facteur_Tree (T: in TTree_Noeud; M: TMot) return Integer;
        -- Retourne le nombre de mots dans le tree ayant M pour facteur. 
        -- Si le tree est vide ou qu'il n'est facteur de personne, retourne 0.
        
    function nb_Superieur_Tree(T: in TTree_Noeud; N: in Integer) return Integer;
        -- Retourne le nombre de mots ayant une longueur >= à N.
        -- Si le tree est vide ou qu'il n'y a pas de mot >= à N, retourne 0.
    
    function nb_Occurrence_Mot_Tree(T: in TTree_Noeud; M: in TMot) return Integer;
        -- retourne le nombre d'occurrences du mot M passé en paramètre.
        -- retourne 0 si le tree est vide ou si le mot n'existe pas.
    
    function fusion_Mot_Tree(T: in TTree_Noeud; M1, M2: in TMot) return TTree_Noeud;
        -- Fusionne au niveau des occurrences les Mots M1 et M2 dans le tree.
        -- Ajoute les occurrences de M2 à M1 et supprime M2.
    
    procedure affiche_Decroissant_Occurrence(T: in TTree_Noeud; N: in Integer);
        -- Affiche le Tree ordonné de façon décroissante sur les occurrences.
    
    -- Alias de fonctions génériques pour accès exterieur --
    
    function tree_Noeud_Vide(T: in TTree_Noeud) return Boolean;
        -- Retourne True si la tree est vide, False sinon

    function valeur_Noeud(T: in TTree_Noeud) return TNoeud;
     	-- Retourne la valeur du premier élément de la tree. 
      	-- Retourne une erreur si la cellule est vide
    
    function longueur_Fils(T: in TTree_Noeud) return Integer;
        -- retourne la longueur des fils (Max)
    
    function fils_Char_Int(T: in TTree_Noeud; C: in Integer) return TTree_Noeud;
        -- retourne le pointeur vers le noeud correspondant à C
    
    procedure modif_Tree(T: in TTree_Noeud; N: in TNoeud);
        -- Modifie la valeur du Tree pour mettre N
    
    private
        function Longueur_Totale_Mot_Tree(T: in TTree_Noeud) return Integer;
            -- Renvoi la longueur totale des mots de T (addition de toutes les longueurs)
            
        function tree_To_Liste_Occurrence_Decroissante(T: in TTree_Noeud; L: in TListe_Couple := creer_Liste_Couple) return TListe_Couple;
            -- Converti le tree est liste ordonée sur les occurrences de manière croissante
        
end PTree_Noeud;
