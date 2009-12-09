with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;

package PFichier is
    
    type TFichier is private;
    
    function gen_Liste_Couples(Fichier: in TFichier) return TListe_Couple;
	    -- Génère la liste des couples à partir du fichier donné, si le fichier est invalide, erreur
	
    function regen_Liste_Couples(Fichier: in TFichier) return TListe_Couple;
	    -- Régénère la liste des couples à partir du fichier. Si le fichier est invalide, erreur

    private
        type PFichier is new File_Type;
            
        function ecrire_Ligne(Couple: in TCouple) return TFichier;
         	-- Ecrit le TCouple formatté sur le Fichier donné
        
        function present(Mot: in TMot) return Boolean;
        	-- True si le mot est présent dans petits-mots, False sinon
        

end PFichier;