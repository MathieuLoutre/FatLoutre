--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_trio.adb
--
-- La liste de Trio est une structure similaire à la liste de couple, mais avec des Trios.
-- Elle permet alors de stocker les informations de 2 listes distinctes.
-- Elle comporte aussi moins de fonctions car on a moins de travail à effectuer dessus.

package body PListe_Trio is
    
    -- Est un copié collé de la fonction de présence de pliste couple, mais pour les Trios
    -- Faire un générique ?
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
    
    -- Permet de récupérer le Trio qui contient le mot passé en paramètre
    function recupere_Trio(T: TListe_Trio; Mot: TMot) return TTrio is
    begin
        if mots_Egaux(Mot, mot_Trio(valeur_Trio(T))) then
            -- Si c'est lui, on retourne le trio
            return valeur_Trio(T);
        else
            return (recupere_Trio(trio_Suivant(T), Mot));
            -- Sinon, on cherche encore...
        end if;
    end recupere_Trio;
    
    -- Retourne une liste de Trios qui comporte tout les mots qui sont à la fois 
    -- dans la liste de couple 1 et dans la liste de couple 2.
    function mots_Communs(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio is
        L: TListe_Trio := creer_Liste_Trio; -- ça sera notre liste qu'on renverra
        L1: TListe_Couple := T1; -- On fait une copie pour la parcourir sans problèmes
    begin
        -- Tant que la liste n'est pas vide
        while not liste_Couple_Vide(L1) loop
            -- Si le mot est aussi dans aussi dans l'autre liste...
            if present(T2, mot_Couple(valeur_Couple(L1))) then
                -- On l'ajoute dans la liste sans oublier de mettre les occurrences dans les 2 textes
                L := ajout_Trio(L, mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L1))));
            end if;
                
            L1 := couple_Suivant(L1);
        end loop;
        
        return L;
    end mots_Communs;
    
    -- Retourne une liste de trios contenant les mots apparaissant dans une liste et pas dans l'autre
    function mots_Differents(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio is
        L: TListe_Trio := creer_Liste_Trio;
        L1: TListe_Couple := T1;
        L2: TListe_Couple := T2;
    begin
        while not liste_Couple_Vide(L1) loop
            -- Si il n'est pas dans l'autre liste...
            if not present(T2,  mot_Couple(valeur_Couple(L1))) then
                -- On l'ajoute :) (une des 2 occurrences sera à 0)
                L := ajout_Trio(L, mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L1))));
            end if;
            
            L1 := couple_Suivant(L1);
        end loop;
        
        -- Même chose ici, mais pour l'autre liste
        while not liste_Couple_Vide(L2) loop
            if not present(T1,  mot_Couple(valeur_Couple(L2))) then
                L := ajout_Trio(L, mot_Couple(valeur_Couple(L2)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L2))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L2))));
            end if;
            
            L2 := couple_Suivant(L2);
        end loop;
        
        return L;
    end mots_Differents;
    
    -- Retourne une liste de trios contenant les éléments des 2 listes. 
    function fusion_Listes(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio is
	    L: TListe_Trio := creer_Liste_Trio;	        
	    L1: TListe_Couple := T1;
        L2: TListe_Couple := T2;
    begin
        -- On parcours toute la liste en créant les trios et en les ajoutants
	    while not liste_Couple_Vide(L1) loop
            L := ajout_Trio(L, mot_Couple(valeur_Couple(L1)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L1))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L1))));
            L1 := couple_Suivant(L1);
        end loop;	
	    
	    -- On fait la même chose ici
	    -- Les mots qui sont déjà présent ne seront pas ajouté par Ajout_Trio
        while not liste_Couple_Vide(L2) loop
            L := ajout_Trio(L, mot_Couple(valeur_Couple(L2)), nb_Occurrences(T1, mot_Couple(valeur_Couple(L2))), nb_Occurrences(T2, mot_Couple(valeur_Couple(L2))));
            L2 := couple_Suivant(L2);
        end loop;
        
        return L;
    end fusion_Listes;
    
    -- Retourne une liste de Trio avec un trio créé avec les paramètres donné. Il sera inséré à sa place dans la liste.
    function ajout_Trio(T: in TListe_Trio; Mot: in TMot; nbOccurTexte1: in Integer; nbOccurTexte2: in Integer) return TListe_Trio is
        newTrio: TTrio;
        L: TListe_Trio := T;
    begin
        if not present_Trio(T, Mot) then
            -- Si l'élément n'est pas déjà là, on peut ajouter l'élément 
            newTrio := creer_Trio(Mot, nbOccurTexte1, nbOccurTexte2);
            return insert_Croissant_Mot(T, newTrio);
        else -- Si l'élément est déjà là, on ne fait rien car on s'en sera déjà occupé.
            return T;
        end if;
    end ajout_Trio;
    
    -- Renames de fonctions génériques pour les utiliser, notamment dans les Unit Tests
    function creer_Liste_Trio return TListe_Trio is
    begin
        return creer_Liste;
    end creer_Liste_Trio;
    
    procedure affiche_Liste_Trio(T: in TListe_Trio) is
    begin
        affiche_Liste(T);
    end affiche_Liste_Trio;
    
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
