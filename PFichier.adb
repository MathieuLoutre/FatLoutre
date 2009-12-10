package body PFichier is
    
    function gen_Liste_Couples(Fichier: TFichier) return TListe_Couple is
    	L: TListe_Couple;
    	M: TMot;
    	C: Character;
    	Couple: TCouple;
    begin
        creer_Mot(M);
        creer_Liste_Couple(L);
    	open(Fichier, In_File, "texte.txt");
    	
    	while (not end_of_file(Fichier)) loop
    		get(Fichier, C);
    		if (C /= '.') then
    			ajout_Lettre_Fin(M, C);
    		else
    			if (significatif(M)) then
    			    ajout_mot(L, M);
    			end if;
    			creer_Mot(M);
    		end if;
    	end loop;

    	close(Fichier);
    	return L;
    end gen_Liste_Couples;
	
    procedure ecrire_Ligne(Fichier: in out TFichier; Couple: in TCouple) is
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
    	put(Fichier, occurrence(Couple));
    	new_line(Fichier);
    	close(Fichier);
    end ecrire_ligne;
	
    function regen_Liste_Couples(Fichier: in TFichier) return TListe_Couple is
    	L: TListe_Couple;
    	T: TListe_Couple;
    	Couple: TCouple;
    	C: Character;
    begin
        creer_Liste_Couple(L);
        open(Fichier, In_File, "liste-mot.txt");
        
    	while (not end_of_file(Fichier)) loop
    	    get(Fichier, C);
    		if (C /= ' ' or end_of_line(Fichier)) then
    		    ajout_Lettre_Fin(mot_Couple(valeur_Couple(L)), C);
    		elsif (C = ' ') then
    		    Couple := valeur_Couple(L);
    			ajout_Occurrence(Couple, integer(C));
    		else
    			skip_line(Fichier);
    			creer_Liste_Couple(T);
    			couple_Suivant(L) := T;
    			L := couple_Suivant(L);
    		end if;
    	end loop;
	
    	close(Fichier);
    	return L;
    end regen_Liste_Couples;
    
    procedure gen_Fichier(T: in TListe_Couple; Fichier: out TFichier) is
        L: TListe_Couple := T;
    begin
        create(Fichier, Name => "liste-mot.txt");
        
        while not liste_Couple_Vide(T) loop
            ecrire_ligne(Fichier, valeur_Couple(L));
            L := couple_Suivant(L);
        end loop;
    end gen_Fichier;

end PFichier;