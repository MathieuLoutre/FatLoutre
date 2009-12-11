with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PMot; use PMot;
with ADA.Text_IO; use ADA.Text_IO;

package PFichier is
        
    procedure gen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple);
	    -- Génère la liste des couples à partir du fichier donné, si le fichier est invalide, erreur
	
	procedure regen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple);
	    -- Régénère la liste des couples à partir du fichier. Si le fichier est invalide, erreur`
	
	procedure gen_Fichier(T: in TListe_Couple; Fichier: out File_Type);
    	-- Génère le fichier liste-mots à partir d'une liste de couple

    private
         
        procedure ecrire_Ligne(Fichier: in out File_Type; Couple: in TCouple);
         	-- Ecrit le TCouple formatté sur le Fichier donné

end PFichier;