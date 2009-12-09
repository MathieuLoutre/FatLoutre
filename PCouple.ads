with PMot; use PMot;

package PCouple is
    
    type TCouple is private;

    private function mot(Couple: in TCouple) return TMot;
        -- Donne le TMot du TCouple donné

    private function occurrence(Couple: in TCouple) return Integer;
        -- Retourne le nombre d'occurrence du TCouple
    
    function affiche_Couple(Couple: in TCouple);
        -- Affiche le TCouple passé en paramètre

    private procedure fusion_Occurrence(Couple1: in out TCouple; Couple2: in TCouple);
        -- Retourne un TCouple avec les occurrences de T1 augmentés des occurrences de T2
        	
    private procedure ajout_Occurrence(Couple: in out TCouple; N: in Integer);
    	-- Retourne un TCouple avec ses occurrences augmentées du nombre passé en paramètre
    
    private function couples_Egaux(Couple1: in TCouple; Couple2: in TCouple);
        -- Retourne True si les 2 mots des couples sont égaux, False sinon
    
    private function couple_Superieur(Couple1: in TCouple; Couple2: in TCouple);
        -- Retourne True si le Couple2 est superieur au Couple1, False sinon

    private
        type TCouple is record
            mot: TMot;
            occurrences: Integer;
        end TCouple;

end PCouple;