--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pnoeud.adb
--
-- Le Noeud est l'unité de base des Tries. Elle sert ici à l'instanciation d'une Tree avec des characteres.
-- C'est ici qu'on décide la fonction de hashage qui servira à rentrer ces éléments là dans une case de la table de hashage.

package body PNoeud is
    
    function creer_Noeud(Char: in character; Occurrence: in Integer) return TNoeud is
        Noeud: TNoeud;
    begin
        Noeud.char := Char;
        Noeud.occurrences := Occurrence;
        
        return Noeud;
    end creer_Noeud;
      
    function char_Noeud(Noeud: in TNoeud) return character is
    begin
        return Noeud.char;
    end char_Noeud;

    function occurrence_Noeud(Noeud: in TNoeud) return Integer is
    begin
        return Noeud.occurrences;
    end occurrence_Noeud;
    
    function ajout_Occurrence(Noeud: in TNoeud; N: in Integer) return TNoeud is
        MehNoeud: TNoeud := Noeud;
    begin
        MehNoeud.occurrences := MehNoeud.occurrences + N;
        return MehNoeud;
    end ajout_Occurrence;
    
    function suppr_Occurrence(Noeud: in TNoeud) return TNoeud is
        MehNoeud: TNoeud := Noeud;
    begin
        MehNoeud.occurrences := 0;
        return MehNoeud;
    end suppr_Occurrence;
     
    -- Pour un Noeud donné, elle décide en fonction du charactère contenu une valeure
    -- qui permettra de la retrouver rapidement par la suite
    function hash_Char(Noeud: in TNoeud) return integer is
        HashMeh: integer;
    begin
        HashMeh := Character'pos(char_Noeud(Noeud)) - 96;
        -- On se base ici sur la position des characteres dans la table ASCII
        -- On enlève 96 pour obtenir un a = 1 (que les minuscules)
        
        -- On a 2 cas spéciaux car on souhaite aussi retenir le tiret et la quote
        if HashMeh = -57 then -- la quote => 27
            HashMeh := HashMeh + 84;
        elsif HashMeh = -51 then -- le tiret => 28
            HashMeh := HashMeh + 79;
        elsif HashMeh not in 1..26 then 
        -- Si c'est aucun des 2, et que ce n'est pas dans l'alphabet minuscule, c'est un
        -- cas innatendu, on met 0, si jamais on a besoin de checker (produit un access check)
            HashMeh := 0;
        end if;
        
        return HashMeh; 
    end hash_Char;
    
end PNoeud;