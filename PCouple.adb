package body PCouple is

function mot(Couple: in TCouple) return TMot
	return Couple.mot;
end mot;
		
function occurrence(Couple: in TCouple) return Integer
	return Couple.occurrence;
end occurrence;

procedure affiche_Couple(Couple: in TCouple)
	affiche_Liste(mot(Couple));
	put(occurrence(Couple));
end affiche_Couple;

procedure fusion_Occurrence(Couple1: in out TCouple; Couple2: in out TCouple)
	occurrence(Couple1) := occurrence(Couple1) + occurrence(Couple2);
end fusion_Occurrence;
       	
procedure ajout_Occurrence(Couple: in out TCouple; N: in Integer);
   	occurrence(Couple) := occurrence(Couple) + N;

function couples_Egaux(Couple1: in TCouple; Couple2: in TCouple) return Boolean
    return mots_egaux(mot(Couple1), mot(Couple2));
end couples_Egaux;

function couple_Superieur(Couple1: in TCouple; Couple2: in TCouple) return Boolean
    return mot_Superieur(mot(Couple1), mot(Couple2));
end couple_Superieur;

end PCouple;