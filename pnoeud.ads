--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 01/10 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pnoeud.ads
--
-- Le Noeud est l'unité de base des Tries. Elle sert ici à l'instanciation d'une Tree avec des characteres.
-- C'est ici qu'on décide la fonction de hashage qui servira à rentrer ces éléments là dans une case de la table de hashage.

with text_io; use text_io;

package PNoeud is
    
    type TNoeud is private;
    
    function creer_Noeud(Char: in character; Occurrence: in Integer) return TNoeud;
        -- Creer un Noeud à partir d'un char, un nb d'occurrences et un papa :)
    
    function char_Noeud(Noeud: in TNoeud) return character;
        -- retourne le charactère contenu dans le Noeud

    function occurrence_Noeud(Noeud: in TNoeud) return Integer;
        -- Retourne le nombre d'occurrence du TNoeud
        
    function ajout_Occurrence(Noeud: in TNoeud; N: in Integer) return TNoeud;
        -- Modifie le Noeud avec ses occurrences augmentées du nombre passé en paramètre
        
    function suppr_Occurrence(Noeud: in TNoeud) return TNoeud;
        -- retourne un TNoeud avec ses occurrences à 0
    
    function hash_Char(Noeud: in TNoeud) return integer;
        -- retourne un int supposé unique (sans collisions) en fonction du char du noeud
    
    private
        type TNoeud is record
            char: character;
            occurrences: integer;
        end record;

end PNoeud;