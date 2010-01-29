--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptrio.adb
--
-- Le Trio est l'unité de base de la liste de Trio. Elle contient un Tmot et un integer.
-- Le paquetage dédié permet une meilleure abstraction si on doit changer de structure ou rajouter des éléments
-- Les Trios sont une structure de données qui permet de gerer les éléments provenant de 2 textes différents
-- On peut ainsi gerer le nombre d'occurrence des 2 textes

package body PTrio is
    
    -- Affiche le Trio passé en paramètre
    -- On fait appel à la d'affichage du mot, et on va chercher les occurrences dans les 2 textes
    procedure affiche_Trio(Trio: in TTrio) is
    begin
    	affiche_Mot(mot_Trio(Trio));
    	put(occurrence_Texte1(Trio));
	    put(occurrence_Texte2(Trio));
    	new_line;
    end affiche_Trio;
    
    -- Retourne un Trio avec le mot du Trio1 et les occurrences respectivement additionnées des 2 trios
    function ajout_Occurrence_Trio(Trio1: in TTrio; Trio2: in TTrio) return TTrio is
          Trio_Temp: TTrio := Trio1;
      begin
          Trio_Temp.occurrences_Texte1 := occurrence_Texte1(Trio1) + occurrence_Texte1(Trio2);
          Trio_Temp.occurrences_Texte2 := occurrence_Texte2(Trio1) + occurrence_Texte2(Trio2);
          return Trio_Temp;
      end ajout_Occurrence_Trio;
    
    -- Retourne un Trio composé des paramètres donnés à la fonction
    function creer_Trio(Mot: in TMot; Occurrence1: in Integer; Occurrence2: in Integer) return TTrio is
    begin
        return TTrio'(Mot, Occurrence1, Occurrence2);
    end creer_Trio;
    
    -- Utilise la même méthode de comparaison que Couple inferieur, en utilisant la comparaison sur les mots
    function trio_Inferieur_Mot(Trio1: in TTrio; Trio2: in TTrio) return Boolean is
     begin
         return not (mot_Superieur(mot_Trio(Trio1), mot_Trio(Trio2)));
         -- On compare l'inférorité sur les mots, ce que revient à faire un not superieur
     end trio_Inferieur_Mot;

    -- Getters sur les attributs du Trio
    function mot_Trio(Trio: in TTrio) return TMot is
    begin
    	return Trio.mot;
    end mot_Trio;
		
    function occurrence_Texte1(Trio: in TTrio) return Integer is
    begin
    	return Trio.occurrences_Texte1;
    end occurrence_Texte1;
    
    function occurrence_Texte2(Trio: in TTrio) return Integer is
    begin
    	return Trio.occurrences_Texte2;
    end occurrence_Texte2;
    
    function trio_Superieur_Occurrence(Trio1: in TTrio; Trio2: in TTrio) return Boolean is
    begin
        return Trio2.occurrences_Texte1 + Trio2.occurrences_Texte2 > Trio1.occurrences_Texte1 + Trio1.occurrences_Texte1;
    end trio_Superieur_Occurrence;

end PTrio;
