package body PNoeud is
    
    function creer_Noeud(Char: in character; Occurrence: in Integer) return TNoeud is
        Noeud: TNoeud;
    begin
        Noeud.char := Char;
        Noeud.occurrences := Occurrence;
        
        return Noeud;
    end creer_Noeud;
       
    function Noeuds_Egaux_Mot(Noeud1: in TNoeud; Noeud2: in TNoeud) return Boolean is
    begin
        return char_Noeud(Noeud1) = char_Noeud(Noeud2);
    end Noeuds_Egaux_Mot;
   
    function Noeud_Superieur_Occurrence(Noeud1: in TNoeud; Noeud2: in TNoeud) return Boolean is
    begin
        return occurrence_Noeud(Noeud1) > occurrence_Noeud(Noeud2);
    end Noeud_Superieur_Occurrence;
   
    function char_Noeud(Noeud: in TNoeud) return character is
    begin
        return Noeud.char;
    end char_Noeud;

    function occurrence_Noeud(Noeud: in TNoeud) return Integer is
    begin
        return Noeud.occurrences;
    end occurrence_Noeud;
    
    procedure affiche_Noeud(Noeud: in TNoeud) is
    begin
        put(Noeud.char);
        --put_line(integer'image(Noeud.occurrences));
        
    end affiche_Noeud;
    
    function ajout_Occurrence(Noeud: in TNoeud; N: in Integer) return TNoeud is
        MehNoeud: TNoeud := Noeud;
    begin
        MehNoeud.occurrences := MehNoeud.occurrences + N;
        return MehNoeud;
    end ajout_Occurrence;
      
    function hash_Char(Noeud: in TNoeud) return integer is
        HashMeh: integer;
    begin
        HashMeh := Character'pos(char_Noeud(Noeud)) - 96;
        
        if HashMeh = -57 then -- la quote => 27
            HashMeh := HashMeh + 84;
        elsif HashMeh = -44 then -- le tiret => 28
            HashMeh := HashMeh + 72;
        elsif HashMeh not in 1..26 then -- Cas innatendu, on met 0, si jamais on a besoin de checker
            HashMeh := 0;
        end if;
        
        return HashMeh; 
    end hash_Char;
    
end PNoeud;