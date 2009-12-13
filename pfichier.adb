with Ada.Characters.Handling; use Ada.Characters.Handling;

package body PFichier is
    
    procedure gen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple) is
    	M: TMot;
    	C: Character;
    begin
        M := creer_Mot;
        T := creer_Liste_Couple;
    	open(Fichier, In_File, "texte.txt");
    	
    	while (not end_of_file(Fichier)) loop
    		get(Fichier, C);
    		if (is_Letter(C)) then
    			if (is_Upper(C)) then
    			    -- Si c'est une majuscule, on la lowercase !
    			    C := to_Lower(C);
    			end if;
    			    
    			M := ajout_Lettre_Fin(M, C);
    		else
    			if (not mot_Vide(M) and then significatif(M)) then
    			    T := ajout_mot(T, M);
    			end if;
    			M := creer_Mot;
    		end if;
    	end loop;

    	close(Fichier);
    end gen_Liste_Couples;
	
    procedure ecrire_Ligne(Fichier: in out File_Type; Couple: in TCouple) is
    	Mot: TMot := mot_Couple(Couple);
    begin
        open(Fichier, Out_File, "liste-mot.txt");
    
    	while not end_of_file(Fichier) loop
    	    skip_line(Fichier);
    	end loop;
	    
    	while (not mot_Vide(Mot)) loop
    		put(Fichier, valeur_Mot(Mot));
    		Mot := lettre_Suivante(Mot);
    	end loop;

    	put(Fichier, " ");
    	put(Fichier, Integer'image(occurrence(Couple)));
    	new_line(Fichier);
    	close(Fichier);
    end ecrire_ligne;
	
    procedure regen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple) is
    	L: TListe_Couple;
    	Couple: TCouple;
    	C: Character;
    	M: TMot;
    begin
        -- On doit sauter la première ligne de stats qu'on pourra regénerer facilement à partir de la liste une fois complète
        T := creer_Liste_Couple;
        open(Fichier, In_File, "liste-mot.txt");
        
    	while (not end_of_file(Fichier)) loop
    	    get(Fichier, C);
    		if (C /= ' ' or end_of_line(Fichier)) then
    		    M := mot_Couple(valeur_Couple(T));
    		    M := ajout_Lettre_Fin(M, C);
    		elsif (C = ' ') then
    			Couple := ajout_Occurrence(valeur_Couple(T), Character'Pos(C));
    		else
    			skip_line(Fichier);
    			
    			L := creer_Liste_Couple;
    			T := couple_Suivant(T);
    			T := L;
    			L := couple_Suivant(T);
    		end if;
    	end loop;
	
    	close(Fichier);
    end regen_Liste_Couples;
    
    procedure gen_Fichier(T: in TListe_Couple; Fichier: out File_Type) is
        L: TListe_Couple := T;
    begin
        create(Fichier, Name => "liste-mot.txt");
        
        while not liste_Couple_Vide(T) loop
            ecrire_ligne(Fichier, valeur_Couple(L));
            L := couple_Suivant(L);
        end loop;
    end gen_Fichier;

end PFichier;