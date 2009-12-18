--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pmot.ads

package body PMot is
    
    function significatif(Mot: in TMot) return Boolean is
    begin
        return (longueur_Mot(Mot) > 3 or est_Petit_Mot(Mot));
        -- Le mot est significatif si il est de longueur supérieur à 3
        -- Ou si il est inclu dans petits-mots.txt
    end significatif;
    
    function prefixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
        prefx: Boolean := true;
        Mot_Temp1: TMot := Mot1;
        Mot_Temp2: TMot := Mot2;
    begin
    	while (not mot_Vide(Mot_Temp1) and then not mot_Vide(Mot_Temp2) and then prefx = true) loop
    		prefx := (valeur_Mot(Mot_Temp1) = valeur_Mot(Mot_Temp2));
    		-- On continue tant que les 2 lettres sont égales
    		Mot_Temp1 := suivant(Mot_Temp1);
    		Mot_Temp2 := suivant(Mot_Temp2);
    		-- On passe aux lettres suivantes
    	end loop;
    	-- On est sorti soit car les 2 lettres ne sont plus égales
    	-- Soit car un des 2 mots (ou les 2) est vide
        
    	return (prefx and mot_Vide(Mot_Temp2));
    	-- Le cas qui nous interesse est bien sûr celui ou prefx est toujours à true
        -- et où le mot2 (le préfixe) est vide (on est arrivé jusqu'au bout sans encombres)
    end prefixe;

    function suffixe(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin
        if (longueur(Mot1) > longueur(Mot2)) then
            return suffixe(suivant(Mot1), Mot2);
            -- Si le mot est plus grand, on passe à la lettre suivante
        elsif (longueur(Mot1) = longueur(Mot2)) then
            return mots_Egaux(Mot1, Mot2);
            -- Lorsque les longueurs sont égales, on a plus qu'a comparer l'égalité des 2 mots
        else
            return false;
            -- Si le suffixe est plus grand que le mot, c'est mort
        end if;
    end suffixe;

    -- Stratégie: on regarde pour chaque sous-mot (on enlève une lettre à la fois)
    -- si le facteur est suffixe.
    function facteur(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin        
        if longueur(Mot1) >= longueur(Mot2) then
            -- Tant qu'on a la place de verifier le facteur
            if (prefixe(Mot1, Mot2)) then
                return true;
                -- On regarde si il est préfixe !
            else
                return facteur(suivant(Mot1), Mot2);
                -- On cherche va à la partie suivante du mot
            end if;
        else
            return false;
            -- Si le facteur est plus grand que le mot, c'est mort
        end if;
    end facteur;
    
    -- Pourrait être placé en générique avec un relation d'ordre générique
    -- On utilise directement l'operateur > fourni par ADA du coup.
    function mot_Superieur(Mot1: in TMot; Mot2: in TMot) return Boolean is
    begin
        if (not vide(Mot2) and not vide(Mot1)) then
            -- Tant que les 2 mots ne sont pas vide
    	    if valeur(Mot2) >= valeur(Mot1) then
    	        return true;
    	        -- Si c'est superieur, c'est gagné
    	    elsif (valeur(Mot2) = valeur(Mot1)) then
    	        return mot_Superieur(suivant(Mot1), suivant(Mot2));
    	        -- Si c'est égal, on va voir au suivant ce qu'il en est
    	    else
    	        return false;
    	        -- Si c'est inférieur, c'est mort
    	    end if;
    	else
    	    return vide(Mot1) and not vide(Mot2);
    	    -- Si les 2 mots sont vides en même temps (égalité), on renvoit faux
    	    -- Si le Mot1 est vide avant le mot2, c'est qu'il lui est superieur
    	end if;
    end mot_Superieur;
    
    function est_Petit_Mot(Mot: in TMot) return Boolean is
    	found: Boolean := false;
    	Temp: TMot;
    	C: Character;
    	Fichier: File_Type;
    begin
    	open(Fichier, In_File, "petits-mots.txt");
	
    	while (not end_of_file(Fichier) and not found) loop
    		get(Fichier, C);
    		-- Tant que c'est pas la fin du fichier et qu'on a rien trouvé, on récupère un caractère
    		
    		if (C = valeur(Mot)) then
    		    Temp := ajout_Lettre_Fin(Temp, C);
    		    -- Si la première lettre est la même, on est en bonne voie
    			while not end_of_line(Fichier) loop
    				get(Fichier, C);
    				Temp := ajout_Lettre_Fin(Temp, C);
    			end loop;
    			-- On récupère tout les caractères jusqu'à la fin de la liste...
			    
    			found := mots_Egaux(Mot, Temp);
    			-- Puis on compare l'égalité
    			Temp := creer_Mot;
    			-- On remet le mot temporaire à 0 dans tout les cas
    		else
    			skip_line(Fichier);
    			-- Si la première lettre n'est pas la bonne, on passe à la ligne suivante
    		end if;
    	end loop;
    	    
	    close(Fichier);
	    
    	return found;
    end est_Petit_Mot;
    
    -- Cette fonction ne doit être utilisée que lorsqu'on est certain 
    -- que les caractères contenus dans le mot représente des entiers !!!
    -- Stratégie: Pour convertir un chaine de caractères, 
    -- on doit la passer en string puis demander sa valeur en integer
    function mot_to_Int(Mot: in TMot) return Integer is
	    M: TMot := Mot;
	    S: String(1..longueur_Mot(Mot));
	    -- On créé un string de la taille du mot
	    I: Integer := 1;
	begin
	    while not mot_Vide(M) and I <= longueur_Mot(Mot) loop
	        S(I) := valeur_Mot(M);
	        M := suivant(M);
	        I := I + 1;
	    end loop;
	    -- On le rempli avec le Mot passé en paramètre

	    return integer'value(S);
	    -- Et on retourne la conversion
	end mot_to_Int;
	
	-- Ces fonctions ne sont que des renames des fonctions génériques 
    -- pour qu'elles puissent être appellées dans d'autres packages
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
    
    procedure affiche_Mot(Mot: in TMot) is
    begin
    	affiche_Liste(Mot);
    end affiche_Mot;

end PMot;