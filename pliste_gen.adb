package body PListe_Gen is
        
    procedure creer_Liste(T: out TPtrCellule) is
    begin
        T:= null;
    end creer_Liste;

    function vide(T: in TPtrCellule) return Boolean is
    begin
        return (T = null);
    end vide;

    procedure ajout_Debut(T: in out TPtrCellule; N: in TElem) is
    begin
    	T:= new TCellule'(N, T);
    end ajout_Debut;

    -- TO BE REFACTORED
    procedure ajout_Fin(T: in out TPtrCellule; N: in TElem) is
    begin
        if not vide(T) then
	    if not vide(suivant(T)) then
		T := suivant(T);
		ajout_Fin(T, N);
	    else
		T.suiv := new TPtrCellule'(N, null);
	    end if;
        else
            ajout_Debut(T, N);
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

    -- TO BE REFACTORED
    procedure insert_Trie_Croissant(T: in out TPtrCellule; N: in TElem) is
        begin
            if not vide(T) then
                if (not vide(suivant(T)) and then (superieur(N, valeur(suivant(T))))) then
                    T := suivant(T);
                    insert_Trie_Croissant(T, N);
                else
                    T := suivant(T);
                    T := new TCellule'(N, T);
                end if;
            else
                ajout_Debut(T, N);
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