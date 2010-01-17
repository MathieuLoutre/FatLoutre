--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_gen.adb

package body ARN_Gen is

    function creer_ARN return TPtrCellule is
    begin
	return null;
    -- null équivaut à l'ARN vide
    end creer_ARN;

    function est_Racine(T: in TPtrCellule) return boolean is
    begin
	if not vide(T) then
	    return vide(pere(T));
	else
	    return null;
	end if;
    end est_Racine;

    procedure change_Couleur(T: in TPtrCellule) is
    begin
	if not vide(T) then
	    if valeur(T) then
		T.val := false;
	    else
		T.val := true;
	    end if;
	else
	    return null;
	end if;
    end change_Couleur;

    function frere(T : TPtrCellule) return TPtrCellule is
    begin
	if not vide(T) then
	    if not vide(pere(T)) then
		if valeur(T) < valeur(pere(T)) then
		    return fils_Drt(pere(T));
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

    function oncle (T: in TPtrCellule) return TPtrCellule is
    begin
	if not vide(pere(T)) and then not vide(pere(pere(T))) then
	    if valeur(pere(T)) < valeur(pere(pere(T))) then
		return fils_Drt(pere(pere(T)));
	    else
		return fils_Gch(pere(pere(T)));
	    end if;
	else
	    return null;
	end if;
    end oncle;

    function est_Fils_Droit(T: in TPtrCellule) return Boolean is
    begin
	if not vide(T) then
	    if not vide(pere(T)) then
		return valeur(T) > valeur(pere(T));
	    else
		return null;
	    end if;
	else
	    return null;
	end if;
    end est_Fils_Droit;

    function hauteur(T: in TPtrCellule) return Integer is
    begin
	if not vide(T) then
	    if hauteur(fils_Gch(T)) > hauteur(fils_Drt(T)) then
		return 1 + hauteur(fils_Gch(T));
	    else
		return 1 + hauteur(fils_Drt(T));
	    end if;
	else
	    return 0;
	end if;
    end hauteur;

    function vide(T: in TPtrCellule) return Boolean is
    begin
	return (T = null);
    end vide;

    function couleur(T: in TPtrCellule) return TElem is
    begin
	if not vide(T) then
	    return T.coul;
	else
	    return null;
	end if;
    end couleur;

    function valeur(T: in TPtrCellule) return TElem is
    begin
	if not vide(T) then
	    return T.val;
	else
	    return null;
	end if;
    end valeur;

    function fils_Gch(T: in TPtrCellule) return TPtrCellule is
    begin
	if not vide(T) then
	    return T.fgch;
	else
	    return null;
	end if;
    end fils_Gch;

    function fils_Drt(T: in TPtrCellule) return TPtrCellule is
    begin
	if not vide(T) then
	    return T.fdrt;
	else
	    return null;
	end if;
    end fils_Drt;

    function pere(T: in TPtrCellule) return TPtrCellule is
    begin
	if not vide(T) then
	    return T.pere;
	else
	    return null;
	end if;
    end pere;
    
    procedure modif_Val(T: in out TPtrCellule; N: in TElem) is
    begin
        T.val := N;
        -- Sorte d'accesseur pour la valeur de T. Affecte un TElem.
    end modif_Val;

    procedure affiche_ARN (T: in TPtrCellule);
    	-- Parcours l'ARN et affiche à l'aide de la fonction affiche passée en paramètre du package générique

    function ajout_Elem(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
	if vide(T) then
	    return new TPtrCellule(N, null, null, null,  false);
	else
	    if N < valeur(T) then
		if vide(fils_Gch(T)) then
		    T.fgch := new TPtrCellule(N, null, null, T, false);
		    equilibre(fils_Gch(T));
		    return T;
		else
		    T.fgch := ajout_Elem(fils_Gch(T), N);
		end if;
	    else
		if N > valeur(T) then
		    if vide(fils_Drt(T)) then
			T.fdrt := new TPtrCellule(N, null, null, T, false);
			equilibre(fils_Drt(T));
			return T;
		    else
			T.fdrt := ajout_Elem(fils_Drt(T), N);
		    end if;
		else
		    return T;
		end if;
	    end if;
	end if;
    end ajout_Elem;

    procedure equilibre(T : in TPtrCellule) is
    P : TPtrCellule := pere(T);
    begin
	if est_Racine(T) or est_Racine(P) then
	    change_Couleur(T);
	else
	    if not couleur(P) and not couleur(frere(P)) then
		change_Couleur(grand_Pere(T));
		change_Couleur(pere(T));
		change_Couleur(oncle(T));
	    else
		if couleur(frere(P)) then
		    if est_Fils_Droit(P) then
			if est_Fils_Droit(T) then
			    
    end equilibre;

    function supprimer(T: in TPtrCellule; N: in TElem) return TPtrCellule;
        -- Retourne un ARN sans le premier TElem rencontré
        -- Retourne le même ARN si le TElem n'est pas dans l'ARN

    function arn_Egaux (T1: in TPtrCellule; T2: in TPtrCellule) return Boolean;
    begin
	if not vide(T1)

      
end ARN_Gen;