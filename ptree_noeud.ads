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
   
end PTree_Noeud;
