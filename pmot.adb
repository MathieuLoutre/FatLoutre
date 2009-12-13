package body PMot is

    function significatif(Mot: in TMot) return Boolean is
    begin
        return (longueur(Mot) > 3 or est_Petit_Mot(Mot));
    end significatif;

    function creer_Mot return TMot is
    begin
        return creer_Liste;
    end creer_Mot;
    
    function mot_Vide(Mot: in TMot) return Boolean is
    begin
        return vide(Mot);
    end mot_Vide;
    
    function longueur_Mot(Mot: in TMot) return Integer is
    begin
        return longueur(Mot);
    end longueur_Mot;

    function ajout_Lettre_Fin(Mot: in TMot; N: in Character) return TMot is
    begin
        return ajout_Fin(Mot, N);
    end ajout_Lettre_Fin;
    
    function valeur_Mot(Mot: in TMot) return Character is
    begin
        return valeur(Mot);
    end valeur_Mot;
    
    function lettre_Suivante(Mot: in TMot) return TMot is
    begin
        return suivant(Mot);
    end lettre_Suivante;
    
    -- TO BE REFACTORED
    function prefixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
        prefx: Boolean := true;
        Mot_Temp1: TMot := Mot1;
        Mot_Temp2: TMot := Mot2;
    begin
    	while (not mot_Vide(Mot_Temp1) and then not mot_Vide(Mot_Temp2) and then prefx = true) loop
    		prefx := (valeur_Mot(Mot_Temp1) = valeur_Mot(Mot_Temp2));
    		Mot_Temp1 := suivant(Mot_Temp1);
    		Mot_Temp2 := suivant(Mot_Temp2);
    	end loop;
        
    	return (prefx and mot_Vide(Mot_Temp2));
    end prefixe;

    function suffixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin
        if (longueur(Mot1) > longueur(Mot2)) then
            return suffixe(suivant(Mot1), Mot2);
        elsif (longueur(Mot1) = longueur(Mot2)) then
            return mots_Egaux(Mot1, Mot2);
        else
            return false;
        end if;
    end suffixe;

    function facteur(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin        
        if longueur(Mot1) >= longueur(Mot2) then
            if (prefixe(Mot1, Mot2)) then
                return true;
            else
                return facteur(suivant(Mot1), Mot2);
            end if;
        else
            return false;
        end if;
    end facteur;

    function mot_Superieur(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin
        if (not vide(Mot2) and not vide(Mot1)) then
    	    if valeur(Mot2) >= valeur(Mot1) then
    	        return true;
    	    elsif (valeur(Mot2) = valeur(Mot1)) then
    	        return mot_Superieur(suivant(Mot1), suivant(Mot2));
    	    else
    	        return false;
    	    end if;
    	else
    	    return vide(Mot1) and not vide(Mot2);
    	end if;
    end mot_Superieur;
    -- Pourrait être placé en générique avec un relation d'ordre générique

    procedure affiche_Mot(Mot: in TMot) is
    begin
    	affiche_Liste(Mot);
    end affiche_Mot;
    
    function est_Petit_Mot(Mot: in TMot) return Boolean is
    	found: Boolean := false;
    	Temp: TMot;
    	C: Character;
    	Fichier: File_Type;
    begin
    	open(Fichier, In_File, "petits-mots.txt");
	
    	while (not end_of_file(Fichier) and not found) loop
    		get(Fichier, C);
    		if (C = valeur(Mot)) then
    		    Temp := ajout_Lettre_Fin(Temp, C);
    			while not end_of_line(Fichier) loop
    				get(Fichier, C);
    				Temp := ajout_Lettre_Fin(Temp, C);
    			end loop;
			    
    			found := mots_Egaux(Mot, Temp);
    			Temp := creer_Mot;
    		else
    			skip_line(Fichier);
    		end if;
    	end loop;
    	    
	    close(Fichier);
	    
    	return found;
    end est_Petit_Mot;

end PMot;