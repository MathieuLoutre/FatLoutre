with text_io; use text_io;
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
        return new TCellule'(N, null);
    end ajout_Debut;
    
    procedure modif_Val_Suivant(T: in out TPtrCellule; N: in TPtrCellule) is
    begin
        T.suiv := N;
    end modif_Val_Suivant;
    
    procedure modif_Val(T: in out TPtrCellule; N: in TElem) is
    begin
        T.val := N;
    end modif_Val;
    
    function Inserer(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        L1: TPtrCellule := new TCellule'(N, suivant(T));
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
	        end loop;
	        
	        modif_Val_Suivant(L, ajout_Debut(L, N));
	        return T;
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

--------------------------- GENERIQUE ---------------------------
    
    function insert_Trie(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        L1 : TPtrCellule;
    begin
        if vide(T) then
             L1 := ajout_Debut(L1, N);
            return L1;
        elsif ordre(valeur(T), N) then
            L1 := new TCellule'(N, T);
            return L1;
        else
            L1 := T;
            modif_Val_Suivant(L1, insert_Trie(T.suiv, N));
            return T;
        end if;
    end insert_Trie;

	function listes_Egales(T1: in TPtrCellule; T2: in TPtrCellule) return Boolean is
	begin
        if (not vide(T1)) and then not (vide(T2)) then
            if (egaux(valeur(T1), valeur(T2))) then
                return listes_Egales(suivant(T1), suivant(T2));
            else
                return False;
            end if;
        else
            return (vide(T1) and vide(T2));
        end if;
	end listes_Egales;

	function supprimer(T: in TPtrCellule; N: in TElem) return TPtrCellule is
	begin
	    if vide(T) then
		    return T; 
	    else
		    if egaux(valeur(T), N) then
		        return suivant(T);
		    else 
		        T.suiv := supprimer(T.suiv, N);
		        return T;
		    end if;
	    end if;
	end supprimer;
      
end PListe_Gen;