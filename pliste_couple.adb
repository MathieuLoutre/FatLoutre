package body PListe_Couple is
    
    procedure creer_Liste_Couple is
    begin
        return creer_Liste(T);
    end creer_Liste_Couple;
    
    function liste_Couple_Vide(T: in TListe_Couple) return Boolean is
    begin
        return vide(T);
    end liste_Couple_Vide;
    
    function valeur_Couple(T: in TListe_Couple) return TCouple is
    begin
        return valeur(T);
    end valeur_Couple;

    function couple_Suivant(T: in TListe_Couple) return TListe_Couple is
    begin
        return suivant(T);
    end couple_Suivant;
    
    function nb_Total_Occurrence(T: in TListe_Couple) return Integer is
    begin
        if not vide(T) then
            return (occurrence(valeur_Couple(T)) + nb_Total_Occurrence(couple_Suivant(T)));
        else
            return 0;
        end if;
    end nb_Total_Occurrence;

    function nb_Mots_Differents(T: in TListe_Couple) return Integer is
    begin
        return longueur(T);
    end nb_Mots_Differents;

    function moy_Occurrence(T: in TListe_Couple) return Float is
        nb: integer := 0;
        L: TListe_Couple := T;
    begin
        while not vide(L) loop
            nb := (nb + occurrence(valeur_Couple(T)));
            L := suivant(L);
        end loop;
    
        return float((nb / nb_Mots_Differents(T)));
    end moy_Occurrence;

    function moy_Longueur(T: in TListe_Couple) return Float is
        long: integer := 0;
        L: TListe_Couple := T;
    begin
        while not vide(T) loop
            long := (long + longueur_Mot(mot_Couple(valeur_Couple(L))));
            L := suivant(L);
        end loop;
        
        return float((long / nb_Total_Occurrence(T)));
    end moy_Longueur;

    function nb_Superieur(T: in TListe_Couple; N: in Integer) return Integer is
    begin
        if not vide(T) then
            if (longueur_Mot(mot_Couple(valeur_Couple(T))) >= N) then
                return (1 + nb_Superieur(couple_Suivant(T), N));
            else
                return (nb_Superieur(couple_Suivant(T), N));
            end if;
        else
            return 0;
        end if;
    end nb_Superieur;

    function nb_Occurrences(T: in TListe_Couple; Mot: in TMot) return Integer is
    begin
        if not vide(T) then
            if mots_Egaux(Mot, mot_Couple(valeur_Couple(T))) then
                return (occurrence(valeur_Couple(T)));
            else
                return (nb_Occurrences(couple_Suivant(T), Mot));
            end if;
        else
            return 0;
        end if;
    end nb_Occurrences;

    function nb_Prefixe(T: in TListe_Couple; Mot: in TMot) return Integer is
    begin
        if not vide(T) then
            if (prefixe(mot_Couple(valeur_Couple(T)), Mot)) then
                return (occurrence(valeur_Couple(T)) + nb_Prefixe(couple_Suivant(T), Mot));
            else
                return (nb_Prefixe(couple_Suivant(T), Mot));
            end if;
        else
            return 0;
        end if;
    end nb_Prefixe;

    function nb_Suffixe(T: in TListe_Couple; Mot: in TMot) return Integer is
    begin
        if not vide(T) then    
            if (suffixe(mot_Couple(valeur_Couple(T)), Mot)) then
                return (occurrence(valeur_Couple(T)) + nb_Suffixe(couple_Suivant(T), Mot));
            else
                return (nb_Suffixe(couple_Suivant(T), Mot));
            end if;
        else
            return 0;
      end if;
    end nb_Suffixe;

    function nb_Facteur(T: in TListe_Couple; Mot: in TMot) return Integer is
    begin
        if not vide(T) then
            if facteur(mot_Couple(valeur_Couple(T)), Mot) then
                return (occurrence(valeur_Couple(T)) + nb_Facteur(couple_Suivant(T), Mot));
            else
                return (nb_Facteur(couple_Suivant(T), Mot));
            end if;
        else
            return 0;
      end if;
    end nb_Facteur;

    function ajout_Mot(T: in TListe_Couple; Mot: in TMot) return TListe_Couple is
        Couple: TCouple;
    begin
        if not vide(T) then
            if mots_Egaux(mot_Couple(valeur_Couple(T)), Mot) then
                Couple := valeur_Couple(T);
                ajout_Occurrence(Couple, 1);
                return T;
            else
                return ajout_Mot(couple_Suivant(T), Mot);
            end if;
        else
            Couple := creer_Couple(Mot, 1);
    	    insert_Trie_Croissant(T, Couple);
    	    return T;
        end if;
    end ajout_Mot;

    procedure affichage_Decroissant(T: in TListe_Couple; N: in Integer) is
    	L: TListe_Couple := tri_Decroissant_Occurrences(T);
    	I: Integer := 0;
	begin
    	while (not vide(T) and then I < N) loop
    	    affiche_Couple(valeur_Couple(T));
    	    I := I + 1;
    	end loop;
    end affichage_Decroissant;

    procedure fusion_Couples(T: in TListe_Couple; Couple1: in TCouple; Couple2: in TCouple) is
    begin
        null;
    end fusion_Couples;

    function tri_Decroissant_Occurrences(T: in TListe_Couple) return TListe_Couple is
        L: TListe_Couple;
    begin
        -- Retourne la liste de couple triée sur le nombre d'occurrences de manière croissante
        creer_Liste_Couple(L);
        return L;
    end tri_Decroissant_Occurrences;

end PListe_Couple;