package body PListe_Gen is

    function creer_Liste return TPtrCellule is
    begin
        return null;
    end creer_Liste;

	function vide(T: in TPtrCellule) return Boolean is
	begin
		return (T = null);
	end vide;

    function ajout_Debut(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
    	return new TCellule'(N, T);
    end ajout_Debut;

    -- TO BE REFACTORED
    function ajout_Fin(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
        if not vide(T) then
	    if not vide(suivant(T)) then
			return ajout_Fin(suivant(T), N);
	    else
			T.suiv := new TCellule'(N, null);
			return ajout_Fin(T, N);
	    end if;
        else
            return ajout_Debut(T, N);
        end if;
    end ajout_Fin;

    function longueur(T: in TPtrCellule) return Integer is
    begin
	    if not vide(T) then
		    return (1 + longueur(suivant(T)));
	    else
		    return 0;
	    end if;
    end longueur;

    procedure affiche_Liste(T: in TPtrCellule) is
    begin
	    if not vide(T) then
		    affiche(valeur(T));
		    affiche_Liste(suivant(T));
	    end if;
    end affiche_Liste;
    
    -- NEED ERROR CASE - REFACTORING
    function valeur(T: in TPtrCellule) return TElem is
    begin
	    return T.val;
    end valeur;

    function suivant(T: in TPtrCellule) return TPtrCellule is
    begin
	    if not vide(T) then
		    return T.suiv;
	    else
		    return null;
	end if;
    end suivant;
    
    function modif_Liste(T: in TPtrCellule; N: in TElem) return TPtrCellule is
	L : TPtrCellule;
    begin
	L := T;
	L := suivant(L);
	L := new TCellule'(N, L);
	return L;
    end modif_Liste;

    -- TO BE REFACTORED
    function insert_Trie_Croissant(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        begin
            if not vide(T) then
                if (not vide(suivant(T)) and then (superieur(N, valeur(suivant(T))))) then
                    return insert_Trie_Croissant(suivant(T), N);
                else
                    return modif_Liste(T, N);
                end if;
            else
                return ajout_Debut(T, N);
            end if;
        end insert_Trie_Croissant;

	function listes_Egales(T1: in TPtrCellule; T2: in TPtrCellule) return Boolean is
	begin
		if (not vide(T1)) and not (vide(T2)) then
			if (egaux(valeur(T1), valeur(T2))) then
				return listes_Egales(suivant(T1), suivant(T2));
			else
				return False;
			end if;
		else
			return (vide(T1) and vide(T2));
		end if;
	end listes_Egales;

	procedure supprimer(T: in out TPtrCellule; N: in TElem) is
	begin
		if (not vide(T)) then 
			if egaux(valeur(T), N)
				then T:= suivant(T);
			else 
				T := suivant(T);
				supprimer(T, N);
			end if;
		end if;
	end supprimer;

end PListe_Gen;