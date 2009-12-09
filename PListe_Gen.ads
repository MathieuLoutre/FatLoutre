generic
    type TElem is private;
    with procedure affiche (E: in TElem);
    with function egaux (Tete1: in TElem; Tete2: in TElem) return Boolean;
    with function superieur (Tete1: in TElem; Tete2: in TElem) return Boolean
      
package PListe_Gen is
      
    type TPtrCellule is private;

    procedure creer_Liste (Tete: out TPtrCellule);
        -- Créé une liste vide
   
    private procedure ajout_Fin (Tete: in out TPtrCellule; E: in TElem) return TPtrCellule
        -- Ajoute un élément en fin de liste

    private procedure ajout_Debut (Tete: in out TPtrCellule; E: in TElem);
        -- Ajoute un élément en début de liste
    
    private procedure insert_trie_Croissant (Tete: in out TPtrCellule; E: in TElem);
    	-- Insert l'élément à sa place dans la liste (croissante)
    	-- Utilise la fonction egal et superieur passé en paramètre du package générique
    
    private function vide (Tete: in TPtrCellule) return Boolean;
    	-- Retourne True si la liste est vide, False sinon

    private function valeur (Tete: in TPtrCellule) return TElem;
    	-- Retourne la valeur du premier élément de la liste. 
    	-- Retourne une erreur si la cellule est vide

    private function suivant (Tete: in TPtrCellule) return TPtrCellule;
    	-- Retourne l'élément suivant de la liste.
    	-- Retourne une erreur si la cellule est vide
    	
    function longueur (Tete: in TPtrCellule) return Integer;
       -- Retourne la taille de la liste

    private function copie (Tete: in TPtrCellule) return TPtrCellule;
    	-- Retourne une copie de la liste donnée

    private procedure supprimer (Tete: in TPtrCellule; E: in TElem) return TPtrCellule;
    	-- Retourne une liste sans le premier TElem rencontré
    	-- Retourne la même liste si le TElem n'est pas dans la liste

    procedure affiche_Liste (Tete: in TPtrCellule);
    	-- Parcours la liste et affiche à l'aide de la fonction affiche passée en paramètre du package générique

    private function listes_Egales (Tete1: in TPtrCellule; Tete1: in TPtrCellule) => Bool
    	-- Retourne Vrai si les 2 listes sont égales. Utilise la fonction egal passée en paramètre du package générique
   
    private
        type TCellule;
        type TPtrCellule is access TCellule;
        type TCellule is record
            val: TElem;
            suiv: TPtrCellule;
        end record;

end PListe_Gen;
      
   
