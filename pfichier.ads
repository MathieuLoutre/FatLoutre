--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pfichier.ads
<<<<<<< HEAD:pfichier.ads
=======
--
-- Abstraction et centralisation des fonctions sur les fichiers. 
>>>>>>> 2a4e53945401b9540b35f6878e33034d2707a85e:pfichier.ads

with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PMot; use PMot;
with ADA.Text_IO; use ADA.Text_IO;

package PFichier is
        
    procedure gen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple; nomFichier : in String);
	    -- Génère la liste des couples à partir du fichier donné, si le fichier est invalide, erreur
	
	procedure regen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple; nomFichier : in String);
	    -- Régénère la liste des couples à partir du fichier. Si le fichier est invalide, erreur`
	
	procedure gen_Fichier(T: in TListe_Couple; Fichier: out File_Type; nomFichier : in String);
    	-- Génère le fichier liste-mots à partir d'une liste de couple

    private
         
        procedure ecrire_Ligne(Fichier: in out File_Type; Couple: in TCouple);
         	-- Ecrit le TCouple formatté sur le Fichier donné

end PFichier;