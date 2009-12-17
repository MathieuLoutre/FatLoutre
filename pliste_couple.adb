package body PListe_Couple is
    
    function creer_Liste_Couple return TListe_Couple is
    begin
        return creer_Liste;
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
    
        return (float(nb) / float(nb_Mots_Differents(T)));
    end moy_Occurrence;


    function moy_Longueur(T: in TListe_Couple) return Float is
        long: integer := 0;
        L: TListe_Couple := T;
    begin
        while not vide(L) loop
            long := (long + longueur_Mot(mot_Couple(valeur_Couple(L))));
            L := suivant(L);
        end loop;
        
        return (float(long) / float(nb_Mots_Differents(T)));
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

    function present(T: in TListe_Couple; Mot: in TMot) return Boolean is
    begin
        if not vide(T) then
            if mots_Egaux(mot_Couple(valeur_Couple(T)), Mot) then
                return true;
            else
                return present(suivant(T), Mot);
            end if;
        else
            return false;
        end if;
    end present;
    
    function ajout_Mot(T: in TListe_Couple; Mot: in TMot) return TListe_Couple is
        Couple: TCouple;
        L: TListe_Couple := T;
    begin
        if not vide(T) then
            if present(T, Mot) then
                while not mots_Egaux(mot_Couple(valeur_Couple(L)), Mot) loop
                    L := suivant(L);
                end loop;
                
                Couple := ajout_Occurrence(valeur_Couple(L), 1);
                modif_Val(L, Couple);
                
                return T;
            else
                return insert_Croissant_Mot(T, creer_Couple(Mot, 1));
            end if;
        else
    	    return insert_Croissant_Mot(T, creer_Couple(Mot, 1));
        end if;
    end ajout_Mot;
    
    procedure affichage_Decroissant(T: in TListe_Couple; N: in Integer) is
    	L: TListe_Couple := tri_Decroissant_Occurrences(T);
    	I: Integer := 0;
	begin
    	while (not vide(L) and then I < N) loop
    	    affiche_Couple(valeur_Couple(L));
    	    L := suivant(L);
    	    I := I + 1;
    	end loop;
    end affichage_Decroissant;

    function fusion_Mots(T: in TListe_Couple; Mot1: in TMot; Mot2: in TMot) return TListe_Couple is
        L: TListe_Couple := T;
    begin
        if (not vide(T)) then
            if (present(T, Mot1) and present(T, Mot2)) then
                while not (mots_Egaux(mot_couple(valeur(L)), Mot1)) loop
                    L := suivant(L);
                end loop;
                
                modif_Val(L, ajout_Occurrence(valeur(L), nb_Occurrences(T, Mot2)));
                L := T;
                L := supprimer_Couple(L, creer_Couple(Mot2, 1));
                return L; 
            else
                return T;--put("YOU THOUGHT YOU WERE A CLEVER BASTERD");
            end if;
        else
            return T;--put("LISTE VIDE");
        end if;
    end fusion_Mots;

    function tri_Decroissant_Occurrences(T: in TListe_Couple) return TListe_Couple is
        L: TListe_Couple;
        K: TListe_Couple := T;
    begin
        L := creer_Liste_Couple;
        
        while not vide(K) loop
            L := insert_Decroissant_Occurrences(L, valeur_Couple(K));
            K := suivant(K);
        end loop;
            
        return L;
    end tri_Decroissant_Occurrences;

end PListe_Couple;