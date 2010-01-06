--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_trio.adb

package body PListe_Trio is
    
    function present_Trio(T: in TListe_Trio; Mot: in TMot) return Boolean is
    begin
        if not liste_Trio_Vide(T) then
            -- On part à la recherche du mot perdu !
            if mots_Egaux(mot_Trio(valeur_Trio(T)), Mot) then
                return true;
                -- Ouf ! On l'a enfin retrouvé :)
            else
                return present_Trio(trio_Suivant(T), Mot);
                -- Encore une chance, voyons ce qu'il y a à la suite !
            end if;
        else
            return false;
            -- Pas trouvé :(
        end if;
    end present_Trio;
    
    function recupere_Trio(T: TListe_Trio; Mot: TMot) return TTrio is
    begin
        if mots_Egaux(Mot, mot_Trio(valeur_Trio(T))) then
            return valeur_Trio(T);
        else
            return (recupere_Trio(trio_Suivant(T), Mot));
        end if;
    end recupere_Trio;
    
    function mots_Communs(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio is
        L: TListe_Trio := creer_Liste_Trio;
        L1: TListe_Couple := T1;
    begin
        while not liste_Couple_Vide(L1) loop
            if present(T2,  mot_Couple(valeur_Couple(L1))) then
                L := ajout_Trio(L, mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L1))));
            end if;
                
            L1 := couple_Suivant(L1);
        end loop;
        
        return L;
    end mots_Communs;
    
    function mots_Differents(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio is
        L: TListe_Trio := creer_Liste_Trio;
        L1: TListe_Couple := T1;
        L2: TListe_Couple := T2;
    begin
        while not liste_Couple_Vide(L1) loop
            if not present(T2,  mot_Couple(valeur_Couple(L1))) then
                L := ajout_Trio(L, mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L1))));
            end if;
            
            L1 := couple_Suivant(L1);
        end loop;
            
        while not liste_Couple_Vide(L2) loop
            if not present(T1,  mot_Couple(valeur_Couple(L2))) then
                L := ajout_Trio(L, mot_Couple(valeur_Couple(L2)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L2))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L2))));
            end if;
            
            L2 := couple_Suivant(L2);
        end loop;
        
        return L;
    end mots_Differents;
    
    function fusion_Listes(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio is
	    L: TListe_Trio := creer_Liste_Trio;	        
	    L1: TListe_Couple := T1;
        L2: TListe_Couple := T2;
    begin
	    while not liste_Couple_Vide(L1) loop
            L := ajout_Trio(L, mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L1))));
            L1 := couple_Suivant(L1);
        end loop;	
	
        while not liste_Couple_Vide(L2) loop
            L := ajout_Trio(L, mot_Couple(valeur_Couple(L2)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L2))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L2))));
            L2 := couple_Suivant(L2);
        end loop;
        
        return L;
    end fusion_Listes;
    
    function ajout_Trio(T: in TListe_Trio; Mot: in TMot; nbOccurTexte1: in Integer; nbOccurTexte2: in Integer) return TListe_Trio is
        newTrio: TTrio;
        L: TListe_Trio := T;
    begin
        if not present_Trio(T, Mot) then
            -- Si l'élément n'est pas déjà là, on peut ajouter l'élément :)
            newTrio := creer_Trio(Mot, nbOccurTexte1, nbOccurTexte2);
            return insert_Croissant_Mot(T, newTrio);
        else -- Si l'élément est déjà là, on ne fait rien.
            return T;
        end if;
    end ajout_Trio;
    
    procedure affiche_Liste_Trio(T: in TListe_Trio) is
    begin
        affiche_Liste(T);
    end affiche_Liste_Trio;
    
    -- Renames de fonctions génériques pour les utiliser, notamment dans les Unit Tests
    function creer_Liste_Trio return TListe_Trio is
    begin
        return creer_Liste;
    end creer_Liste_Trio;
    
    function liste_Trio_Vide(T: in TListe_Trio) return Boolean is
    begin
        return vide(T);
    end liste_Trio_Vide;
    
    function valeur_Trio(T: in TListe_Trio) return TTrio is
    begin
        return valeur(T);
    end valeur_Trio;

    function trio_Suivant(T: in TListe_Trio) return TListe_Trio is
    begin
        return suivant(T);
    end trio_Suivant;
    
    function nb_Mots_Differents_Trio(T: in TListe_Trio) return Integer is
    begin
        return longueur(T);
    end nb_Mots_Differents_Trio;
    
end PListe_Trio;
