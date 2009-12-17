package body PCouple is

    function mot_Couple(Couple: in TCouple) return TMot is
    begin
    	return Couple.mot;
    end mot_Couple;
		
    function occurrence(Couple: in TCouple) return Integer is
    begin
    	return Couple.occurrences;
    end occurrence;

    procedure affiche_Couple(Couple: in TCouple) is
    begin
    	affiche_Mot(mot_Couple(Couple));
    	put(occurrence(Couple));
    	new_line;
    end affiche_Couple;
       	
    function ajout_Occurrence(Couple: in TCouple; N: in Integer) return TCouple is
        Couple_Temp: TCouple := Couple;
    begin
       	Couple_Temp.occurrences := occurrence(Couple) + N;
       	return Couple_Temp;
    end ajout_Occurrence;

    function couples_Egaux_Mot(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
    begin
        return mots_Egaux(mot_Couple(Couple1), mot_Couple(Couple2));
    end couples_Egaux_Mot;

    function couple_Inferieur_Mot(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
    begin
        return not (mot_Superieur(mot_Couple(Couple1), mot_Couple(Couple2)));
    end couple_Inferieur_Mot;
    -- NEED CHECK ON INSERT TRIE
    
    function couple_Superieur_Occurrence(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
    begin
        return occurrence(Couple2) > occurrence(Couple1);
    end couple_Superieur_Occurrence;
    
    function creer_Couple(Mot: in TMot; Occurrence: in Integer) return TCouple is
    begin
        return TCouple'(Mot, Occurrence);
    end creer_Couple;

end PCouple;