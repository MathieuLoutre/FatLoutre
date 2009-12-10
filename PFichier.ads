with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PMot; use PMot;
with ADA.Text_IO; use ADA.Text_IO;

package PFichier is
    
    type TFichier is private;
    
    function gen_Liste_Couples(Fichier: in TFichier) return TListe_Couple;
	    -- Génère la liste des couples à partir du fichier donné, si le fichier est invalide, erreur
	
    function regen_Liste_Couples(Fichier: in TFichier) return TListe_Couple;
	    -- Régénère la liste des couples à partir du fichier. Si le fichier est invalide, erreur`
	
	procedure gen_Fichier(T: in TListe_Couple; Fichier: out TFichier);
    	-- Génère le fichier liste-mots à partir d'une liste de couple

    private
        type TFichier is new File_Type;
            
        procedure ecrire_Ligne(Fichier: in out TFichier; Couple: in TCouple);
         	-- Ecrit le TCouple formatté sur le Fichier donné

end PFichier;