--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pcouple.ads
--
-- Le couple est l'unité de base de la liste de couple. Elle contient un Tmot et un integer.
-- Le paquetage dédié permet une meilleure abstraction si on doit changer de structure ou rajouter des éléments

with PMot; use PMot;
with Text_IO; use Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;

package PCouple is
    
    type TCouple is private;
    
    function creer_Couple(Mot: in TMot; Occurrence: in Integer) return TCouple;
        -- Creer un couple à partir d'un mot et d'un nombre d'occurrence
    
    procedure affiche_Couple(Couple: in TCouple);
        -- Affiche le TCouple passé en paramètre
        
    function couples_Egaux_Mot(Couple1: in TCouple; Couple2: in TCouple) return Boolean;
        -- Retourne True si les 2 mots des couples sont égaux, False sinon

    function couple_Inferieur_Mot(Couple1: in TCouple; Couple2: in TCouple) return Boolean;
        -- Retourne True si le Couple2 est superieur au Couple1, False sinon
    
    function couple_Superieur_Occurrence(Couple1: in TCouple; Couple2: in TCouple) return Boolean;
        -- Retourne True si le Couple2 est superieur au Couple1, False sinon
    
    function mot_Couple(Couple: in TCouple) return TMot;
        -- Donne le TMot du TCouple donné

    function occurrence(Couple: in TCouple) return Integer;
        -- Retourne le nombre d'occurrence du TCouple
        
    function ajout_Occurrence(Couple: in TCouple; N: in Integer) return TCouple;
        -- Retourne un TCouple avec ses occurrences augmentées du nombre passé en paramètre

    private
        type TCouple is record
            mot: TMot;
            occurrences: Integer;
        end record;

end PCouple;