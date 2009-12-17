with Text_Io; use Text_Io;
with ada.Integer_Text_Io; use ada.Integer_Text_Io;
with ada.Float_Text_Io; use ada.Float_Text_Io;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Exceptions; use Ada.Exceptions;
with PListe_Couple; use PListe_Couple;
with PCouple; use PCouple;
with PMot; use PMot;
with PFichier; use PFichier;

procedure FatLoutre is

    function entrer_Mot return TMot is
        mot : TMot := creer_Mot;
        c : character;
        begin
    	get(c);
    	while c /= '.' loop
    	    mot := ajout_Lettre_Fin(mot, to_lower(c));
    	    get(c);
    	end loop;
    	return mot;
    end entrer_Mot;


Fichier, Fichier2, Fichier3: File_Type;
Liste_Couple, Liste_Couple2: TListe_Couple := creer_Liste_Couple;
Mot1, Mot2, Suff: TMot := creer_Mot;
n: Integer := 1;
n1: Integer;
begin
        gen_Liste_Couples(Fichier, Liste_Couple);
        gen_Fichier(Liste_Couple, Fichier2);
        --regen_Liste_Couples(Fichier3, Liste_Couple2);
        -- Optionnel

	while n /= 0 loop
	    new_line;
	    put_Line("########################################");
	    put_Line("########          MENU         #########");
	    put_Line("########################################");
	    new_line;
	    put_line("Le contenu de texte.txt à été chargé");
	    new_line;
	    put_Line("1. Nombre d'occurences d'un mot");
	    put_Line("2. Nombre de mots qui ont un mot entré pour préfixe");
	    put_Line("3. Nombre de mots qui ont un mot entré pour suffixe");
	    put_Line("4. Nombre de mots qui ont un mot entré pour facteur");
	    put_Line("5. n Premiers mots dans l'ordre décroissant de leur nombre d'occurence");
	    put_Line("6. Fusionner les occurences du Mot2 dans le Mot1 et supprimer Mot2");
	    put_Line("7. Enregistrer la liste de mots dans le fichier liste-mot.txt");
	    put_Line("8. Charger la liste à partir du fichier liste-mot.txt");
	    put_Line("9. Statistiques de la liste");
	    put_Line("0. Exit");new_line;
	    put("Entrer un chiffre : ");
	    
	    get(n);
	    
	    new_line(1);

	    case n is
		when 1 =>
			    if mot_Vide(Mot1) then
				    put("Entrer un mot (terminer par un point '.'): ");
				    Mot1 := entrer_Mot;
			    else
				    n1 := 3;
				    while n1 /= 1 and n1 /= 0 loop
				        put("Utiliser le dernier mot entré ? (1)Oui, (0)Non: ");
				        get(n1);
				        end loop;
				
				    if n1 = 0 then
				        put("Entrer un mot (terminer par un point '.'): ");
				        Mot1 := entrer_Mot;
				        end if;
			    end if;
			    
			    new_line;
			    put("Le nombre d'occurences de '");
			    affiche_Mot(Mot1);
			    put("' est : ");
			    put(nb_Occurrences(Liste_Couple2, Mot1), 1);
			    new_line(3);
		when 2 =>
			    if mot_Vide(Mot1) then
				    put("Entrer un mot (terminer par un point '.'): ");
				    Mot1 := entrer_Mot;
			    else
				    n1 := 3;
				    while n1 /= 1 and n1 /= 0 loop
				        put("Utiliser le dernier mot entré ? (1)Oui, (0)Non ");
				        get(n1);
				        end loop;
				    
				    if n1 = 0 then
				        put("Entrer un mot (terminer par un point '.'): ");
				        Mot1 := entrer_Mot;
				    end if;
			    end if;
			    
			    put("Le nombre de mot qui ont '");
			    affiche_Mot(Mot1);
			    put("' pour préfixe est : ");
			    put(nb_Prefixe(Liste_Couple2, Mot1), 1);
			    put(" et a ");
			    put(nb_Occurrences(Liste_Couple2, Mot1), 1);
			    put(" occurences");
			    new_line(3);
		when 3 =>
			    if mot_Vide(Mot1) then
				    put("Entrer un mot (terminer par un point '.'): ");
				    Mot1 := entrer_Mot;
			    else
				    n1 := 3;
				    
				    while n1 /= 1 and n1 /= 0 loop
				        put("Utiliser le dernier mot entré ? (1)Oui, (0)Non ");
				        get(n1);
				        end loop;
				
				    if n1 = 0 then
				        put("Entrer un mot (terminer par un point '.'): ");
				        Mot1 := entrer_Mot;
				    end if;
			    end if;
			    
			    put("Le nombre de mot qui ont '");
			    affiche_Mot(Mot1);
			    put("' pour suffixe est : ");
			    put(nb_Suffixe(Liste_Couple2, Mot1), 1);
			    put(" et a ");
			    put(nb_Occurrences(Liste_Couple2, Mot1), 1);
			    put(" occurences");
			    new_line(3);
		when 4 =>
			    if mot_Vide(Mot1) then
				    put("Entrer un mot (terminer par un point '.'): ");
				    Mot1 := entrer_Mot;
			    else
				    n1 := 3;
				    
				    while n1 /= 1 and n1 /= 0 loop
    				    put("Utiliser le dernier mot entré ? (1)Oui, (0)Non ");
    				    get(n1);
    				end loop;
    				    
    				if n1 = 0 then
    				    put("Entrer un mot (terminer par un point '.'): ");
    				    Mot1 := entrer_Mot;
    				end if;
			    end if;
			        
			    put("Le nombre de mot qui ont '");
			    affiche_Mot(Mot1);
			    put("' pour facteur est : ");
			    put(nb_Facteur(Liste_Couple2, Mot1), 1);
			    put(" et a ");
			    put(nb_Occurrences(Liste_Couple2, Mot1), 1);
			    put(" occurences");
			    new_line(3);
		when 5 =>
			    put("Entrer un entier : ");
			    get(n1);new_line;
			    affichage_Decroissant(Liste_Couple2, n1);
			    new_line(3);
		when 6 =>
			    if mot_Vide(Mot1) then
				    put("Entrer le Mot1 (terminer par un point '.'): ");
				    Mot1 := entrer_Mot;
			    else
				    n1 := 3;
				    
				    while n1 /= 1 and n1 /= 0 loop
    				    put("Utiliser le dernier mot entré comme Mot1 ? (1)Oui, (0)Non ");
    				    get(n1);
    				end loop;
    				    
    				if n1 = 0 then
    				    put("Entrer le Mot1 (terminer par un point '.'): ");
    				    Mot1 := entrer_Mot;
    				end if;
			    end if;
			        
			    put("Entrer le Mot2 (terminer par un point '.'): ");
			    Mot2 := entrer_Mot;
			    Liste_Couple2 := fusion_Mots(Liste_Couple2, Mot1, Mot2);
			    put("Mots fusionnés");
			    new_line(3);
		when 7 =>
			    gen_Fichier(Liste_Couple2, Fichier2);
			    Put("Vous pouvez maintenant consulter le fichier liste-mots.txt");
			    new_line(3);
		when 8 =>
			    regen_Liste_Couples(Fichier3, Liste_Couple2);
			    Put("Vous pouvez maintenant travailler avec cette liste");
			    new_line(3);
		when 9 =>
			    put("Entrer un entier (taille de mots voulus) : ");
			    get(n1);
			    put("Le nombre total de mots est : ");
			    put(nb_Mots_Differents(Liste_Couple2), 1);new_line;
			    put("Le nombre d'occurences moyen est : ");
			    put(moy_Occurrence(Liste_Couple2), 1, 2);new_line;
			    put("La longueur moyenne d'un mot est : ");
			    put(moy_Longueur(Liste_Couple2), 1, 2);new_line;
			    put("Le nombre de mots supérieur a ");
			    put(n1, 1);
			    put(" est : ");
			    put(nb_Superieur(Liste_Couple2, n1), 1);
			    new_line(3);
		when others =>
		    put("Bye!");
	    end case;
	end loop;
	
	exception
	    when Error: DATA_ERROR =>
	        Put("Rentrez ce qui est demandé !");
            new_line;
            skip_line;
            FatLoutre;
        when Error: NAME_ERROR =>
            Put("Le fichier texte.txt n'existe pas dans le repertoire, veuillez fermer le programme, le créer et recommencer");
            new_line;
            skip_line;
        when Error: others =>
            Put("Une erreur innatendue s'est produite, veuillez quitter le programmme et recommencer");
            new_line;
            skip_line;
	
end FatLoutre;