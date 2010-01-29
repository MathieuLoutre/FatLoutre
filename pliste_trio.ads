--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pliste_trio.ads
--
-- La liste de Trio est une structure similaire à la liste de couple, mais avec des Trios.
-- Elle permet alors de stocker les informations de 2 listes distinctes.
-- Elle comporte aussi moins de fonctions car on a moins de travail à effectuer dessus.

with PListe_Gen;
with PTrio; use PTrio;
with PCouple; use PCouple;
with PListe_Couple; use PListe_Couple;
with PMot; use PMot;
with text_io; use text_io;

package PListe_Trio is
    
    package Liste_Trio is new PListe_Gen(TTrio, affiche_Trio); use Liste_Trio;
    subtype TListe_Trio is TPtrCellule;
    
    function creer_Liste_Trio return TListe_Trio;
        -- Créé un liste de Trios vide
        
    function liste_Trio_Vide(T: in TListe_Trio) return Boolean;
    	-- Retourne True si la liste est vide, False sinon
    	
    function valeur_Trio(T: in TListe_Trio) return TTrio;
    	-- Retourne la valeur du premier élément de la liste. 
    	-- Retourne une erreur si la cellule est vide

    function trio_Suivant(T: in TListe_Trio) return TListe_Trio;
    	-- Retourne l'élément suivant de la liste.
    	-- Retourne une erreur si la cellule est vide
    
    function present_Trio(T: in TListe_Trio; Mot: in TMot) return Boolean;
        -- Renvoi True si le mot est présent dans la liste de Trio, False sinon
    
    function recupere_Trio(T: TListe_Trio; Mot: TMot) return TTrio;
        -- Renvoi le nombre de fois où apparait le mot donné dans la liste
        -- Précondition: le mot DOIT être dans la liste !
    
    procedure affiche_Liste_Trio(T: in TListe_Trio);
        -- Affiche la liste de Trio passée en paramètre
    
    procedure affiche_N_Trio(T: in TListe_Trio; N: in integer);
        -- Affiche la liste de Trio passée en paramètre jusqu'a N
    
    function mots_Communs(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio;
        -- Intersection de 2 listes
    
    function mots_Differents(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio;
        -- Différence de 2 listes
    
    function fusion_Listes(T1: in TListe_Couple; T2: in TListe_Couple) return TListe_Trio;
        -- Union de 2 listes
    
    function ajout_Trio(T: in TListe_Trio; Mot: in TMot; nbOccurTexte1: in Integer; nbOccurTexte2: in Integer) return TListe_Trio;
        -- Ajoute un nouveau Trio contenant le mot si le mot n'est pas déjà présent, 
        -- sinon augmente son occurrence du nombre d'occurrences du Trio donné
    
    function insert_Croissant_Mot is new insert_Trie(Trio_Inferieur_Mot);
        -- Quand on insert croissant des Trios sur les mots, il faut regarder l'infériorité des mots (cf algo insert_trie)
    
    function insert_Decroissant_Occurrence_Trio is new insert_Trie(Trio_Superieur_Occurrence);
        -- Quand on insert croissant des Trios sur les mots, il faut regarder l'infériorité des mots (cf algo insert_trie)
        
    function nb_Mots_Differents_Trio(T: in TListe_Trio) return Integer;   

end PListe_Trio;
