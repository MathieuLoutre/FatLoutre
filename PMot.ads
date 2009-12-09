with PListe_Gen;

package PMot is
   
    type TMot is private;
        
        private function significatif(TMot) return Boolean;
            -- Retourne True si le mot est significatif, False sinon

        private function prefixe(TMot, TMot) return Boolean;
            -- Retourne True si le mot2 est le préfixe de mot1, False sinon

        private function suffixe(TMot, TMot) return Boolean;
        	-- Retourne True si le mot2 est suffixe de mot2, False sinon

        private function facteur(TMot, TMot) return Boolean;
        	-- Retourne True si le mot2 est facteur du mot1, False sinon
        
        private function mot_superieur(TMot, TMot) return Boolean;
            -- Retourne True si le mot2 est superieur au Mot1, False sinon
        
        private function mots_egaux(TMot, TMot) return Boolean
            -- Retourne True si les 2 mots sont égaux, False sinon
        
        procedure affiche_mot(TMot);
            -- Affiche le mot donné
    
    private
        package Liste_Char is new PListe_Gen (Character, Put, =, >); use Liste_Char;
        type TMot is new Liste_Char.TPtrCellule;

end Pmot;
