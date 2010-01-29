--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pgros_noeud.adb
--
-- Mimique PNoeud en ajoutant une occurrence supplémentaire 
-- (voir PNoeud pour des commentaires plus approfondis)

package body PGros_Noeud is
    
    function creer_Gros_Noeud(Char: in character; Occurrence1: in Integer; Occurrence2: in Integer) return TGros_Noeud is
        Gros_Noeud: TGros_Noeud;
    begin
        Gros_Noeud.char := Char;
        Gros_Noeud.occurrences1 := Occurrence1;
        Gros_Noeud.occurrences2 := Occurrence2;
        
        return Gros_Noeud;
    end creer_Gros_Noeud;
    
    function char_Gros_Noeud(Noeud: in TGros_Noeud) return character is
    begin
        return Noeud.char;
    end char_Gros_Noeud;
    
    function occurrence1_Gros_Noeud(Gros_Noeud: in TGros_Noeud) return Integer is
    begin
        return Gros_Noeud.occurrences1;
    end occurrence1_Gros_Noeud;
    
    function occurrence2_Gros_Noeud(Gros_Noeud: in TGros_Noeud) return Integer is
    begin
        return Gros_Noeud.occurrences2;
    end occurrence2_Gros_Noeud;
    
    function occurrence_Gros_Noeud(Gros_Noeud: in TGros_Noeud) return Integer is
    begin
        return Gros_Noeud.occurrences1 + Gros_Noeud.occurrences2;
    end occurrence_Gros_Noeud;
    
    function suppr_Occurrence_Gros(Gros_Noeud: in TGros_Noeud) return TGros_Noeud is
        MehNoeud: TGros_Noeud := Gros_Noeud;
    begin
        MehNoeud.occurrences1 := 0;
        MehNoeud.occurrences2 := 0;
        return MehNoeud;
    end suppr_Occurrence_Gros;
    
    function ajout_Occurrence_Gros(Gros_Noeud: in TGros_Noeud; N1: in Integer; N2: in Integer) return TGros_Noeud is
        MehGros_Noeud: TGros_Noeud := Gros_Noeud;
    begin
        MehGros_Noeud.occurrences1 := MehGros_Noeud.occurrences1 + N1;
        MehGros_Noeud.occurrences2 := MehGros_Noeud.occurrences2 + N2;
        return MehGros_Noeud;
    end ajout_Occurrence_Gros;
     
    function hash_Char(Gros_Noeud: in TGros_Noeud) return integer is
        HashMeh: integer;
    begin
        HashMeh := Character'pos(char_Gros_Noeud(Gros_Noeud)) - 96;
        
        if HashMeh = -57 then -- la quote => 27
            HashMeh := HashMeh + 84;
        elsif HashMeh = -51 then -- le tiret => 28
            HashMeh := HashMeh + 79;
        elsif HashMeh not in 1..26 then 
        -- Cas innatendu, on met 0, si jamais on a besoin de checker (produit un access check)
            HashMeh := 0;
        end if;
        
        return HashMeh; 
    end hash_Char;
    
end PGros_Noeud;