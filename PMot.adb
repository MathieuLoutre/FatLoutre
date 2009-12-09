package body PMot is

    function significatif(Mot: in TMot) return Boolean
    	return (longueur(Mot) > 3 or est_Petit_Mot(Mot));
    end significatif;

    function prefixe(MoMot1: in TMot; MoMot2: in TMot) return Boolean
    	prefx: Boolean := true;

    	while (not vide(MoMot1) and then not vide(MoMot2) and then prefx = true) loop
    		prefx := (valeur(MoMot1) = valeur(MoMot2))
    		suivant(MoMot1);
    		suivant(MoMot2);
    	end loop

    	return (prefx and vide(MoMot2));
    end prefixe;

    function suffixe(Mot1: in TMot; Mot2: in TMot) return Boolean
        suff : Boolean := true;
    
        if(not vide(Mot1) or longueur(Mot1) < longueur(Mot2)) then
            for i in 1..(longueur(Mot2) - longueur(Mot1)) loop
                Mot2 := suivant(Mot2);
            end loop;
                
            while (not vide(Mot1) and suff) loop
                if (valeur(Mot1) = valeur(Mot2)) then
        	        Mot1 := suivant(Mot1);
        	        Mot2 := suivant(Mot2);
                else
        	        suff := false;
                end if;
            end loop;
        else
            return false;
        end if;
    end suffixe;


    function facteur(Mot1: in TMot; Mot2: in TMot) return Boolean
        Mot3: TMot := Mot1;
        
        if(not vide(Mot1)) or (longueur(Mot1) <= longueur(Mot2)) then
            while (not vide(Mot2) and not vide(Mot3)) loop
                if(valeur(Mot3) = valeur(Mot2)) then
        	        Mot3 := suivant(Mot3);
                else
        	        Mot3 := Mot1;
                end if;
                if egales(Mot3,Mot1) then
        	        Mot2 := suivant(Mot2);
        	    end if;
            end loop;
                
            return vide(Mot3);
        else
            return false;
        end if;
    end est_facteur;

    function mot_Superieur(Mot1: in TMot; Mot2: in TMot) return Boolean
        if (not vide(Mot2)) then
    	    if valeur(Mot2) >= valeur(Mot1) then
    	        return superieur(suivant(Mot1), suivant(Mot2));
    	    else
    	        return false;
    	    end if;
    	else
    	    return true;
    	end if;
    end mot_Superieur;
	
    function mots_Egaux(Mot1: in TMot; Mot2: in TMot) return Boolean
    	return listes_egales(Mot1, Mot2);
    end mots_egaux;

    function affiche_mot(Mot: in TMot)
    	affiche_liste(Mot);
    end affiche_mot;

end PMot;