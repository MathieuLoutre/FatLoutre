--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pgros_noeud.ads
--
-- Mimique PNoeud en ajoutant une occurrence supplémentaire 
-- (voir PNoeud pour des commentaires plus approfondis)
-- C'est l'équivalent des Trios pour les listes

with text_io; use text_io;

package PGros_Noeud is
    
    type TGros_Noeud is private;
    
    function creer_Gros_Noeud(Char: in character; Occurrence1: in Integer; Occurrence2: in Integer) return TGros_Noeud;
        -- Creer un Gros_Noeud à partir d'un char et de 2 nb d'occurrences
        
    function char_Gros_Noeud(Noeud: in TGros_Noeud) return character;
        -- retourne le char du gros_Noeud
    
    function occurrence1_Gros_Noeud(Gros_Noeud: in TGros_Noeud) return Integer;
        -- Retourne le nombre d'occurrence du TGros_Noeud
        
    function occurrence2_Gros_Noeud(Gros_Noeud: in TGros_Noeud) return Integer;
        -- Retourne le nombre d'occurrence du TGros_Noeud
    
    function occurrence_Gros_Noeud(Gros_Noeud: in TGros_Noeud) return Integer;
        -- Retourne le nombre d'occurrence du TGros_Noeud
    
    function suppr_Occurrence_Gros(Gros_Noeud: in TGros_Noeud) return TGros_Noeud;
        -- efface les occurrences du Gros Noeud. (Supprime le fait qu'il soit un mot alors !)
    
    function ajout_Occurrence_Gros(Gros_Noeud: in TGros_Noeud; N1: in Integer; N2: in Integer) return TGros_Noeud;
        -- Ajoute les occurrences passée en paramètre au Gros Noeud
        
    function hash_Char(Gros_Noeud: in TGros_Noeud) return integer;
        -- retourne un int unique en fonction du char du Gros_Noeud
    
    private
        type TGros_Noeud is record
            char: character;
            occurrences1: integer;
            occurrences2: integer;
        end record;

end PGros_Noeud;