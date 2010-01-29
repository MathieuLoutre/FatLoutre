--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/arn_gen.ads
--
with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PMot; use PMot;
with text_io; use text_io;

package PARN is
      
    type TARN is private;

    function creer_ARN return TARN;
        -- Créé un ARN vide

    function est_Racine (T: in TARN) return boolean;
    -- retourne vrai si T est racine, faux sinon
    -- Retourne vide si l'ARN est vide

    function nb_Noeuds(T: TARN) return integer;
    -- retourne le nombre de noeuds dans l'arbre T

    function frere (T: in TARN) return TARN;
    -- Retourne le frere de T
    -- Retourne vide si l'ARN est vide

    function oncle (T: in TARN) return TARN;
    -- Retourne le oncle de T
    -- Retourne vide si l'ARN est vide

    function est_Fils_Droit(T: in TARN) return Boolean;
    -- Retourne Vrai si T est le fils droit de son pere, faux sinon
    -- Retourne vide si l'ARN est vide

    function hauteur (T: in TARN) return Integer;
       -- Retourne la hauteur de l'ARN

    function arn_Vide (T: in TARN) return Boolean;
    	-- Retourne True si l'ARN est vide, False sinon

    function valeur (T: in TARN) return TCouple;
    	-- Retourne la valeur du premier élément de l'ARN. 
    	-- Retourne une erreur si la cellule est vide (l'erreur d'ADA)

    function fils_Gch (T: in TARN) return TARN;
    	-- Retourne le fils gauche de la Cellule
    	-- Retourne vide si l'ARN est vide

    function pere (T: in TARN) return TARN;
    	-- Retourne le pere de la Cellule
    	-- Retourne vide si l'ARN est vide

    function fils_Drt (T: in TARN) return TARN;
    	-- Retourne le fils droit de la Cellule
    	-- Retourne vide si l'ARN est vide
    
    procedure modif_Val(T: in out TARN; N: in TCouple);
        -- Modifie la valeur (T.val) de T avec N

    function chercher_Noeud(T: in TARN; M: TMot) return TARN;
	-- Cherche le noeud qui 

    function ajout_Elem(T: in TARN; N: in TCouple) return TARN;
    -- Ajoute un élément à sa place dans l'ARN

    function ChercheSupprimeFilsMin(T: TARN) return TCouple;
	-- Cherche le fils minimum de T et le supprime
	-- T n'est pas vide

    function supprimer_Elem (T: in TARN; N: in TCouple) return TARN;
    -- Retourne un ARN sans le premier TCouple rencontré
    -- Retourne le même ARN si le TCouple n'est pas dans l'ARN

    procedure affiche_ARN (T: in TARN; N: Integer);
    	-- Parcours l'ARN et affiche à l'aide de la fonction affiche passée en paramètre du package générique

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    function nb_Occurrences_ARN(T: TARN; Mot: TMot) return Integer;
        -- Renvoi le nombre de fois où apparait le mot donné dans la liste

    function nb_Prefixe_ARN(T: in TARN; Mot: in TMot) return Integer;
    	-- Renvoi le nombre de mot ayant mot1 pour préfixe
    	-- Renvoi 0 si il n'y en a pas

    function nb_Suffixe_ARN(T: in TARN; Mot: in TMot) return Integer;
    	-- Renvoi le nombre de mot ayant mot1 pour suffixe
    	-- Renvoi 0 si il n'y en a pas

    function nb_Facteur_ARN(T: in TARN; Mot: in TMot) return Integer;
    	-- Renvoi le nombre de mot ayant mot1 pour facteur.
    	-- Renvoi 0 si il n'y en a pas
    
    function ajout_Mot_ARN(T: in TARN; M: in TMot) return TARN;
        -- Ajoute un élément à sa place dans l'ARN
    
    function fusion_Mots_ARN(T: in TARN; Mot1: in TMot; Mot2: in TMot) return TARN;
        -- Augmente les occurrences de Couple1 de celles de Couple2 et supprime Couple2 de la liste
        -- Retourne une erreur si un des 2 mots ou les 2 ne sont pas dans la liste  

    function tot_Longueur_ARN(T: in TARN) return Float;
	-- Renvoi la somme de la longueur des mots

    function moy_Longueur_ARN(T: in TARN) return Float;
    	-- Renvoi la moyenne de la longueur des mots

    function moy_Occurrence_ARN(T: in TARN) return Float;
    	-- Renvoi la moyenne de l'occurrence des mots

    function nb_Superieur_ARN(T: in TARN; N: in Integer) return Integer;
    	-- Retourne le nombre de mot différents de longueur supérieur au nb passé

    function present_ARN(T: in TARN; Mot: in TMot) return Boolean;
        -- retourne True si le mot est présent dans la liste, faux sinon

    function valeur_Couple(T: in TARN) return TCouple;
    	-- Retourne la valeur du premier élément de la liste. 
    	-- Retourne une erreur si la cellule est vide

    function nb_Total_Occurrence_ARN(T: in TARN) return Integer;
    	-- Renvoi le nombre total de mots significatifs


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

    procedure arnToListe(T: in TARN; L: in out TListe_Couple);
	-- Traduit l'ARN passé en paramêtre en Liste de Couple

    private
        type TCellule;
        type TARN is access TCellule;
        type TCellule is record
            val: TCouple;
            fgch: TARN;
	    fdrt: TARN;
	    pere: TARN;
        end record;
        
end PARN;