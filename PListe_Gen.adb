package body PListe_Gen is
        
    procedure creer_Liste(T: out TPtrCellule)
        T:= null;
    end creer_Liste;

    function vide(T: in TPtrCellule) return Boolean
        return (T = null);
    end vide;

    function ajout_Debut(T: in TPtrCellule; N: in Integer) return TPtrCellule
    	T:= new TCellule'(N, T);
    end ajout_Debut;

    function ajout_Fin(T: in TPtrCellule; N: Integer) return TPtrCellule
        if not vide(T) then
            ajout_Fin(suivant(T), N);
        else
            ajout_Debut(T, N);
        end if;
    end ajout_Fin;

    function longueur(T: in TPtrCellule) return Integer
        if not vide(T) then
            return (1 + longueur(suivant(T));
        else
            return 0;
        end if;
    end longueur;

    procedure affiche_Liste(T: in TPtrCellule)
        if not vide(T) then
            ecrire(valeur(T));
            return affiche_Liste(suivant(T));
        else
            return null;
        end if;
    end affiche_Liste;

    function valeur(T: in TPtrCellule) return TElem
        if not vide(T) then
            return T.val;
        else
            return null;
        end if;
    end valeur;

    function suivant(T: in TPtrCellule) return TPtrCellule
        if not vide(T) then
            return T.suiv;
        else
            return null;
      end if;
    end suivant;

    function copie(T: in TListeCouple) return TListeCouple
        l1: TListeCoupleNonVide := T;
        l2: TListeCoupleVide := creer_Liste();
        
        while not vide(l1) loop
            l2 := new TListeNonVide(valeur(l1));
            l1 := suivant(l1);
        end loop;
        
        return l2;
    end copie;

    function insert_Trie_Croissant(T: in out TPtrCellule; N: in TElem) return TPtrCellule
        if not vide(T) then
            if (not vide(suivant(T)) and then (superieur(N, valeur(suivant(T)))) then
                suivant(T) := insere_Trie_Croissant(suivant(T), N);
                return T;
            else
                suivant(T) := new TPtrCellule'(N, suivant(T));
                return T;
            end if;
        else
            return ajout_Debut(T, N);
        end if;
    end insere_Trie_Croissant;

    function listes_Egales(T1: in TPtrCellule; T2: in TPtrCellule) return Boolean
        if (not vide(T1)) and not (vide(T2)) then
            if (egaux(valeur(T1), valeur(T2)) then
                return listes_Egales(suivant(T1), suivant(T2));
            else
                return False;
            end if;
        else
            return (vide(T1) and vide(T2));
        end if;
    end listes_Egales;

    procedure supprimer(T: in out TPtrCellule, N: in TElem)
        if (not vide(T)) then 
            if egaux(valeur(T), N)
    		    then T:= suivant(T);
    		else 
    			supprimer(suivant(T), N);
    		end if;
    	end if;
    end supprimer;

end PListe_Gen;