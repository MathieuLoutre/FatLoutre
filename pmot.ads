with PListe_Gen;
with Text_IO; use Text_IO;

package PMot is
    
    package Liste_Char is new PListe_Gen(Character, Put); use Liste_Char;
    subtype TMot is TPtrCellule;    
        
    procedure affiche_Mot(Mot: in TMot);
        -- Affiche le mot donné
        
    function creer_Mot return TMot;
    
    function mot_Vide(Mot: in TMot) return Boolean;
    
    function longueur_Mot(Mot: in TMot) return Integer;
    
    function ajout_Lettre_Fin(Mot: in TMot; N: in Character) return TMot;
        
    function valeur_Mot(Mot: in TMot) return Character;
    
    function lettre_Suivante(Mot: in TMot) return TMot;
    
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
  
    private
        
        function est_Petit_Mot(Mot: in TMot) return Boolean;
        	-- True si le mot est présent dans petits-mots, False sinon

end Pmot;
