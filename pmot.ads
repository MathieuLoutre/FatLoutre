--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pmot.adb
--
-- Une liste de character utilisant pliste_gen. Utilisation de la liste plutôt
-- que les strings car non bornée, parcours et opérations faciles et connus.

with PListe_Gen;
with Text_IO; use Text_IO;

package PMot is
    
    package Liste_Char is new PListe_Gen(Character, Put); use Liste_Char;
    subtype TMot is TPtrCellule;    
        
    procedure affiche_Mot(Mot: in TMot);
        -- Affiche le mot donné
        
    function creer_Mot return TMot;
        -- Créé un mot vide
    
    function mot_Vide(Mot: in TMot) return Boolean;
        -- Retourne vrai si le mot est vide, faux sinon
    
    function longueur_Mot(Mot: in TMot) return Integer;
        -- retourne la longueur du mot
    
    function ajout_Lettre_Fin(Mot: in TMot; N: in Character) return TMot;
        -- Ajoute une lettre en fin de mot
        
    function valeur_Mot(Mot: in TMot) return Character;
        -- Retourne la valeur de la première lettre du mot
    
    function lettre_Suivante(Mot: in TMot) return TMot;
        -- Retourne l'adresse de la lettre suivante
        -- Retourne vide si il n'y a pas de lettre suivante
    
    function mot_Superieur(Mot1: in TMot; Mot2: in TMot) return Boolean;
        -- Retourne True si le mot2 est superieur au Mot1, False sinon
        -- On pourrait éventuellement faire un mot_Inferieur si not mot_Superieur est bancal
        -- => Pourrait devenir générique avec relation d'ordre générique aussi
    
    function significatif(Mot: in TMot) return Boolean;
        -- Retourne True si le mot est significatif, False sinon
        
    function prefixe(Mot1: in TMot; Mot2: in TMot) return Boolean;
        -- Retourne True si le mot2 est le préfixe de mot1, False sinon

    function suffixe(Mot1: in TMot; Mot2: in TMot) return Boolean;
    	-- Retourne True si le mot2 est suffixe de mot2, False sinon

    function facteur(Mot1: in TMot; Mot2: in TMot) return Boolean;
        -- Retourne True si le mot2 est facteur du mot1, False sinon
        
    function mots_Egaux is new listes_Egales("=");
        -- On utilise l'égalité pour faire la comparaison des mots
  
    function mot_to_Int(Mot: in TMot) return Integer;
        -- Permet de convertir des Mots en integer
        -- Cette fonction est utile pour convertir le nombre d'occurrence récupérée
        -- En integer pour régénérer la liste
  
    private
        function est_Petit_Mot(Mot: in TMot) return Boolean;
        	-- True si le mot est présent dans petits-mots.txt, False sinon

end Pmot;
