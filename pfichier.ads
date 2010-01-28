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
with PNoeud; use PNoeud;
with PTree_Noeud; use PTree_Noeud;
with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PListe_Trio; use PListe_Trio;
with PMot; use PMot;
with PTrio; use PTrio;
with ADA.Text_IO; use ADA.Text_IO;

package PFichier is
        
    procedure gen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple; nomFichier: in String);
	    -- Génère la liste des couples à partir du fichier donné, si le fichier est invalide, erreur
	
	procedure regen_Liste_Couples(Fichier: in out File_Type; T: out TListe_Couple; nomFichier: in String);
	    -- Régénère la liste des couples à partir du fichier. Si le fichier est invalide, erreur`
	
	procedure gen_Fichier(T: in TListe_Couple; Fichier: out File_Type; nomFichier: in String);
    	-- Génère le fichier liste-mot à partir d'une liste de couple
    	
    procedure gen_Fichier_Trio(T: in TListe_Trio; Fichier: out File_Type; nomFichier: in String);
    	-- Génère le fichier liste-mot-trio à partir d'une liste de trio
     
    procedure gen_Tree(Fichier: in out File_Type; T: out TTree_Noeud; nomFichier: in String);
    
    procedure gen_Fichier_Tree(T: in TTree_Noeud; Fichier: out File_Type; nomFichier: in String); 
        
    procedure regen_Tree(Fichier: in out File_Type; T: out TTree_Noeud; nomFichier: in String);
       
    private
        
        procedure write_Fichier_Tree(T: in TTree_Noeud; Fichier: in out File_Type);
            
        procedure ecrire_Ligne_Noeud(Fichier: in out File_Type; N: in TTree_Noeud);
        
        procedure ecrire_Ligne(Fichier: in out File_Type; Couple: in TCouple);
         	-- Ecrit le TCouple formatté sur le Fichier donné
         	
        procedure ecrire_Ligne_Trio(Fichier: in out File_Type; Trio: in TTrio);
        	-- Ecrit le TTrio formatté sur le Fichier donné

end PFichier;