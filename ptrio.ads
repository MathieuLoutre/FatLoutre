--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptrio.ads
--
-- Le Trio est l'unité de base de la liste de Trio. Elle contient un Tmot et un integer.
-- Le paquetage dédié permet une meilleure abstraction si on doit changer de structure ou rajouter des éléments
-- Les Trios sont une structure de données qui permet de gerer les éléments provenant de 2 textes différents
-- On peut ainsi gerer le nombre d'occurrence des 2 textes

with PMot; use PMot;
with Text_IO; use Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;

package PTrio is
    
    type TTrio is private;
    
    function creer_Trio(Mot: in TMot; Occurrence1: in Integer; Occurrence2: in Integer) return TTrio;
        -- Creer un trio à partir d'un mot et de 2 nombres d'occurrence
    
    function ajout_Occurrence_Trio(Trio1: in TTrio; Trio2: in TTrio) return TTrio;
        -- Retourne un Trio avec le mot du Trio1 et les occurrences respectivement additionnées des 2 trios
    
    procedure affiche_Trio(Trio: in TTrio);
        -- Affiche le TTrio passé en paramètre

    function mot_Trio(Trio: in TTrio) return TMot;
        -- Donne le TMot du TTrio donné

    function trio_Inferieur_Mot(Trio1: in TTrio; Trio2: in TTrio) return Boolean;
        -- Retourne True si le Trio2 est superieur au Trio1, False sinon
    
    function occurrence_Texte1(Trio: in TTrio) return Integer;
        -- Retourne le nombre d'occurrence du texte 1 du TTrio
     
    function occurrence_Texte2(Trio: in TTrio) return Integer;
        -- Retourne le nombre d'occurrence du texte 2 TTrio   

    private
        type TTrio is record
            mot: TMot;
            occurrences_texte1: Integer;
	        occurrences_texte2: Integer;
        end record;

end PTrio;
