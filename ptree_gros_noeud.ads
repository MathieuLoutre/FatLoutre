--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_gros_noeud.ads
--

with PTree_Gen;
with PMot; use PMot;
with PGros_Noeud; use PGros_Noeud;
with PNoeud; use PNoeud;
with PTree_Noeud; use PTree_Noeud;
with PListe_Trio; use PListe_Trio;
with PTrio; use PTrio;
with text_io; use text_io;

package PTree_Gros_Noeud is
        
    package Tree_Gros_Noeud is new PTree_Gen(TGros_Noeud, 28, hash_Char); use Tree_Gros_Noeud;
    subtype TTree_Gros_Noeud is TPtrCellule;  
    
    function creer_Tree_Gros_Noeud return TTree_Gros_Noeud;
        -- Créé un tree de Gros_Noeud vide
        
    function tree_Gros_Noeud_Vide(T: in TTree_Gros_Noeud) return Boolean;
    	-- Retourne True si la tree est vide, False sinon
    	
    function valeur_Gros_Noeud(T: in TTree_Gros_Noeud) return TGros_Noeud;
    	-- Retourne la valeur du premier élément de la tree. 
    	-- Retourne une erreur si la cellule est vide
    
    function present_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot) return Boolean;
        -- retourne True si le mot est présent dans la tree, faux sinon
        
    procedure affiche_Tree_Gros(T: in TTree_Gros_Noeud);
        
    function fils_Existe_Gros(T: in TTree_Gros_Noeud; N: in Character) return Boolean;
        
    function ajout_Mot_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot; Oc1, Oc2: in Integer) return TTree_Gros_Noeud;
        -- Ajoute un mot dans le Tree :)
    
    function supprime_Mot_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot) return TTree_Gros_Noeud;
        -- Supprime un mot existant dans le tree. 
    
    function get_Mot_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot := creer_Mot) return TMot;
         -- recréé un mot à partir d'un T donné
     
    function retrouve_Mot_Gros(T: in TTree_Gros_Noeud; Mot: in TMot) return TTree_Gros_Noeud;
        --Retrouve le mot passe en paramètre dans le tree. Si le mot n'existe pas, retourne null.

    function nb_Mots_Tree_Gros(T: in TTree_Gros_Noeud) return Integer;
        --Renvoie le nombre de mots contenu dans le Tree donné
           
    function nb_Occurrences_Total_Gros(T: in TTree_Gros_Noeud) return Integer;
        --Renvoie la somme des occurences de tous les mots contenus dans tree.
        --Si tree est vide, on renvoie 0.
    
    function moy_Occurrence_Tree_Gros(T: in TTree_Gros_Noeud) return Float;
  
    function moy_Longueur_Tree_Gros(T: in TTree_Gros_Noeud) return Float;
    
    function nb_Prefixe_Tree_Gros(T: in TTree_Gros_Noeud; M: in TMot) return Integer;

    function nb_Suffixe_Tree_Gros(T: in TTree_Gros_Noeud; M:in TMot) return Integer;

    function nb_Facteur_Tree_Gros(T: in TTree_Gros_Noeud; M: TMot) return Integer;
        
    function nb_Superieur_Tree_Gros(T: in TTree_Gros_Noeud; N: in Integer) return Integer;
    
    function nb_Occurrence_Mot_Tree_Gros(T: in TTree_Gros_Noeud; M: in TMot) return Integer;
    
    function fusion_Mot_Tree_Gros(T: in TTree_Gros_Noeud; M1, M2: in TMot) return TTree_Gros_Noeud;
    
    procedure affiche_Decroissant_Occurrence_Gros(T: in TTree_Gros_Noeud; N: in Integer);
        
    function tree_To_Liste_Occurrence_Decroissante_Gros(T: in TTree_Gros_Noeud; L: in TListe_Trio := creer_Liste_Trio) return TListe_Trio;
    
    function longueur_Fils_Gros(T: in TTree_Gros_Noeud) return Integer;
    
    function fils_Char_Int_Gros(T: in TTree_Gros_Noeud; C: in Integer) return TTree_Gros_Noeud;
    
    procedure modif_Tree_Gros(T: in TTree_Gros_Noeud; N: in TGros_Noeud);
    
    function mots_Communs_Tree(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
    
    function mots_Differents_Tree(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
    
    function fusion_Tree(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
    
    private
        function Longueur_Totale_Mot_Tree_Gros(T: in TTree_Gros_Noeud) return Integer;
        function fusion_Tree_Gch(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
        function fusion_Tree_Drt(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
        function mots_Differents_Tree_Gch(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
        function mots_Differents_Tree_Drt(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud;
        
end PTree_Gros_Noeud;
