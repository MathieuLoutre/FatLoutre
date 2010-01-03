--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pcouple.adb

package body PCouple is

    procedure affiche_Couple(Couple: in TCouple) is
    begin
    	affiche_Mot(mot_Couple(Couple));
    	put(occurrence(Couple));
    	new_line;
    end affiche_Couple;
    
    function creer_Couple(Mot: in TMot; Occurrence: in Integer) return TCouple is
    begin
        return TCouple'(Mot, Occurrence);
    end creer_Couple;
    
    function ajout_Occurrence(Couple: in TCouple; N: in Integer) return TCouple is
          Couple_Temp: TCouple := Couple;
      begin
         	Couple_Temp.occurrences := occurrence(Couple) + N;
         	return Couple_Temp;
      end ajout_Occurrence;
    
     -- Ces fonctions sont utilisés pour instancier les fonctions génériques du packages
     -- Egalité, suppression, etc...
     function couples_Egaux_Mot(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
     begin
         return mots_Egaux(mot_Couple(Couple1), mot_Couple(Couple2));
         -- Ici on ne compare que sur les mots, on revient à faire un rename du mots_egaux
     end couples_Egaux_Mot;

     function couple_Inferieur_Mot(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
     begin
         return not (mot_Superieur(mot_Couple(Couple1), mot_Couple(Couple2)));
         -- On compare l'inférorité sur les mots, ce que revient à faire un not superieur
     end couple_Inferieur_Mot;

     function couple_Superieur_Occurrence(Couple1: in TCouple; Couple2: in TCouple) return Boolean is
     begin
         return occurrence(Couple2) > occurrence(Couple1);
         -- Pour comparer les occurences on peut utiliser directement l'operateur d'ADA
     end couple_Superieur_Occurrence;
    
    -- Getters sur les attributs du couple
    function mot_Couple(Couple: in TCouple) return TMot is
    begin
    	return Couple.mot;
    end mot_Couple;
		
    function occurrence(Couple: in TCouple) return Integer is
    begin
    	return Couple.occurrences;
    end occurrence;
    

end PCouple;