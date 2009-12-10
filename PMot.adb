package body PMot is

    function significatif(Mot: in TMot) return Boolean is
    begin
        return (longueur(Mot) > 3 or est_Petit_Mot(Mot));
    end significatif;

    procedure creer_Mot(Mot: out TMot) is
    begin
        creer_Liste(Mot);
    end creer_Mot;
    
    function mot_Vide(Mot: in TMot) return Boolean is
    begin
        return vide(Mot);
    end mot_Vide;

    procedure ajout_Lettre_Fin(Mot: in out TMot; N: in Character) is
    begin
        ajout_Fin(T, N);
    end ajout_Lettre_Fin;
    
    function valeur_Mot(Mot: in TMot) return Character is
    begin
        return valeur(Mot);
    end valeur_Mot;
    
    function lettre_Suivante(Mot: in TMot) return TMot is
    begin
        return suivant(Mot);
    end valeur_Mot;
    
    -- TO BE REFACTORED
    function prefixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
        prefx: Boolean := true;
        Mot_Temp1: TMot := Mot1;
        Mot_Temp2: TMot := Mot2;
    begin
    	while (not mot_Vide(Mot_Temp1) and then not mot_Vide(Mot_Temp2) and then prefx = true) loop
    		prefx := (valeur(Mot_Temp1) = valeur(Mot_Temp2));
    		Mot_Temp1 := suivant(Mot_Temp1);
    		Mot_Temp2 := suivant(Mot_Temp2);
    	end loop;

    	return (prefx and mot_Vide(Mot_Temp2));
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
                
            while (not mot_Vide(Mot_Temp1) and suff) loop
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
        if(not mot_Vide(Mot1)) or (longueur(Mot1) <= longueur(Mot_Temp2)) then
            while (not mot_Vide(Mot_Temp2) and not mot_Vide(Mot3)) loop
                if(valeur(Mot3) = valeur(Mot_Temp2)) then
        	        Mot3 := suivant(Mot3);
                else
        	        Mot3 := Mot1;
                end if;
                if mots_Egaux(Mot3, Mot1) then
        	        Mot_Temp2 := suivant(Mot_Temp2);
        	    end if;
            end loop;
                
            return mot_Vide(Mot3);
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

    procedure affiche_Mot(Mot: in TMot) is
    begin
    	affiche_Liste(Mot);
    end affiche_Mot;
    
    function est_Petit_Mot(Mot: in TMot) return Boolean is
    	found: Boolean := false;
    	Temp: TMot := Mot;
    	C: Character;
    	Fichier: File_Type;
    begin
    	open(Fichier, In_File, "petit-mot.txt");
	
    	while (not end_of_file(Fichier) and then not found) loop
    		get(Fichier, C);
    		if (C = valeur(Mot)) then
    			while (C = valeur(Temp)) loop
    				Temp := suivant(Temp);
    			end loop;
			
    			found := vide(Temp);
			
    			if (not found) then
    				Temp := Mot;
    			end if;
    		else
    			skip_line(Fichier);
    		end if;
    	end loop;
	
    	return found;
    end est_Petit_Mot;

end PMot;