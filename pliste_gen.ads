--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_gen.ads

generic
    type TElem is private;
    with procedure affiche(E: in TElem);
      
package PListe_Gen is
      
    type TPtrCellule is private;

    function creer_Liste return TPtrCellule;
        -- Créé une liste vide
    	
    function longueur (T: in TPtrCellule) return Integer;
       -- Retourne la taille de la liste

    procedure affiche_Liste (T: in TPtrCellule);
    	-- Parcours la liste et affiche à l'aide de la fonction affiche passée en paramètre du package générique
    
    function ajout_Fin (T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Ajoute un élément en fin de liste

    function ajout_Debut (T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Ajoute un élément en début de liste (la tête)

    function vide (T: in TPtrCellule) return Boolean;
    	-- Retourne True si la liste est vide, False sinon

    function valeur (T: in TPtrCellule) return TElem;
    	-- Retourne la valeur du premier élément de la liste. 
    	-- Retourne une erreur si la cellule est vide (l'erreur d'ADA)

    function suivant (T: in TPtrCellule) return TPtrCellule;
    	-- Retourne l'élément suivant de la liste.
    	-- Retourne vide si la liste est vide
    
    procedure modif_Val(T: in out TPtrCellule; N: in TElem);
        -- Modifie la valeur (T.val) de T avec N
    
    procedure modif_Val_Suivant(T: in out TPtrCellule; N: in TPtrCellule);
        -- Modifie la valeur du suivant de T (T.suiv)
        
    function Inserer(T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Insert l'élément N après T
    
    generic
        with function egaux(T1: in TElem; T2: in TElem) return Boolean;
        -- Pour permettre de supprimer en fonction de plusieurs paramètres d'égalités différents
        -- (sur les occurences ou les mots par exemple)
    function supprimer (T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Retourne une liste sans le premier TElem rencontré
        -- Retourne la même liste si le TElem n'est pas dans la liste

    generic 
        with function egaux(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'égalité différentes
    function listes_Egales (T1: in TPtrCellule; T2: in TPtrCellule) return Boolean;
       	-- Retourne Vrai si les 2 listes sont égales. Faux sinon.

    generic
        with function ordre(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'ordres différentes
    function insert_trie(T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Insert l'élément à sa place dans la liste (suivant la relation d'ordre générique)
    	    
    private
        type TCellule;
        type TPtrCellule is access TCellule;
        type TCellule is record
            val: TElem;
            suiv: TPtrCellule;
        end record;
        
end PListe_Gen;
      
   
