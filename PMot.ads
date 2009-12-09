with PListe_Gen;
with Text_IO; use Text_IO;
with PFichier; use PFichier;

package PMot is
   
    type TMot is private;    
        
    procedure affiche_Mot(Mot: in TMot);
        -- Affiche le mot donné
        
    procedure creer_Mot(Mot: out TMot);
    
    function mot_Vide(Mot: in TMot) return Boolean;
    
    function mot_superieur(Mot1: in TMot; Mot2: in TMot) return Boolean;
        -- Retourne True si le mot2 est superieur au Mot1, False sinon

    function mots_egaux(Mot1: in TMot; Mot2: in TMot) return Boolean;
        -- Retourne True si les 2 mots sont égaux, False sinon
    
    private
        package Liste_Char is new PListe_Gen(Character, Put, "=", ">"); use Liste_Char;
        type TMot is new Liste_Char.TPtrCellule;
            
        --function significatif(Mot: in TMot) return Boolean;
            -- Retourne True si le mot est significatif, False sinon
        
        function prefixe(Mot1: in TMot; Mot2: in TMot) return Boolean;
            -- Retourne True si le mot2 est le préfixe de mot1, False sinon

        function suffixe(Mot1: in TMot; Mot2: in TMot) return Boolean;
        	-- Retourne True si le mot2 est suffixe de mot2, False sinon

        function facteur(Mot1: in TMot; Mot2: in TMot) return Boolean;
            -- Retourne True si le mot2 est facteur du mot1, False sinon

end Pmot;
