--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/arn_gen.ads
--

generic
    type TElem is private;
    with procedure affiche(E: in TElem);
      
package ARN_Gen is
      
    type TPtrCellule is private;

    function creer_ARN return TPtrCellule;
        -- Créé un ARN vide

    generic 
        with function egaux(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'égalité différentes

	function est_Racine(T: in TPtrCellule) return boolean;
	-- retourne vrai si T est racine, faux sinon
	-- Retourne vide si l'ARN est vide

    procedure change_Couleur (T: in TPtrCellule);
	-- change la couleur de la cellule
	-- Retourne vide si l'ARN est vide

    generic
        with function ordre(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'ordres différentes

	function frere (T: in TPtrCellule) return TPtrCellule;
	-- Retourne le frere de T
	-- Retourne vide si l'ARN est vide

    generic
        with function ordre(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'ordres différentes

	function oncle (T: in TPtrCellule) return TPtrCellule;
	-- Retourne le oncle de T
	-- Retourne vide si l'ARN est vide

    generic
        with function ordre(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'ordres différentes

	function est_Fils_Droit(T: in TPtrCellule) return Boolean;
	-- Retourne Vrai si T est le fils droit de son pere, faux sinon
	-- Retourne vide si l'ARN est vide

    function hauteur (T: in TPtrCellule) return Integer;
       -- Retourne la hauteur de l'ARN

    function vide (T: in TPtrCellule) return Boolean;
    	-- Retourne True si l'ARN est vide, False sinon

    function couleur (T: in TPtrCellule) return Boolean;
    	-- Retourne vrai si la cellule est noire, faux si elle est rouge
    	-- Retourne vide si l'ARN est vide

    function valeur (T: in TPtrCellule) return TElem;
    	-- Retourne la valeur du premier élément de l'ARN. 
    	-- Retourne une erreur si la cellule est vide (l'erreur d'ADA)

    function fils_Gch (T: in TPtrCellule) return TPtrCellule;
    	-- Retourne le fils gauche de la Cellule
    	-- Retourne vide si l'ARN est vide

    function pere (T: in TPtrCellule) return TPtrCellule;
    	-- Retourne le pere de la Cellule
    	-- Retourne vide si l'ARN est vide

    function fils_Drt (T: in TPtrCellule) return TPtrCellule;
    	-- Retourne le fils droit de la Cellule
    	-- Retourne vide si l'ARN est vide
    
    procedure modif_Val(T: in out TPtrCellule; N: in TElem);
        -- Modifie la valeur (T.val) de T avec N

    function min_Des_Max(T: in TPtrCellule) return TPtrCellule;
	-- Retourne le minimum du sous-arbre droit de l'arbre

    function equilibre (T : in TPtrCellule) return integer;
	-- Equilibre l'arbre binaire en arbre rouge et noir

	procedure equilibre_Insertion(T: in out TPtrCellule);

    generic
        with function ordre(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'ordres différentes

	function ajout_Elem (T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Ajoute un élément à sa place dans l'ARN

    function inserer_Equilibre (T: in TPtrCellule; N: in TElem) return TPtrCellule;
	-- Insere un élément N puis equilbre l'arbre

    function supprimer_Equilibre(T: in TPtrCellule; N: in TElem) return TPtrCellule;
	-- Supprime le premier élément N puis equilbre l'arbre

    generic
        with function egaux(T1: in TElem; T2: in TElem) return Boolean;
        -- Pour permettre de supprimer en fonction de plusieurs paramètres d'égalités différents
        -- (sur les occurences ou les mots par exemple)

	with function ordre(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'ordres différentes

	function supprimer_Elem (T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Retourne un ARN sans le premier TElem rencontré
        -- Retourne le même ARN si le TElem n'est pas dans l'ARN

    generic 
        with function egaux(T1: in TElem; T2: in TElem) return Boolean;
        -- Permet de faire l'égalité suivant des relations d'égalité différentes

	function arn_Egaux (T1: in TPtrCellule; T2: in TPtrCellule) return Boolean;
       	-- Retourne Vrai si les 2 ARN sont égaux. Faux sinon.

    procedure affiche_ARN (T: in TPtrCellule);
    	-- Parcours l'ARN et affiche à l'aide de la fonction affiche passée en paramètre du package générique

    function rotation_Droite(T1: in TPtrCellule; T2: in TPtrCellule) return TPtrCellule;
	-- Effectue une rotation droite du sous-arbre ayant pour racine le 1er noeud passé selon le pivot donné par le 2nd paramètre
	-- Retourne la nouvelle racine du sous-arbre après rotation droite
    function rotation_Gauche(T1: in TPtrCellule; T2: in TPtrCellule) return TPtrCellule;
	-- Effectue une rotation gauche du sous-arbre ayant pour racine le 1er noeud passé selon le pivot donné par le 2nd paramètre
	-- Retourne la nouvelle racine du sous-arbre après rotation gauche

    private
        type TCellule;
        type TPtrCellule is access TCellule;
        type TCellule is record
            val: TElem;
            fgch: TPtrCellule;
	    fdrt: TPtrCellule;
	    pere: TPtrCellule;
	    coul: Boolean;
        end record;
        
end ARN_Gen;