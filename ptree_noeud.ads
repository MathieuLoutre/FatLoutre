--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_noeud.ads
--

with PTree_Gen;
with PMot; use PMot;
with PNoeud; use PNoeud;
with PListe_Couple; use PListe_Couple;
with PCouple; use PCouple;
with text_io; use text_io;

package PTree_Noeud is
        
    package Tree_Noeud is new PTree_Gen(TNoeud, 28, hash_Char); use Tree_Noeud;
    subtype TTree_Noeud is TPtrCellule;  
    
    function creer_Tree_Noeud return TTree_Noeud;
        -- Créé un tree de Noeuds vide
        
    function tree_Noeud_Vide(T: in TTree_Noeud) return Boolean;
    	-- Retourne True si la tree est vide, False sinon
    	
    function valeur_Noeud(T: in TTree_Noeud) return TNoeud;
    	-- Retourne la valeur du premier élément de la tree. 
    	-- Retourne une erreur si la cellule est vide
    
    function present_Tree(T: in TTree_Noeud; Mot: in TMot) return Boolean;
        -- retourne True si le mot est présent dans la tree, faux sinon
        
    procedure affiche_Tree(T: in TTree_Noeud);
        
    function fils_Existe(T: in TTree_Noeud; N: in Character) return Boolean;
        
    function ajout_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud;
        -- Ajoute un mot dans le Tree :)
    
    function supprime_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud;
        -- Supprime un mot existant dans le tree. 
    
    function get_Mot_Tree(T: in TTree_Noeud; Mot: in TMot := creer_Mot) return TMot;
         -- recréé un mot à partir d'un T donné
     
    function retrouve_Mot(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud;
        --Retrouve le mot passe en paramètre dans le tree. Si le mot n'existe pas, retourne null.

    function nb_Mots_Tree(T: in TTree_Noeud) return Integer;
        --Renvoie le nombre de mots contenu dans le Tree donné
           
    function nb_Occurrences_Total(T: in TTree_Noeud) return Integer;
        --Renvoie la somme des occurences de tous les mots contenus dans tree.
        --Si tree est vide, on renvoie 0.
    
    function moy_Occurrence_Tree(T: in TTree_Noeud) return Float;
  
    function moy_Longueur_Tree(T: in TTree_Noeud) return Float;
    
    function nb_Prefixe_Tree (T: in TTree_Noeud; M: in TMot) return Integer;

    function nb_Suffixe_Tree(T: in TTree_Noeud; M:in TMot) return Integer;

    function nb_Facteur_Tree (T: in TTree_Noeud; M: TMot) return Integer;
        
    function nb_Superieur_Tree(T: in TTree_Noeud; N: in Integer) return Integer;
    
    function nb_Occurrence_Mot_Tree(T: in TTree_Noeud; M: in TMot) return Integer;
    
    function fusion_Mot_Tree(T: in TTree_Noeud; M1, M2: in TMot) return TTree_Noeud;
    
    procedure affiche_Decroissant_Occurrence(T: in TTree_Noeud; N: in Integer);
        
    function tree_To_Liste_Occurrence_Decroissante(T: in TTree_Noeud; L: in TListe_Couple := creer_Liste_Couple) return TListe_Couple;
    
    function longueur_Fils(T: in TTree_Noeud) return Integer;
    
    function fils_Char_Int(T: in TTree_Noeud; C: in Integer) return TTree_Noeud;
    
    procedure modif_Tree(T: in TTree_Noeud; N: in TNoeud);
    
    private
        function Longueur_Totale_Mot_Tree(T: in TTree_Noeud) return Integer;
   
end PTree_Noeud;
