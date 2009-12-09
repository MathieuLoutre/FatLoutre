with PListe_Gen;
with PCouple; use PCouple;
with PMot; use PMot;
with PFichier; use PFichier;

package PListe_Couple is

    type TListe_Couple is private;
    
        function nb_Superieur(Tete: in TListe_Couple; N: in Integer) return Integer
        	-- Retourne le nombre de mot de longueur supérieur au nb passé

        function nb_Mots_Differents(Tete: in TListe_Couple) return Integer
        	-- Renvoi le nombre de mots significatifs différents (utilise seulement longueur de la liste)

        function nb_Total_Occurrence(Tete: in TListe_Couple) return Integer
        	-- Renvoi le nombre total de mots significatifs

        function nb_Prefixe(Tete: in TListe_Couple; Mot: in TMot) return Integer
        	-- Renvoi le nombre de mot ayant mot1 pour préfixe
        	-- Renvoi 0 si il n'y en a pas

        function nb_Suffixe(Tete: in TListe_Couple; Mot: in TMot) return Int
        	-- Renvoi le nombre de mot ayant mot1 pour suffixe
        	-- Renvoi 0 si il n'y en a pas

        function nb_Facteur(Tete: in TListe_Couple; Mot: in TMot) => Int
        	-- Renvoi le nombre de mot ayant mot1 pour facteur
        	-- Renvoi 0 si il n'y en a pas

        function moy_Longueur(Tete: in TListe_Couple) return Integer
        	-- Renvoi la moyenne de la longueur des mots

        function moy_Occurrence(Tete: in TListe_Couple) return Integer
        	-- Renvoi la moyenne de l'occurrence des mots
        
        function nb_Occurrences(Tete: TListeCouple; Mot: TMot) return Integer
            -- Renvoi le nombre de fois où apparait le mot donné dans la liste

        private procedure ajout_Mot(Tete: in TListe_Couple; Mot: in TMot)
        	-- Ajoute un nouveau couple contenant le mot si le mot n'est pas déjà présent, sinon augmente son occurrence de 1

        function gen_Fichier(Tete: in TListe_Couple) return TFichier
        	-- Génère le fichier liste-mots à partir d'une liste de couple

        private function tri_Decroissant_Occurrences(Tete: in TListe_Couple) return TListe_Couple
        	-- Retourne la liste de couple triée sur le nombre d'occurrences de manière croissante
        
        procedure affichage_Decroissant(Tete: in TListe_Couple; N: in Integer);
            -- Affiche les N premiers éléments de la liste ordonné par leurs occurrences décroissantes.
        
        procedure fusion_Couples(Tete: in TListe_Couple; Mot1: in TCouple; Mot2: in TMot);
            -- Augmente les occurrences de Couple1 de celles de Couple2 et supprime Couple2 de la liste
            -- Retourne une erreur si un des 2 mots ou les 2 ne sont pas dans la liste
            
    private
        package Liste_Couple is new PListe_Gen(TCouple, affiche_Couple, couples_Egaux, couple_Superieur); use Liste_Couple;
        type TListe_Couple is new Liste_Couple.TPtrCellule;
   
end PListe_Couple;
