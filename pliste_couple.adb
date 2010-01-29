--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_couple.adb

package body PListe_Couple is
    
    function nb_Total_Occurrence(T: in TListe_Couple) return Integer is
    begin
        if not vide(T) then
            return (occurrence(valeur_Couple(T)) + nb_Total_Occurrence(couple_Suivant(T)));
            -- le nombre d'occurrence, ce'st le nombre d'occurrence d'un couple + celui du reste de la liste
        else
            return 0;
        end if;
    end nb_Total_Occurrence;

    function moy_Occurrence(T: in TListe_Couple) return Float is
        L: TListe_Couple := T;
    begin
        return (float(nb_Total_Occurrence(T)) / float(nb_Mots_Differents(T)));
        -- On fait simplement le nombre total d'occurrences divisé par le nombre de mots différents
    end moy_Occurrence;

    function moy_Longueur(T: in TListe_Couple) return Float is
        long: integer := 0;
        L: TListe_Couple := T;
    begin
        while not vide(L) loop
            long := (long + longueur_Mot(mot_Couple(valeur_Couple(L))));
            L := suivant(L);
        end loop;
        -- On additionne la longueur des mots 
        -- (on ne prend pas en compte le nombre d'occurrence (pas de coef))
        
        return (float(long) / float(nb_Mots_Differents(T)));
        -- On divise par le nombre de mots différents
    end moy_Longueur;

    function present(T: in TListe_Couple; Mot: in TMot) return Boolean is
    begin
        if not vide(T) then
            -- On part à la recherche du mot perdu !
            if mots_Egaux(mot_Couple(valeur_Couple(T)), Mot) then
                return true;
                -- Ouf ! On l'a enfin retrouvé :)
            else
                return present(suivant(T), Mot);
                -- Encore une chance, voyons ce qu'il y a à la suite !
            end if;
        else
            return false;
            -- Pas trouvé :(
        end if;
    end present;
    
    function ajout_Couple(T: in TListe_Couple; Couple: in TCouple) return TListe_Couple is
        newCouple: TCouple;
        L: TListe_Couple := T;
    begin
        if not vide(T) then
            if present(T,  mot_Couple(Couple)) then
                -- Si on est sûr que le mot est là...
                while not couples_Egaux_Mot(valeur_Couple(L), Couple) loop
                    L := suivant(L);
                end loop;
                -- On l'a trouvé !
                
                newCouple := ajout_Occurrence(valeur_Couple(L), occurrence(Couple));
                -- On lui ajoute 1
                modif_Val(L, newCouple);
                -- et on l'affecte à la liste
                
                return T;
            else
                return insert_Croissant_Mot(T, Couple);
                -- Il est nouveau, on l'insert à sa place dans la liste
            end if;
        else
    	    return insert_Croissant_Mot(T, Couple);
    	    -- Il est tout neuf, on fait pareil
        end if;
    end ajout_Couple;
    
    function ajout_Mot(T: in TListe_Couple; Mot: in TMot) return TListe_Couple is
           Couple: TCouple := creer_Couple(Mot, 1);
       begin
          return ajout_Couple(T, Couple);
    end ajout_Mot;
    
    procedure affichage_Decroissant(T: in TListe_Couple; N: in Integer) is
    	L: TListe_Couple := tri_Decroissant_Occurrences(T);
    	I: Integer := 0;
	begin
    	affichage_N(L, N);
    end affichage_Decroissant;
    
    procedure affichage_N(T: in TListe_Couple; N: in Integer) is
    	L: TListe_Couple := T;
    	I: Integer := 0;
	begin
    	while (not vide(L) and then I < N) loop
    	    affiche_Couple(valeur_Couple(L));
    	    L := suivant(L);
    	    I := I + 1;
    	end loop;
    end affichage_N;

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
                return T;
            end if;
        else
            return T;
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
    
    -- les fonctions suivantes ont toutes le même fonctionnement
    function nb_Superieur(T: in TListe_Couple; N: in Integer) return Integer is
    begin
        if not vide(T) then
            -- Tant que c'est pas vide on regarde
            if (longueur_Mot(mot_Couple(valeur_Couple(T))) >= N) then
                return (1 + nb_Superieur(couple_Suivant(T), N));
                -- Si c'est bon, on ajoute un et on regarde la suite
            else
                return (nb_Superieur(couple_Suivant(T), N));
                -- Sinon, on passe juste à la suite
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
    
    function mots_En_Communs(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Couple is
        L: TListe_Couple := creer_Liste_Couple; -- ça sera notre liste qu'on renverra
        L1: TListe_Couple := T1; -- On fait une copie pour la parcourir sans problèmes
    begin
        -- Tant que la liste n'est pas vide
        while not liste_Couple_Vide(L1) loop
            -- Si le mot est aussi dans aussi dans l'autre liste...
            if present(T2, mot_Couple(valeur_Couple(L1))) then
                -- On l'ajoute dans la liste sans oublier de mettre les occurrences dans les 2 textes
                L := ajout_Couple(L, creer_Couple(mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))) + nb_Occurrences(T2, mot_Couple(valeur_Couple(L1)))));
            end if;
                
            L1 := couple_Suivant(L1);
        end loop;
        
        return L;
    end mots_En_Communs;

    function mots_Non_Communs(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Couple is
        L: TListe_Couple := creer_Liste_Couple; -- ça sera notre liste qu'on renverra
        L1: TListe_Couple := T1; -- On fait une copie pour la parcourir sans problèmes
    begin
        -- Tant que la liste n'est pas vide
        while not liste_Couple_Vide(L1) loop
            -- Si le mot est aussi dans aussi dans l'autre liste...
            if not present(T2, mot_Couple(valeur_Couple(L1))) then
                -- On l'ajoute dans la liste sans oublier de mettre les occurrences dans les 2 textes
                L := ajout_Couple(L, creer_Couple(mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))) + nb_Occurrences(T2, mot_Couple(valeur_Couple(L1)))));
            end if;
                
            L1 := couple_Suivant(L1);
        end loop;

	L1 := T2;
	while not liste_Couple_Vide(L1) loop
            -- Si le mot est aussi dans aussi dans l'autre liste...
            if not present(T1, mot_Couple(valeur_Couple(L1))) then
                -- On l'ajoute dans la liste sans oublier de mettre les occurrences dans les 2 textes
                L := ajout_Couple(L, creer_Couple(mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))) + nb_Occurrences(T2, mot_Couple(valeur_Couple(L1)))));
            end if;
                
            L1 := couple_Suivant(L1);
        end loop;
        
        return L;
    end mots_Non_Communs;
    
    -- Renames de fonctions génériques pour les utiliser, notamment dans les Unit Tests
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
    
    function nb_Mots_Differents(T: in TListe_Couple) return Integer is
    begin
        return longueur(T);
    end nb_Mots_Differents;
    
end PListe_Couple;
