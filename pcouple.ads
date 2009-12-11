with PMot; use PMot;
with Text_IO; use Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;

package PCouple is
    
    type TCouple is private;
    
    function creer_Couple(Mot: in TMot; Occurrence: in Integer) return TCouple;
    
    procedure affiche_Couple(Couple: in TCouple);
        -- Affiche le TCouple passé en paramètre
        
    function couples_Egaux(Couple1: in TCouple; Couple2: in TCouple) return Boolean;
        -- Retourne True si les 2 mots des couples sont égaux, False sinon

    function couple_Superieur(Couple1: in TCouple; Couple2: in TCouple) return Boolean;
        -- Retourne True si le Couple2 est superieur au Couple1, False sinon
    
    function mot_Couple(Couple: in TCouple) return TMot;
        -- Donne le TMot du TCouple donné

    function occurrence(Couple: in TCouple) return Integer;
        -- Retourne le nombre d'occurrence du TCouple
        
    procedure ajout_Occurrence(Couple: in out TCouple; N: in Integer);
        -- Retourne un TCouple avec ses occurrences augmentées du nombre passé en paramètre

    private
        type TCouple is record
            mot: TMot;
            occurrences: Integer;
        end record;
            
        procedure fusion_Occurrence(Couple1: in out TCouple; Couple2: in TCouple);
            -- Retourne un TCouple avec les occurrences de T1 augmentés des occurrences de T2

end PCouple;