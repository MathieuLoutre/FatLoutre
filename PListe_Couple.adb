package body PListe_Couple is

    function nb_Total_Occurrence(T: in TListe_Couple) return Integer
        if not vide(T) then
            return (occurrence(valeur(T)) + nb_Total_Mots(suivant(T)));
        else
            return 0;
        end if;
    end nb_Total_Occurrence;

    function nb_Mots_Differents(T: in TListe_Couple) return Integer
        return longueur(T);
    end nb_Mots_Differents;

    function moy_Occurrence(T: in TListe_Couple) return Integer
        nb: integer := 0;
    
        while not vide(T) loop
            nb := (nb + occurrence(valeur(T)));
            suivant(T);
        end loop;
    
        return (nb / nb_Mots_Differents(T));
    end moy_Occur;

    function moy_Longueur(T: in TListe_Couple) return Integer
        long: integer := 0;
      
        while not vide(T) loop
            long := (long + longueur(mot(valeur(T))));
            T := suivant(T);
        end loop;
        
        return (long / nb_Total_Mots(T));
    end moy_Longueur;

    function nb_Superieur(T: in TListe_Couple; N: in Integer) return Integer
        if not vide(T) then
            if (longueur(mot(valeur(T))) >= N) then
                return (1 + nb_Superieur(suivant(T)));
            else
                return (nb_Superieur(suivant(T)));
            end if;
        else
            return 0;
        end if;
    end nb_Superieur;

    function nb_Occurrences(T: in TListe_Couple; Mot: in TMot) return Integer
        if not vide(T) then
            if mots_egaux(Mot, mot(valeur(T))) then
                return (ocurrence(valeur(T)));
            end if;
        else
            return (nb_Occurrences(suivant(T), Mot));
        end if;
    end nb_Occurrences;

    function nb_Prefixe(T: in TListe_Couple; Mot: in TMot) return Int
        if not vide(T) then
            if (prefixe(mot(valeur(T)), Mot)) then
                return (occurrence(valeur(T)) + nb_Prefixe(suivant(T), Mot);
            else
                return (nb_Prefixe(suivant(T), Mot);
            end if;
        else
            return 0;
        end if;
    end nb_Prefixe;

    function nb_Suffixe(T: in TListe_Couple; Mot: in TMot) return Int
        if not vide(T) then
            if (suffixe(mot(valeur(T)), Mot)) then
                return (occurrence(valeur(T)) + nb_Suffixe(suivant(T), Mot);
            else
                return (nb_Suffixe(suivant(T), Mot);
            end if;
        else
            return 0;
      end if;
    end nb_Suffixe;

    function nb_Facteur(T: in TListe_Couple; Mot: in TMot) return Int
        if not vide(T) then
            if facteur(mot(valeur(T)), Mot) then
                return (occurrence(valeur(T)) + nb_Facteur(suivant(T), Mot));
            else
                return (nb_Facteur(suivant(T), Mot))
            end if;
        else
            return 0;
      end if;
    end nb_Facteur;

    procedure gen_Fichier(T: in TListe_Couple) return TFichier
        F: TFichier := new_Fichier();
        L: TListe_Couple := T;
        
        while not vide(T) loop
            ecrire_ligne(F, valeur(L));
            L := suivant(L);
        end loop;
            
        return F;
    end gen_Fichier;

    procedure ajout_mot(T: in TListe_Couple, Mot: in TMot)
        if not vide(T) then
            if (couples_egaux(valeur(T)), Mot)) then
                ajout_Occurrence(valeur(T), 1);
            else
                ajout_mot(suivant(T), Mot);
            end if;
        else
            Couple := new TCouple(Mot, 1); 
    	    insert_Trie_Croissant(T, Couple);
        end if;
    end ajout_mot;

    procedure affichage_Decroissant(T: in TListe_Couple; N: in Integer)
    	L: TListe_Couple := tri_Decroissant_Occurrences(T);
    	I: Integer := 0;
	
    	while (not vide(T) and then I < N) loop
    	    affiche_Couple(val(T));
    	    I := I + 1;
    	end loop;
    end affichage_Decroissant;

    fusion_Couples(T: in TListe_Couple; Mot1: in TMot; Mot2: in TMot)
        null;
    end fusion_Couples;

    tri_Decroissant_Occurrences(T: in TListe_Couple) return TListe_Couple
            	-- Retourne la liste de couple triée sur le nombre d'occurrences de manière croissante
            	null;
    end tri_Decroissant_Occurrences;

end PListe_Couple;