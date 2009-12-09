package body PMot is

    -- function significatif(Mot: in TMot) return Boolean is
    --     begin
    --      return (longueur(Mot) > 3 or est_Petit_Mot(Mot));
    --     end significatif;

    -- TO BE REFACTORED
    function prefixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
        prefx: Boolean := true;
        Mot_Temp1: TMot := Mot1;
        Mot_Temp2: TMot := Mot2;
    begin
    	while (not vide(Mot_Temp1) and then not vide(Mot_Temp2) and then prefx = true) loop
    		prefx := (valeur(Mot_Temp1) = valeur(Mot_Temp2));
    		Mot_Temp1 := suivant(Mot_Temp1);
    		Mot_Temp2 := suivant(Mot_Temp2);
    	end loop;

    	return (prefx and vide(Mot_Temp2));
    end prefixe;

    -- TO BE REFACTORED
    function suffixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
        suff: Boolean := true;
        Mot_Temp1: TMot := Mot1;
        Mot_Temp2: TMot := Mot2;
    begin
        if(not vide(Mot_Temp1) or longueur(Mot_Temp1) < longueur(Mot_Temp2)) then
            for i in 1..(longueur(Mot_Temp2) - longueur(Mot_Temp1)) loop
                Mot_Temp2 := suivant(Mot_Temp2);
            end loop;
                
            while (not vide(Mot_Temp1) and suff) loop
                if (valeur(Mot_Temp1) = valeur(Mot_Temp2)) then
        	        Mot_Temp1 := suivant(Mot_Temp1);
        	        Mot_Temp2 := suivant(Mot_Temp2);
                else
        	        suff := false;
                end if;
            end loop;
        else
            suff := false;
        end if;
        
        return suff;
    end suffixe;

    function facteur(Mot1: in TMot; Mot2: in TMot) return Boolean is
        Mot3: TMot := Mot1;
        Mot_Temp2: TMot := Mot2;
    begin        
        if(not vide(Mot1)) or (longueur(Mot1) <= longueur(Mot_Temp2)) then
            while (not vide(Mot_Temp2) and not vide(Mot3)) loop
                if(valeur(Mot3) = valeur(Mot_Temp2)) then
        	        Mot3 := suivant(Mot3);
                else
        	        Mot3 := Mot1;
                end if;
                if mots_egaux(Mot3, Mot1) then
        	        Mot_Temp2 := suivant(Mot_Temp2);
        	    end if;
            end loop;
                
            return vide(Mot3);
        else
            return false;
        end if;
    end facteur;

    function mot_Superieur(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin
        if (not vide(Mot2)) then
    	    if valeur(Mot2) >= valeur(Mot1) then
    	        return mot_Superieur(suivant(Mot1), suivant(Mot2));
    	    else
    	        return false;
    	    end if;
    	else
    	    return true;
    	end if;
    end mot_Superieur;
	
    function mots_Egaux(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin
    	return listes_egales(Mot1, Mot2);
    end mots_egaux;

    procedure affiche_mot(Mot: in TMot) is
    begin
    	affiche_liste(Mot);
    end affiche_mot;

end PMot;