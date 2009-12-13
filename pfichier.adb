with Ada.Characters.Handling; use Ada.Characters.Handling;
with ada.integer_text_io; use ada.integer_text_io;

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
    		
    		if (is_Letter(C) and end_of_line(Fichier)) then
    		    if (is_Upper(C)) then
    			    -- Si c'est une majuscule, on la lowercase !
    			    C := to_Lower(C);
    			end if;
    			
    			M := ajout_Lettre_Fin(M, C);
    			
    			if (not mot_Vide(M) and then significatif(M)) then
        			T := ajout_mot(T, M);
        		end if;
        		M := creer_Mot;
        	elsif (is_Letter(C)) then
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
    	while (not mot_Vide(Mot)) loop
    		put(Fichier, valeur_Mot(Mot));
    		Mot := lettre_Suivante(Mot);
    	end loop;

    	put(Fichier, " ");
    	put(Fichier, Integer'image(occurrence(Couple)));
    	new_line(Fichier);
    	
    end ecrire_ligne;
	
    procedure regen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple) is
    	Couple: TCouple;
    	C: Character;
    	M: TMot := creer_Mot;
    	O: TMot := creer_Mot;
    	I: Integer := 0;
    begin
        T := creer_Liste_Couple;
        -- On doit sauter la première ligne de stats qu'on pourra regénerer facilement à partir de la liste une fois complète
        open(Fichier, In_File, "liste-mot.txt");
        
        while (not end_of_file(Fichier)) loop
    		if (not end_of_line(Fichier)) then
    		    get(Fichier, C);
    		    if (is_Letter(C)) then
        			M := ajout_Lettre_Fin(M, C);
        		elsif (is_Digit(C)) then
        		    O := ajout_Lettre_Fin(O, C);
        		end if;
        	else
                Couple := creer_Couple(M, mot_to_int(O));
                T := insert_croissant_Mot(T, Couple);
                
                M := creer_Mot;
                O := creer_Mot;
        	    skip_line(Fichier);
        	end if;
    	end loop;
    	    
    	close(Fichier);
    end regen_Liste_Couples;
    
    procedure gen_Fichier(T: in TListe_Couple; Fichier: out File_Type) is
        L: TListe_Couple := T;
    begin
        create(Fichier, Name => "liste-mot.txt");
        close(Fichier);
        open(Fichier, Out_File, "liste-mot.txt");
        -- NE PAS OUBLIER LE NB MOTS ET OCCURRENCES
        
        while not liste_Couple_Vide(L) loop
            ecrire_ligne(Fichier, valeur_Couple(L));
            L := couple_Suivant(L);
        end loop;
        
        close(Fichier);
    end gen_Fichier;

end PFichier;