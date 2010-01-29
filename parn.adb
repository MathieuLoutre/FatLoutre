--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_gen.adb

package body PARN is

    function creer_ARN return TARN is
    begin
	return null;
    -- null équivaut à l'ARN vide
    end creer_ARN;

    function est_Racine(T: in TARN) return boolean is
    begin
	if not arn_Vide(T) then
	    return couples_Egaux_Mot(valeur(pere(T)), valeur(T));
	else
	    return false;
	end if;
    end est_Racine;

    function nb_Noeuds(T: in TARN) return Integer is
    begin
        if not arn_Vide(T) then
	    return 1 + nb_Noeuds(fils_Gch(T)) + nb_Noeuds(fils_Drt(T)); -- Ajoute 1 à chaque noeud non vide rencontrée
	else
	    return 0;
	end if;
    end nb_Noeuds;

    function frere(T : TARN) return TARN is
    begin
	if not arn_Vide(T) then
	    if not arn_Vide(pere(T)) then
		if couple_Inferieur_Mot(valeur(T), valeur(pere(T))) then -- Si le T donné est inferieur au pere, renvoit le fils Droit
		    return fils_Drt(pere(T));					-- s'il est supérieur renvoit le fils gauche
		else
		    return fils_Gch(pere(T));
		end if;
	    else
		return null;
	    end if;
	else
	    return null;
	end if;
    end frere;

    function oncle (T: in TARN) return TARN is
    begin
	if not arn_Vide(pere(T)) and then not arn_Vide(pere(pere(T))) then
	    if couple_Inferieur_Mot(valeur(pere(T)), valeur(pere(pere(T)))) then
		return fils_Drt(pere(pere(T)));
	    else
		return fils_Gch(pere(pere(T)));
	    end if;
	else
	    return null;
	end if;
    end oncle;

    function est_Fils_Droit(T: in TARN) return Boolean is
    begin
	if not arn_Vide(T) then
	    if not arn_Vide(pere(T)) then
		return couple_Inferieur_Mot(valeur(T), valeur(pere(T))); -- Si le T donné est superieur au pere, renvoit vrai
	    else								-- renvoit faux sinon
		return false;
	    end if;
	else
	    return false;
	end if;
    end est_Fils_Droit;

    function hauteur(T: in TARN) return Integer is
    begin
	if not arn_Vide(T) then
	    if hauteur(fils_Gch(T)) > hauteur(fils_Drt(T)) then
		return 1 + hauteur(fils_Gch(T));
	    else
		return 1 + hauteur(fils_Drt(T));
	    end if;
	else
	    return 0;
	end if;
    end hauteur;

    function arn_Vide(T: in TARN) return Boolean is
    begin
	return (T = null);
    end arn_Vide;

    function valeur(T: in TARN) return TCouple is
    begin
	return T.val;
    end valeur;

    function fils_Gch(T: in TARN) return TARN is
    begin
	return T.fgch;
    end fils_Gch;

    function fils_Drt(T: in TARN) return TARN is
    begin
	if not arn_Vide(T) then
	    return T.fdrt;
	else
	    return null;
	end if;
    end fils_Drt;

    function pere(T: in TARN) return TARN is
    begin
	if not arn_Vide(T) then
	    return T.pere;
	else
	    return null;
	end if;
    end pere;
    
    procedure modif_Val(T: in out TARN; N: in TCouple) is
    begin
        T.val := N;
        -- Sorte d'accesseur pour la valeur de T. Affecte un TElem.
    end modif_Val;
	
    procedure affiche_ARN(T : in TARN; N: Integer) is
    L: TListe_Couple;
    begin
	arnToListe(T, L); -- Traduit l'arbre en liste
	affichage_Decroissant(L, N); -- Affiche la liste
    end affiche_ARN;

    function fusion_Mots_ARN(T: in TARN; Mot1: in TMot; Mot2: in TMot) return TARN is
    L: TARN := T;
    begin
	if (not arn_Vide(L)) then
            if (present_ARN(L, Mot1) and present_ARN(L, Mot2)) then
		modif_Val(L, ajout_Occurrence(valeur(chercher_Noeud(L, Mot1)), nb_Occurrences_ARN(L, Mot2))); -- Ajoute les occurences du mot2 au mot1
		return supprimer_Elem(L, valeur(chercher_Noeud(L, Mot2))); -- Supprime le mot2
	    else
		return L;
	    end if;
	else
	    return L;
	end if;
    end fusion_Mots_ARN;

    function chercher_Noeud(T: in TARN; M: TMot) return TARN is
    begin
	if not arn_Vide(T) then
	    if mots_Egaux(mot_Couple(valeur(T)), M) then
		return T;
	    else
		if not arn_Vide(chercher_Noeud(fils_Gch(T), M)) then
		    return chercher_Noeud(fils_Gch(T), M);
		else
		    return chercher_Noeud(fils_Drt(T), M);
		end if;
	    end if;
	else
	    return null;
	end if;
    end chercher_Noeud;

    function ajout_Elem(T: in TARN; N: in TCouple) return TARN is
    L: TARN;
    begin
	if arn_Vide(T) then
	    L := new TCellule'(N, null, null, null); -- Si l'ARN est vide, creer une cellule avec le TCouple passé en parametre
	    L.pere := L;				-- on boucle sur le pere car c'est la racine
	    return L;
	else
	    if couples_Egaux_Mot(valeur(T), N) then
		T.val := ajout_Occurrence(valeur(T), 1);
	    elsif couple_Inferieur_Mot(N, valeur(T)) then
		if arn_Vide(fils_Gch(T)) then
		    T.fgch := new TCellule'(N, null, null, T);
		else
		    T.fgch := ajout_Elem(fils_Gch(T), N);
		end if;
	    else
		if arn_Vide(fils_Drt(T)) then
		    T.fdrt := new TCellule'(N, null, null, T);
		else
		    T.fdrt := ajout_Elem(fils_Drt(T), N);
		end if;
	    end if;
	    return T;
	end if;
    end ajout_Elem;

    function ajout_Mot_ARN(T: in TARN; M: in TMot) return TARN is
    begin
        return ajout_Elem(T, creer_Couple(M, 1));
    end ajout_Mot_ARN;
    
    function ChercheSupprimeFilsMin(T: TARN) return TCouple is
    --T est non vide;
    --Lors de l'appel T est testé et est un fils gauche.
    begin
	if arn_Vide(fils_Gch(T)) then
	    if arn_Vide(fils_Drt(T)) then
		if est_Fils_Droit(T) then
		    T.pere.fdrt := creer_ARN;
		    T.pere.fdrt := pere(T);
		    T.pere := null;
		else
		    T.pere.fgch := creer_ARN;
		    T.pere.fgch := pere(T);
		end if;
	    else
		if Est_Fils_Droit(T) then
		    T.pere.fdrt := T.fdrt;
		    T.pere.fdrt := pere(T);
		else
		    T.pere.fgch := fils_Drt(T);
		    T.pere.fgch := pere(T);
		end if;
	    end if;
	    T.pere := null;
	    return valeur(T);
	else
	    return ChercheSupprimeFilsMin(fils_Gch(T));
	end if;
    end ChercheSupprimeFilsMin;

    function supprimer_Elem(T: in TARN; N: in TCouple) return TARN is
    begin
	if arn_Vide(T) then
	    return T;
	else
	    if couples_Egaux_Mot(N, valeur(T)) then -- Si l'element courant est l'element a supprimer
		if arn_Vide(fils_Drt(T)) then
		    if arn_Vide(fils_Gch(T)) then
			return creer_ARN; -- Si ces 2 Fils sont vide alors on le mets à vide également
		    else
			return fils_Gch(T); -- Si seulement son fils droit est vide, on le remplace par son fils gauche
		    end if;
		else
		    T.val := ChercheSupprimeFilsMin(fils_Drt(T)); -- sinon on le remplace par le Min des Max
		    return T;
		end if;
	    else
		if mot_Superieur(mot_Couple(valeur(T)), mot_Couple(N)) then -- S'il ne sont pas egaux on cherche à gauche
		    T.fgch := supprimer_Elem(fils_Gch(T), N);
		    if not arn_vide(T.fgch) then
		        T.fgch.pere := T;
		    end if;
		else							-- et à droite
		    T.fdrt := supprimer_Elem(fils_Drt(T), N);
		    if not arn_vide(T.fdrt) then
		        T.fdrt.pere := T;
		    end if;
		end if;
		return T;
	    end if;
	end if;
    end supprimer_Elem;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

    function nb_Occurrences_ARN(T: TARN; Mot: TMot) return Integer is
    begin
        if not arn_Vide(T) then
            if mots_Egaux(Mot, mot_Couple(valeur(T))) then
                return (occurrence(valeur(T)));
            else
                return (nb_Occurrences_ARN(fils_Gch(T), Mot) + nb_Occurrences_ARN(fils_Drt(T), Mot));
            end if;
        else
            return 0;
        end if;
    end nb_Occurrences_ARN;

    function nb_Prefixe_ARN(T: in TARN; Mot: in TMot) return Integer is
    begin
        if not arn_Vide(T) then
            if (prefixe(mot_Couple(valeur(T)), Mot)) then
                return (occurrence(valeur(T)) + nb_Prefixe_ARN(fils_Gch(T), Mot) + nb_Prefixe_ARN(fils_Drt(T), Mot));
            else
                return (nb_Prefixe_ARN(fils_Gch(T), Mot) + nb_Prefixe_ARN(fils_Drt(T), Mot));
            end if;
        else
            return 0;
        end if;
    end nb_Prefixe_ARN;

    function nb_Suffixe_ARN(T: in TARN; Mot: in TMot) return Integer is
    begin
        if not arn_Vide(T) then    
            if (suffixe(mot_Couple(valeur(T)), Mot)) then
                return (occurrence(valeur(T)) + nb_Suffixe_ARN(fils_Gch(T), Mot) + nb_Suffixe_ARN(fils_Drt(T), Mot));
            else
                return (nb_Suffixe_ARN(fils_Gch(T), Mot) + nb_Suffixe_ARN(fils_Drt(T), Mot));
            end if;
        else
            return 0;
      end if;
    end nb_Suffixe_ARN;

    function nb_Facteur_ARN(T: in TARN; Mot: in TMot) return Integer is
    begin
        if not arn_Vide(T) then
            if facteur(mot_Couple(valeur(T)), Mot) then
                return (occurrence(valeur(T)) + nb_Facteur_ARN(fils_Gch(T), Mot) + nb_Facteur_ARN(fils_Drt(T), Mot));
            else
                return (nb_Facteur_ARN(fils_Gch(T), Mot) + nb_Facteur_ARN(fils_Drt(T), Mot));
            end if;
        else
            return 0;
      end if;
    end nb_Facteur_ARN;

    function moy_Occurrence_ARN(T: in TARN) return Float is
        L: TARN := T;
    begin
        return (float(nb_Total_Occurrence_ARN(T)) / float(nb_Noeuds(T)));
        -- On fait simplement le nombre total d'occurrences divisé par le nombre de mots différents
    end moy_Occurrence_ARN;

    function tot_Longueur_ARN(T: in TARN) return Float is
    begin
        if not arn_Vide(T) then
            return (float(longueur_Mot(mot_Couple(valeur_Couple(T)))) + tot_Longueur_ARN(fils_Drt(T)) + tot_Longueur_ARN(fils_Gch(T)));
	else
	    return 0.0;
        end if;
        -- On additionne la longueur des mots 
        -- (on ne prend pas en compte le nombre d'occurrence (pas de coef))
    end tot_Longueur_ARN;

    function moy_Longueur_ARN(T: in TARN) return Float is
    begin
        return (float(tot_Longueur_ARN(T) / float(nb_Noeuds(T))));
        -- On divise par le nombre de mots différents
    end moy_Longueur_ARN;

    function nb_Superieur_ARN(T: in TARN; N: in Integer) return Integer is
    begin
        if not arn_Vide(T) then
            -- Tant que c'est pas vide on regarde
            if (longueur_Mot(mot_Couple(valeur_Couple(T))) >= N) then
                return (1 + nb_Superieur_ARN(fils_Drt(T), N) + nb_Superieur_ARN(fils_Gch(T), N));
                -- Si c'est bon, on ajoute un et on regarde la suite
            else
                return nb_Superieur_ARN(fils_Drt(T), N) + nb_Superieur_ARN(fils_Gch(T), N);
                -- Sinon, on passe juste à la suite
            end if;
        else
            return 0;
        end if;
    end nb_Superieur_ARN;

    function present_ARN(T: in TARN; Mot: in TMot) return Boolean is
    begin
        if not arn_Vide(T) then
            -- On part à la recherche du mot perdu !
            if mots_Egaux(mot_Couple(valeur_Couple(T)), Mot) then
                return true;
                -- Ouf ! On l'a enfin retrouvé :)
            else
                return present_ARN(fils_Drt(T), Mot) or present_ARN(fils_Gch(T), Mot);
                -- Encore une chance, voyons ce qu'il y a à la suite !
            end if;
        else
            return false;
            -- Pas trouvé :(
        end if;
    end present_ARN;

    function valeur_Couple(T: in TARN) return TCouple is
    begin
        return valeur(T);
    end valeur_Couple;

    function nb_Total_Occurrence_ARN(T: in TARN) return Integer is
    begin
        if not arn_Vide(T) then
            return (occurrence(valeur_Couple(T)) + nb_Total_Occurrence_ARN(fils_Drt(T)) + nb_Total_Occurrence_ARN(fils_Gch(T)));
            -- le nombre d'occurrence, ce'st le nombre d'occurrence d'un couple + celui du reste de la liste
        else
            return 0;
        end if;
    end nb_Total_Occurrence_ARN;

    procedure arnToListe(T: in TARN; L: in out TListe_Couple) is
    begin
	if not arn_Vide(T) then
	    L := insert_Decroissant_Occurrences(L, valeur(T)); -- insert le noeud courant dans la liste
	    arnToListe(fils_Gch(T), L); -- apelle la fonction en récursif pour le sous-arbre gauche
	    arnToListe(fils_Drt(T), L);-- apelle la fonction en récursif pour le sous-arbre gauche
	end if;
    end arnToListe;

end PARN;