--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_couple.ads

with PListe_Gen;
with PCouple; use PCouple;
with PMot; use PMot;
with text_io; use text_io;

package PListe_Couple is
    
    package Liste_Couple is new PListe_Gen(TCouple, affiche_Couple); use Liste_Couple;
    subtype TListe_Couple is TPtrCellule;
    
    function creer_Liste_Couple return TListe_Couple;
        -- Créé un liste de couples vide
        
    function liste_Couple_Vide(T: in TListe_Couple) return Boolean;
    	-- Retourne True si la liste est vide, False sinon
    	
    function valeur_Couple(T: in TListe_Couple) return TCouple;
    	-- Retourne la valeur du premier élément de la liste. 
    	-- Retourne une erreur si la cellule est vide

    function couple_Suivant(T: in TListe_Couple) return TListe_Couple;
    	-- Retourne l'élément suivant de la liste.
    	-- Retourne une erreur si la cellule est vide
    
    function nb_Superieur(T: in TListe_Couple; N: in Integer) return Integer;
    	-- Retourne le nombre de mot différents de longueur supérieur au nb passé

    function nb_Mots_Differents(T: in TListe_Couple) return Integer;
    	-- Renvoi le nombre de mots significatifs différents (utilise seulement longueur de la liste)

    function nb_Total_Occurrence(T: in TListe_Couple) return Integer;
    	-- Renvoi le nombre total de mots significatifs

    function nb_Prefixe(T: in TListe_Couple; Mot: in TMot) return Integer;
    	-- Renvoi le nombre de mot ayant mot1 pour préfixe
    	-- Renvoi 0 si il n'y en a pas

    function nb_Suffixe(T: in TListe_Couple; Mot: in TMot) return Integer;
    	-- Renvoi le nombre de mot ayant mot1 pour suffixe
    	-- Renvoi 0 si il n'y en a pas

    function nb_Facteur(T: in TListe_Couple; Mot: in TMot) return Integer;
    	-- Renvoi le nombre de mot ayant mot1 pour facteur.
    	-- Renvoi 0 si il n'y en a pas

    function moy_Longueur(T: in TListe_Couple) return Float;
    	-- Renvoi la moyenne de la longueur des mots

    function moy_Occurrence(T: in TListe_Couple) return Float;
    	-- Renvoi la moyenne de l'occurrence des mots
    
    function nb_Occurrences(T: TListe_Couple; Mot: TMot) return Integer;
        -- Renvoi le nombre de fois où apparait le mot donné dans la liste

    procedure affichage_Decroissant(T: in TListe_Couple; N: in Integer);
        -- Affiche les N premiers éléments de la liste ordonné par leurs occurrences décroissantes.
    
    function fusion_Mots(T: in TListe_Couple; Mot1: in TMot; Mot2: in TMot) return TListe_Couple;
        -- Augmente les occurrences de Couple1 de celles de Couple2 et supprime Couple2 de la liste
        -- Retourne une erreur si un des 2 mots ou les 2 ne sont pas dans la liste
    
    function ajout_Mot(T: in TListe_Couple; Mot: in TMot) return TListe_Couple;
        -- Ajoute un nouveau couple contenant le mot si le mot n'est pas déjà présent, 
        -- sinon augmente son occurrence de 1
    
    function present(T: in TListe_Couple; Mot: in TMot) return Boolean;
        -- retourne True si le mot est présent dans la liste, faux sinon
    
    function insert_Croissant_Mot is new insert_Trie(couple_Inferieur_Mot);
        -- Quand on insert croissant des couples sur les mots, il faut regarder l'infériorité des mots (cf algo insert_trie)
    
    private
    
        function insert_Decroissant_Occurrences is new insert_Trie(couple_Superieur_Occurrence);
            -- Quand on veut insert des couples de manière décroisante sur les couples (pour le tri decroissant sur occurrence)
            -- on passe la superiorité sur les occurrences
            
        function supprimer_Couple is new supprimer(couples_Egaux_Mot);
            -- Quand on supprime on regarde l'égalité sur les mots
        
        function tri_Decroissant_Occurrences(T: in TListe_Couple) return TListe_Couple;
            -- Retourne la liste de couple triée sur le nombre d'occurrences de manière croissante
        
   
end PListe_Couple;
