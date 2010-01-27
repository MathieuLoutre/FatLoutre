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
	    return egaux(pere(T).val, T.val);
	else
	    return false;
	end if;
    end est_Racine;

    procedure change_Couleur(T: in TPtrCellule) is
    begin
	if not vide(T) then
	    if couleur(T) then
		T.coul := false;
	    else
		T.coul := true;
	    end if;
	end if;
    end change_Couleur;

    function frere(T : TPtrCellule) return TPtrCellule is
    begin
	if not vide(T) then
	    if not vide(pere(T)) then
		if ordre(valeur(T), valeur(pere(T))) then
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
	    if ordre(valeur(pere(T)), valeur(pere(pere(T)))) then
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
		return ordre(valeur(T), valeur(pere(T)));
	    else
		return false;
	    end if;
	else
	    return false;
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

    function couleur(T: in TPtrCellule) return Boolean is
    begin
	return T.coul;
    end couleur;

    function valeur(T: in TPtrCellule) return TElem is
    begin
	return T.val;
    end valeur;

    function fils_Gch(T: in TPtrCellule) return TPtrCellule is
    begin
	return T.fgch;
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

    procedure affiche_ARN (T: in TPtrCellule) is
    	-- Parcours l'ARN et affiche à l'aide de la fonction affiche passée en paramètre du package générique
    begin
	affiche(T.val);
    end affiche_ARN;

    function min_Des_Max(T: in TPtrCellule) return TPtrCellule is
    begin
	if vide(T) then
	    return null;
	else
	    if vide(fils_Gch(T)) then
		return T;
	    else
		return min_Des_Max(fils_Gch(T));
	    end if;
	end if;
    end min_Des_Max;

    function equilibre(T : in TPtrCellule) return integer is
    P : TPtrCellule;
    begin
	if vide(T) then
	    return 0;
	else
	    P := pere(T);
	    if est_Racine(T) or est_Racine(P) then
		return 10;
	    else
		if not couleur(P) and not couleur(frere(P)) then
		    return 20;
		else
		    if couleur(frere(P)) then
			if est_Fils_Droit(P) then
			    if est_Fils_Droit(T) then
				return 42;
			    else
				return 41;
			    end if;
			else
			    if est_Fils_Droit(P) then
				return 32;
			    else
				return 31;
			    end if;
			end if;
		    end if;
		end if;
	    end if;
	end if;
    end equilibre;

    procedure equilibre_Insertion(T: in out TPtrCellule) is
    cas: integer := equilibre(T);
    F: TPtrCellule;
    begin
	if cas = 10 then
	    if est_Racine(T) then
		T.coul := true;
	    else
		T.pere.coul := true;
	    end if;
	else
	    if cas = 20 then
		T.pere.pere.coul := false;
		T.pere.coul := true;
		F := frere(T);
		F.coul := true;
		equilibre_Insertion(T.pere.pere);
	    else
		if cas = 31 then
		    T.pere := rotation_Droite(pere(pere(T)), pere(T));
		    T.pere.coul := true;
		    T.pere.pere.coul := false;
		else
		    if cas = 42 then
			T.pere := rotation_Gauche(pere(pere(T)), pere(T));
			T.pere.coul := true;
			T.pere.pere.coul := false;
		    else 
			if cas = 32 then
			    T := rotation_Gauche(pere(T), T);
			    T := rotation_Droite(pere(pere(T)), T);
			    T.coul := true;
			    T.pere.pere.coul := false;
			else
			    if cas = 41 then
				T := rotation_Droite(pere(T), T);
				T := rotation_Gauche(pere(pere(T)), T);
				T.coul := true;
				T.pere.pere.coul := false;
			    end if;
			end if;
		    end if;
		end if;
	    end if;
	end if;
    end equilibre_Insertion;
	    

    function ajout_Elem(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
	if vide(T) then
	    return new TCellule'(N, null, null, T, false);
	else
	    if ordre(N, valeur(T)) then
		if vide(fils_Gch(T)) then
		    T.fgch := new TCellule'(N, null, null, T, false);
		    return T;
		else
		    T.fgch := ajout_Elem(fils_Gch(T), N);
		end if;
	    else
		if ordre(N, valeur(T)) then
		    if vide(fils_Drt(T)) then
			T.fdrt := new TCellule'(N, null, null, T, false);
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

    function inserer_Equilibre(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
-- 	ajouter la fonction equilibre
-- 	ajout_Elem(T, N);
	return T;
    end inserer_Equilibre;

    function supprimer_Elem(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
	if vide(T) then
	    return T;
	else
	    if egaux(N, valeur(T)) then
		if vide(fils_Gch(T)) and vide(fils_Drt(T)) then
		    if ordre(valeur(pere(T)), valeur(T)) then
			T.pere.fgch := null;
		    else
			T.pere.fdrt := null;
		    end if;
		    return T;
		else
		    if vide(fils_Gch(T)) and not vide(fils_Drt(T)) then
			T.val := T.fdrt.val;
			return T;
		    else
			if vide(fils_Drt(T)) and not vide(fils_Gch(T)) then
			    T.val := valeur(fils_Gch(T));
			    return T;
			else
			    return supprimer_Elem(min_Des_Max(fils_Drt(T)), N);
			end if;
		    end if;
		end if;
	    else
		if ordre(N, valeur(T)) then
		    return supprimer_Elem(fils_Drt(T), N);
		else
		    return supprimer_Elem(fils_Gch(T), N);
		end if;
	    end if;
	end if;
    end supprimer_Elem;

    function supprimer_Equilibre(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
-- 	fonction equilibre
	return supprimer_Elem(T, N);
    end supprimer_Equilibre;

    function arn_Egaux(T1: in TPtrCellule; T2: in TPtrCellule) return Boolean is
    begin
	if not vide(T1) and not vide(T2) then
	    if egaux(T1.val, T2.val) then
		return arn_Egaux(fils_Drt(T1), fils_Drt(T2)) and arn_Egaux(fils_Gch(T1), fils_Gch(T2));
	    else
		return false;
	    end if;
	else
	    if vide(T1) and vide(T2) then
		return true;
	    else
		return false;
	    end if;
	end if;
    end arn_Egaux;

    function rotation_Droite(T1: in TPtrCellule; T2: in TPtrCellule) return TPtrCellule is
    begin
	if est_Racine(T1) then
	    T1.pere.fgch := T2;
	else
	    T1.pere.fdrt := T2;
	end if;

	T2.pere:= T1.pere;
	T1.fgch:= T2.fdrt;

	if not vide(T2.fdrt) then
	    T2.fdrt.pere:= T1;
	end if;

	T2.fdrt:= T1;
	T1.pere:= T2;

	return T2;
    end rotation_Droite;

    function rotation_Gauche(T1: in TPtrCellule; T2: in TPtrCellule) return TPtrCellule is
    begin
	if not est_Fils_Droit(T1) then
	    T1.pere.fgch := T2;
	else
	    T1.pere.fdrt := T2;
	end if;

	T2.pere:= T1.pere;
	T1.fdrt:= T2.fgch;

	if not vide(T2.fgch) then
	    T2.fgch.pere:= T1;
	end if;

	T2.fgch:= T1;
	T1.pere:= T2;

	return T2;
    end rotation_Gauche;
      
end ARN_Gen;