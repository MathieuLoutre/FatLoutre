package body PListe_Gen is

    function creer_Liste return TPtrCellule is
    begin
        return null;
        -- null équivaut à la liste vide
    end creer_Liste;

	function vide(T: in TPtrCellule) return Boolean is
	begin
		return (T = null);
	end vide;

    function ajout_Debut(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
        return new TCellule'(N, null);
        -- Ajoute une tete à la liste
    end ajout_Debut;
    
    procedure modif_Val_Suivant(T: in out TPtrCellule; N: in TPtrCellule) is
    begin
        T.suiv := N;
        -- Un sorte d'accesseur pour le suivant de T. Affecte un pointeur.
    end modif_Val_Suivant;
    
    procedure modif_Val(T: in out TPtrCellule; N: in TElem) is
    begin
        T.val := N;
        -- Sorte d'accesseur pour la valeur de T. Affecte un TElem.
    end modif_Val;
    
    function Inserer(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        L1: TPtrCellule := new TCellule'(N, suivant(T));
        -- On créé une nouvelle cellule avec N comme valeur et le suivant de T comme suivant 
        -- (car on l'insert APRES le T donné)
        L2: TPtrCellule := T;
    begin
        modif_Val_Suivant(L2, L1);
        return T;
    end Inserer;

    function ajout_Fin(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        L: TPtrCellule := T;
    begin
        if not vide(L) then
	        while not vide(suivant(L)) loop
			    L := suivant(L);
	        end loop; -- On passe au suivant tant que le suivant n'est pas vide
	        -- ici on est donc positionné sur un élément qui a son pointeur suiv à null
	        
	        modif_Val_Suivant(L, ajout_Debut(L, N));
	        -- On ajoute le nouvel élément au suivant
	        return T;
        else
            return ajout_Debut(T, N);
            -- Si elle est vide, on ajoute une tête
        end if;
    end ajout_Fin;

    function longueur(T: in TPtrCellule) return Integer is
    begin
	    if not vide(T) then
		    return (1 + longueur(suivant(T)));
		    -- la longueur du mot est égale à 1 + la longueur du reste du mot
	    else
		    return 0;
		    -- Quand on est à la fin, on donne un 0 pour ne pas biaiser l'addition
	    end if;
    end longueur;

    procedure affiche_Liste(T: in TPtrCellule) is
    begin
	    if not vide(T) then
		    affiche(valeur(T));
		    -- On affiche la valeur du TElem
		    affiche_Liste(suivant(T));
		    -- On souhaite afficher la prochaine valeur du TElem
	    end if;
    end affiche_Liste;
    
    function valeur(T: in TPtrCellule) return TElem is
    begin
	    return T.val;
	    -- Accesseur pour T.val
	    -- On laisse ADA gerer l'erreur, on la catchera plus tard si necessaire
	    -- Car on ne devrait pas avoir à appeler un T.val sur un T vide
    end valeur;

    function suivant(T: in TPtrCellule) return TPtrCellule is
    begin
	    if not vide(T) then
		    return T.suiv;
		    -- On retourne le suivant
	    else
		    return null;
		    -- Si par malheur on appel sur un T vide...
	    end if;
    end suivant;

--------------------------- GENERIQUES ---------------------------
    
    -- On a ordre qui est transmis à l'instanciation
    function insert_Trie(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        L1 : TPtrCellule;
    begin
        if vide(T) then
             L1 := ajout_Debut(L1, N);
             -- Si c'est vide, on ajoute la tête
            return L1;
        elsif ordre(valeur(T), N) then
            L1 := new TCellule'(N, T);
            return L1;
        else
            L1 := T;
            modif_Val_Suivant(L1, insert_Trie(T.suiv, N));
            -- On passe au suivant jusqu'a trouver l'endroit où l'inserer 
            -- grâce à la relation d'odre générique
            return T;
        end if;
    end insert_Trie;

    -- On a egaux qui est transmis à l'instanciation
	function listes_Egales(T1: in TPtrCellule; T2: in TPtrCellule) return Boolean is
	begin
        if (not vide(T1)) and then not (vide(T2)) then
            if (egaux(valeur(T1), valeur(T2))) then
                return listes_Egales(suivant(T1), suivant(T2));
                -- C'est égal, c'est pas mal, on va voir si la lettre suivante est aussi égale
            else
                return False;
                -- C'est pas égal, c'est mal parti
            end if;
        else
            return (vide(T1) and vide(T2));
            -- Pour que les 2 listes soient égales
            -- il faut qu'elle soit vide toutes les 2
            -- ce qui voudra dire qu'elles ont passées les tests d'égalité avec succès
        end if;
	end listes_Egales;

    -- On a egaux qui est transmis à l'instanciation
	function supprimer(T: in TPtrCellule; N: in TElem) return TPtrCellule is
	begin
	    if vide(T) then
		    return T; 
		    -- Si c'est vide, y'a rien à supprimer ou l'élément n'est pas dans la liste
		    -- On renvoit la liste inchangée
	    else
		    if egaux(valeur(T), N) then
		        return suivant(T);
		        -- Si on trouve le mot, on le supprime en le "sautant"
		        -- Le chainage arrière fera le travail
		    else 
		        T.suiv := supprimer(T.suiv, N);
		        -- On va voir si le suivant n'est pas le bon
		        return T;
		    end if;
	    end if;
	end supprimer;
      
end PListe_Gen;