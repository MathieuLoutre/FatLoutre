
function gen_Liste_Couples(Fichier: TFichier) return TListe_Couple is
	L: TListe_Couple := creer_Liste();
	M: TMot := new TMot;
	C: Character;
	Couple: TCouple;
begin
	open(Fichier, In_File, "texte.txt");
	while (not end_of_file(Fichier)) loop
		get(Fichier, C);
		if (C /= ".") then
			M := ajout_Fin(M, C);
		else
			if (significatif(M)) then
			    ajout_mot(L, M);
			end if;
			M := new TMot;
	end loop

	close(Fichier);
	return L;
end gen_Liste_Couples;
	
function ecrire_Ligne(Fichier: in TFichier; Couple: in TCouple) return TFichier is
	Mot: TMot := mot(valeur(Couple));
begin
    open(Fichier, Out_File, "liste-mot.txt");
    
	while not end_of_file(Fichier) loop
	    skip_line(Fichier);
	end loop;
	    
	while (not vide(Mot) loop
		put(Fichier, valeur(Mot));
		Mot := suivant(Mot);
	end loop;

	put(Fichier, " ");
	put(Fichier, occurrence(valeur(Couple)));
	new_line(Fichier);
	close(Fichier);
end ecrire_ligne;
	
function regen_Liste_Couples(Fichier: in TFichier) return TListe_Couple is
	L: TListe_Couple := creer_Liste();
	C: Character;
begin
    open(Fichier, In_File, "liste-mot.txt");
	while (not end_of_file(Fichier)) loop
	    get(Fichier, C);
		if (C /= " " or end_of_line(Fichier)) then
			valeur(mot(valeur(L))) := C;
			mot(valeur(L)) := suivant(mot(valeur(L)));
		elsif (C = " ") then
			valeur(occurrence(valeur(L))) := integer(C);
		else
			skip_lineFFichier);
			suivant(L) := creer_Liste;
			L := suivant(L);
		end if;
	end loop
	
	close(Fichier);
	return L;
end regen_Liste_Couples;
	
function est_Petit_Mot(Mot: in TMot) return Boolean is
	found: Boolean := false;
	Temp: TMot := Mot;
	C: Character;
	Fichier: File_Type;
begin
	open(Fichier, In_File, "petit-mot.txt");
	
	while (not end_of_file(petit-mots.txt) and then not found) loop
		get(Fichier, C);
		if (C = valeur(Mot)) then
			while (C = valeur(Temp)) loop
				Temp := suivant(Temp);
			end loop;
			
			found := vide(Temp);
			
			if (not found) then
				Temp := Mot
			end if;
		else
			skip_line(Fichier);
		end if;
	end loop;
	
	return found;
end est_Petit_Mot;