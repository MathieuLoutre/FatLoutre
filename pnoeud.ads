--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pnoeud.ads
--

with text_io; use text_io;

package PNoeud is
    
    type TNoeud is private;
    
    function creer_Noeud(Char: in character; Occurrence: in Integer) return TNoeud;
        -- Creer un Noeud à partir d'un char, un nb d'occurrences et un papa :)
        
    function Noeuds_Egaux_Mot(Noeud1: in TNoeud; Noeud2: in TNoeud) return Boolean;
        -- Retourne True si les 2 mots des Noeuds sont égaux, False sinon
    
    function Noeud_Superieur_Occurrence(Noeud1: in TNoeud; Noeud2: in TNoeud) return Boolean;
        -- Retourne True si le Noeud2 est superieur au Noeud1, False sinon
    
    function char_Noeud(Noeud: in TNoeud) return character;

    function occurrence_Noeud(Noeud: in TNoeud) return Integer;
        -- Retourne le nombre d'occurrence du TNoeud
        
    function ajout_Occurrence(Noeud: in TNoeud; N: in Integer) return TNoeud;
        -- Modifie le Noeud avec ses occurrences augmentées du nombre passé en paramètre
        
    function suppr_Occurrence(Noeud: in TNoeud) return TNoeud;
    
    procedure affiche_Noeud(Noeud: in TNoeud);
    
    function hash_Char(Noeud: in TNoeud) return integer;
        -- retourne un int unique en fonction du char du noeud
    
    private
        type TNoeud is record
            char: character;
            occurrences: integer;
        end record;

end PNoeud;