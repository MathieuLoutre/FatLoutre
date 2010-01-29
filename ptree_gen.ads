--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 01/10 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_gen.ads
--
-- Une structure de Tries générique. Elle necessite en plus du type des éléments qu'on souhaite stocker,
-- un int qui désigne le maximum de la table de hashage, et la fonction de hashage correspondante.
-- Avoir une table de hashage permet de stocker le nombre de fils necessaire lors de l'instanciation
-- et ainsi avoir un access instantané aux valeurs souhaitées.

with text_io; use text_io;

generic
    type TElem is private;
        
    Max: integer;
    -- La taille du tableau
    
    -- Trouve la bonne case du Tableau en fonction du TElem
    -- (return un integer (unique, pas de collision) entre 1 et Max)
    with function hash(N: in TElem) return integer;
      
package PTree_Gen is
      
    type TPtrCellule is private;
    type TFils is array(1..Max) of TPtrCellule;
    -- Le tableau de fils
        
    function creer_Tree(N: in TElem) return TPtrCellule;
        -- retourne une racine de tries et des fils nuls
    
    function Tree_Vide return TPtrCellule;
        -- retourne l'unité désignant le vide dans le tries
    
    function elem_Vide(T: in TPtrCellule) return Boolean;
       	-- Retourne True si le tries est vide, False sinon.

    function valeur_Elem(T: in TPtrCellule) return TElem;
       	-- Retourne la valeur du premier élément de la liste (T.val)
       	-- Retourne une erreur si la cellule est vide (l'erreur d'ADA)
        
    function precedent(T: in TPtrCellule) return TPtrCellule;
        -- retourne le papa de T, erreur si T est vide

    function fils_N(T: in TPtrCellule; N: in TElem) return TPtrCellule;
       	-- Retourne le pointeur vers le fils N si il existe. Retourne null sinon.
           	
    procedure modif_Val_Tree(T: in TPtrCellule; N: in TElem);
        -- Modifie la valeur de T (T.val) en la remplaçant avec le N passé

    function insert_Fils(T: in TPtrCellule; N: in TElem; M: TFils := (others => Tree_Vide)) return TPtrCellule;
        -- Affecte un fils N dans les fils de T. Si il est y est déjà, on ne fait rien.
        -- M est initialisé par défaut aux fils nuls.
            
    procedure modif_Val_Fils(T: in TPtrCellule; N: in TElem; L: in TPtrCellule);
        -- Place le pointeur L dans le fils de T coresspondant à N
        
    function fils_N_Int(T: in TPtrCellule; C: in Integer) return TPtrCellule;
        -- Retourne l'élément qui est à l'adresse C du tableau. Si c'est dépasse Max, erreur.
    
    function fils_Length(T: in TPtrCellule) return Integer;
        -- Retourne la taille du fils (en rapport avec Max)
    
    function fils_Meh(T: in TPtrCellule) return TFils;
        -- retourne le tableau de fils de T
        
    private
        
        type TCellule;
        type TPtrCellule is access TCellule;
        type TCellule is record
            val: TElem;
            papa: TPtrCellule;
            fils: TFils := (others => null); -- initialisé à nul
        end record;
        
end PTree_Gen;
      
   
