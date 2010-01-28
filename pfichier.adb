--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pfichier.adb
--
-- Abstraction et centralisation des fonctions sur les fichiers.

with Ada.Characters.Handling; use Ada.Characters.Handling;
with ada.integer_text_io; use ada.integer_text_io;

package body PFichier is
    
    procedure gen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple; nomFichier : in String) is
    	M: TMot;
    	C: Character;
    begin
        M := creer_Mot;
        T := creer_Liste_Couple;
    	open(Fichier, In_File, nomFichier);
    	
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
	
	-- Ecrit la ligne correspondant au couple dans le fichier
    procedure ecrire_Ligne(Fichier: in out File_Type; Couple: in TCouple) is
    	Mot: TMot := mot_Couple(Couple);
    begin
    	while (not mot_Vide(Mot)) loop
    		put(Fichier, valeur_Mot(Mot));
    		-- On écrit lettre par lettre
    		Mot := lettre_Suivante(Mot);
    	end loop;

    	put(Fichier, " ");
    	put(Fichier, Integer'image(occurrence(Couple))); -- On affiche le string correspondant à l'int
    	new_line(Fichier);
    end ecrire_ligne;
	
	-- Régénère la liste de couple à partir du fichier liste-mots.txt
    procedure regen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple; nomFichier : in String) is
    	Couple: TCouple;
    	C: Character;
    	M: TMot := creer_Mot;
    	O: TMot := creer_Mot;
    	I: Integer := 0;
    begin
        T := creer_Liste_Couple;
        open(Fichier, In_File, nomFichier);
        skip_line(Fichier); -- On saute la ligne des stats
        
        while (not end_of_file(Fichier)) loop
        -- Tant qu'on est pas à la fin du fichier
    		if (not end_of_line(Fichier)) then
    		-- Si on est pas à la fin de la ligne, on continue de récuperer le mot
    		    get(Fichier, C);
    		    if (is_Letter(C)) then
        			M := ajout_Lettre_Fin(M, C);
        		elsif (is_Digit(C)) then
        		-- Cette partie se charge de récuperer le nombre d'occurrences
        		    O := ajout_Lettre_Fin(O, C);
        		end if;
        	else 
        	    -- On est à la fin de la ligne, donc il faut recreer le couple
                Couple := creer_Couple(M, mot_to_int(O));
                T := insert_croissant_Mot(T, Couple);
                
                M := creer_Mot;
                O := creer_Mot;
        	    skip_line(Fichier); -- On passe à la ligne d'après
        	end if;
    	end loop;
    	    
    	close(Fichier);
    end regen_Liste_Couples;
    
    -- Génère le fichier à partir de la liste de couple
    procedure gen_Fichier(T: in TListe_Couple; Fichier: out File_Type; nomFichier : in String) is
        L: TListe_Couple := T;
    begin
        create(Fichier, Name => nomFichier);
        close(Fichier);
        open(Fichier, Out_File, nomFichier);
        put(Fichier, "Mots differents: ");
        put(Fichier, nb_Mots_Differents(L), 1);
        put(Fichier, "    ");
        put(Fichier, "Nombre occurrences: ");
        put(Fichier, nb_Total_Occurrence(L), 1);
        new_line(Fichier);
        -- On écrit les statistiques
        
        -- Pour chaque couple, on l'écrit dans le fichier
        while not liste_Couple_Vide(L) loop
            ecrire_ligne(Fichier, valeur_Couple(L));
            L := couple_Suivant(L);
        end loop;
        
        close(Fichier);
    end gen_Fichier;
    
    
    -- Fonctions de gestion de fichiers pour les trios.
    
    -- Ecrit la ligne correspondant au couple dans le fichier
    procedure ecrire_Ligne_Trio(Fichier: in out File_Type; Trio: in TTrio) is
    	Mot: TMot := mot_Trio(Trio);
    begin
    	while (not mot_Vide(Mot)) loop
    		put(Fichier, valeur_Mot(Mot));
    		-- On écrit lettre par lettre
    		Mot := lettre_Suivante(Mot);
    	end loop;

    	put(Fichier, " ");
    	put(Fichier, Integer'image(occurrence_Texte1(Trio))); -- On affiche le string correspondant aux occurrences 1
    	put(Fichier, " ");
    	put(Fichier, Integer'image(occurrence_Texte2(Trio))); -- On affiche le string correspondant aux occurrences 2
    	new_line(Fichier);
    end ecrire_Ligne_Trio;
    
    -- Génère le fichier à partir de la liste de trios
    procedure gen_Fichier_Trio(T: in TListe_Trio; Fichier: out File_Type; nomFichier: in String) is
        L: TListe_Trio := T;
    begin
        create(Fichier, Name => nomFichier);
        close(Fichier);
        open(Fichier, Out_File, nomFichier);
        
        -- Pour chaque trio, on l'écrit dans le fichier
        while not liste_Trio_Vide(L) loop
            ecrire_Ligne_Trio(Fichier, valeur_Trio(L));
            L := trio_Suivant(L);
        end loop;
        
        close(Fichier);
    end gen_Fichier_Trio;
    
    -- Fonctions de gestion de fichiers pour les arbres
    
    procedure gen_Tree(Fichier: in out File_Type; T: out TTree_Noeud; nomFichier: in String) is
       	M: TMot;
       	C: Character;
       begin
           M := creer_Mot;
           T := creer_Tree_Noeud;
       	   open(Fichier, In_File, nomFichier);

       	while (not end_of_file(Fichier)) loop
       		get(Fichier, C);

       		if ((is_Letter(C) or (Character'pos(C) = 39 or Character'pos(C) = 45)) and end_of_line(Fichier)) then
       		    if (is_Upper(C)) then
       			    -- Si c'est une majuscule, on la lowercase !
       			    C := to_Lower(C);
       			end if;

       			M := ajout_Lettre_Fin(M, C);

       			if (not mot_Vide(M) and then significatif(M)) then
           			T := ajout_Mot_Tree(T, M);
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
       			    T := ajout_Mot_Tree(T, M);
       			end if;
       			M := creer_Mot;
       		end if;
       	end loop;

       	close(Fichier);
       end gen_Tree;
       
       procedure ecrire_Ligne_Noeud(Fichier: in out File_Type; N: in TTree_Noeud) is
       	Mot: TMot := get_Mot_Tree(N);
       begin
       	while (not mot_Vide(Mot)) loop
       		put(Fichier, valeur_Mot(Mot));
       		-- On écrit lettre par lettre
       		Mot := lettre_Suivante(Mot);
       	end loop;

       	put(Fichier, " ");
       	put(Fichier, Integer'image(occurrence_Noeud(valeur_Noeud(N)))); -- On affiche le string correspondant à l'int
       	new_line(Fichier);
       end ecrire_ligne_Noeud;
    
       procedure gen_Fichier_Tree(T: in TTree_Noeud; Fichier: out File_Type; nomFichier : in String) is
              L: TTree_Noeud := T;
          begin
              create(Fichier, Name => nomFichier);
              close(Fichier);
              open(Fichier, Out_File, nomFichier);
              put(Fichier, "Mots differents: ");
              put(Fichier, nb_Mots_Tree(L), 1);
              put(Fichier, "    ");
              put(Fichier, "Nombre occurrences: ");
              put(Fichier, nb_Occurrences_Total(L), 1);
              new_line(Fichier);
              -- On écrit les statistiques

              write_Fichier_Tree(T, Fichier);
         
              close(Fichier);
        end gen_Fichier_Tree;
        
        procedure write_Fichier_Tree(T: in TTree_Noeud; Fichier: in out File_Type) is
            L: TTree_Noeud := T;
        begin
            if not tree_Noeud_Vide(T) then
                if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                    ecrire_ligne_Noeud(Fichier, L);
                end if;
                
                for I in 1..longueur_Fils(T) loop
                    write_Fichier_Tree(fils_Char_Int(T, I), Fichier);
                end loop;
            end if;
        end write_Fichier_Tree;
        
        procedure regen_Tree(Fichier: in out File_Type; T: out TTree_Noeud; nomFichier: in String) is
        	Noeud: TNoeud;
        	C: Character;
        	M: TMot := creer_Mot;
        	O: TMot := creer_Mot;
        	I: Integer := 0;
        	E: TTree_Noeud;
        begin
            T := creer_Tree_Noeud;
            open(Fichier, In_File, nomFichier);
            skip_line(Fichier); -- On saute la ligne des stats

            while (not end_of_file(Fichier)) loop
            -- Tant qu'on est pas à la fin du fichier
        		if (not end_of_line(Fichier)) then
        		-- Si on est pas à la fin de la ligne, on continue de récuperer le mot
        		    get(Fichier, C);
        		    if (is_Letter(C)) then
            			M := ajout_Lettre_Fin(M, C);
            		elsif (is_Digit(C)) then
            		-- Cette partie se charge de récuperer le nombre d'occurrences
            		    O := ajout_Lettre_Fin(O, C);
            		end if;
            	else 
            	    -- On est à la fin de la ligne, donc il faut recreer le couple
                    
                    T := ajout_Mot_Tree(T, M);
                    E := retrouve_Mot(T, M);
                    Noeud := ajout_Occurrence(valeur_Noeud(E), mot_to_int(O)-1);
                    modif_Tree(E, Noeud);
                    
                    M := creer_Mot;
                    O := creer_Mot;
            	    skip_line(Fichier); -- On passe à la ligne d'après
            	end if;
        	end loop;

        	close(Fichier);
        end regen_Tree;
        
end PFichier;
