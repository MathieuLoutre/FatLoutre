--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_gen.ads
-- 

with text_io; use text_io;

generic
    type TElem is private;
        
    Max: integer;
    
    -- Trouve la bonne case du Tableau en fonction du TElem
    -- (return un integer (unique, pas de collision) entre 1 et Max)
    with function hash(N: in TElem) return integer;
      
package PTree_Gen is
      
    type TPtrCellule is private;
    type TFils is array(1..Max) of TPtrCellule;
        
        
        function creer_Tree(N: in TElem) return TPtrCellule;
            -- Créé une liste vide
        
        function Tree_Vide return TPtrCellule;
        
        function elem_Vide(T: in TPtrCellule) return Boolean;
           	-- Retourne True si la liste est vide, False sinon

        function valeur_Elem(T: in TPtrCellule) return TElem;
           	-- Retourne la valeur du premier élément de la liste (T.val)
           	-- Retourne une erreur si la cellule est vide (l'erreur d'ADA)
        
        function precedent(T: in TPtrCellule) return TPtrCellule;
            -- retourne le papa de T

        function fils_N(T: in TPtrCellule; N: in TElem) return TPtrCellule;
           	-- Retourne le pointeur vers le fils N si il existe. Retourne null sinon.
           	
        procedure modif_Val_Tree(T: in TPtrCellule; N: in TElem);

        function insert_Fils(T: in TPtrCellule; N: in TElem; M: TFils := (others => Tree_Vide)) return TPtrCellule;
            -- Affecte un fils N dans les fils de T. Si il est y est déjà, on ne fait rien.
            
        procedure modif_Val_Fils(T: in TPtrCellule; N: in TElem; L: in TPtrCellule);
            
        function fils_N_Int(T: in TPtrCellule; C: in Integer) return TPtrCellule;
        
        function fils_Length(T: in TPtrCellule) return Integer;
   
        function fils_Meh(T: in TPtrCellule) return TFils;
        
    private
        
        type TCellule;
        type TPtrCellule is access TCellule;
        type TCellule is record
            val: TElem;
            papa: TPtrCellule;
            fils: TFils := (others => null);
        end record;
        
end PTree_Gen;
      
   
