--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pfichier.ads
--
-- Abstraction et centralisation des fonctions sur les fichiers. 

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