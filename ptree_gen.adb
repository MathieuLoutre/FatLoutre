--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 01/10 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_gen.adb
--
-- Une structure de Tries générique. Elle necessite en plus du type des éléments qu'on souhaite stocker,
-- un int qui désigne le maximum de la table de hashage, et la fonction de hashage correspondante.
-- Avoir une table de hashage permet de stocker le nombre de fils necessaire lors de l'instanciation
-- et ainsi avoir un access instantané aux valeurs souhaitées.

package body PTree_Gen is

    -- Renvoi la racine d'un tries
    function creer_Tree(N: in TElem) return TPtrCellule is
        M: TFils := (others => null);
    begin
        return new TCellule'(N, null, M); -- le père est nul, M est plein de fils vide
    end creer_Tree;
    
    function Tree_Vide return TPtrCellule is
    begin
        return null; -- null est l'unité désignant le vide avec le tries
    end Tree_Vide;

    function elem_Vide(T: in TPtrCellule) return Boolean is
    begin
        return T = null;
    end elem_Vide;
    
    -- Insert un pointeur vers la cellule contenant l'élément N dans la table de hashage.
    function insert_Fils(T: in TPtrCellule; N: in TElem; M: TFils := (others => Tree_Vide)) return TPtrCellule is
    begin
        T.fils(hash(N)) := new TCellule'(N, T, M);
        return T;
    end insert_Fils;
    
    procedure modif_Val_Fils(T: in TPtrCellule; N: in TElem; L: in TPtrCellule) is
    begin
        T.fils(hash(N)) := L;
    end modif_Val_Fils;
    
    procedure modif_Val_Tree(T: in TPtrCellule; N: in TElem) is
    begin
        T.val := N;
    end modif_Val_Tree;
    
    -- Sortes d'accesseurs sur les attributs de PTree_Gen
    
    function valeur_Elem(T: in TPtrCellule) return TElem is
    begin
        return T.val;
    end valeur_Elem;
    
    function precedent(T: in TPtrCellule) return TPtrCellule is
    begin
        return T.papa;
    end precedent;

    function fils_N(T: in TPtrCellule; N: in TElem) return TPtrCellule is
    begin
        return T.fils(hash(N));
    end fils_N;
    function fils_N_Int(T: in TPtrCellule; C: in Integer) return TPtrCellule is
    begin
        return T.fils(C);
    end fils_N_Int;
    
    function fils_Length(T: in TPtrCellule) return Integer is
    begin
        return T.fils'last;
    end fils_Length;
    
    function fils_Meh(T: in TPtrCellule) return TFils is
    begin
        return T.fils;
    end fils_Meh;
      
end PTree_Gen;