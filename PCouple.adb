package body PCouple is

    function mot(Couple: in TCouple) return TMot is
    begin
    	return Couple.val_mot;
    end mot;
		
    function occurrence(Couple: in TCouple) return Integer is
    begin
    	return Couple.occurrences;
    end occurrence;

    procedure affiche_Couple(Couple: in TCouple) is
    begin
    	affiche_Mot(mot(Couple));
    	put(occurrence(Couple));
    end affiche_Couple;

    procedure fusion_Occurrence(Couple1: in out TCouple; Couple2: in TCouple) is
    begin
    	ajout_Occurrence(Couple1, occurrence(Couple2));
    end fusion_Occurrence;
       	
    procedure ajout_Occurrence(Couple: in out TCouple; N: in Integer) is
    begin
       	Couple.occurrences := occurrence(Couple) + N;
    end ajout_Occurrence;

    function couples_Egaux(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
    begin
        return mots_Egaux(mot(Couple1), mot(Couple2));
    end couples_Egaux;

    function couple_Superieur(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
    begin
        return mot_Superieur(mot(Couple1), mot(Couple2));
    end couple_Superieur;
    
    procedure creer_Couple(Couple: out TCouple; Mot: in TMot; Occurrence: in Integer) is
    begin
        Couple := TCouple'(Mot, Occurrence);
    end creer_Couple;

end PCouple;