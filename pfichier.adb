--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pfichier.adb

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
    		
    		if ((is_Letter(C) or (Character'pos(C) = 39 or Character'pos(C) = 45)) and end_of_line(Fichier)) then
    		    if (is_Upper(C)) then
    			    -- Si c'est une majuscule, on la lowercase !
    			    C := to_Lower(C);
    			end if;
    			
    			M := ajout_Lettre_Fin(M, C);
    			
    			if (not mot_Vide(M) and then significatif(M)) then
        			T := ajout_mot(T, M);
        		end if;
        		M := creer_Mot;
        	elsif ((is_Letter(C) or (Character'pos(C) = 39 or Character'pos(C) = 45))) then
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
        open(Fichier, In_File, "liste-mot.txt");
        skip_line(Fichier); -- On saute la ligne des stats
        
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
        put(Fichier, "Mots differents: ");
        put(Fichier, nb_Mots_Differents(L), 1);
        put(Fichier, "    ");
        put(Fichier, "Nombre occurrences: ");
        put(Fichier, nb_Total_Occurrence(L), 1);
        new_line(Fichier);
        
        while not liste_Couple_Vide(L) loop
            ecrire_ligne(Fichier, valeur_Couple(L));
            L := couple_Suivant(L);
        end loop;
        
        close(Fichier);
    end gen_Fichier;

end PFichier;