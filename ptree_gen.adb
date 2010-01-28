--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_gen.adb

package body PTree_Gen is

    function creer_Tree(N: in TElem) return TPtrCellule is
        M: TMeh;
    begin
        return new TCellule'(N, null, M);
    end creer_Tree;
    
    function Tree_Vide return TPtrCellule is
    begin
        return null;
    end Tree_Vide;

    function elem_Vide(T: in TPtrCellule) return Boolean is
    begin
        return T = null;
    end elem_Vide;

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
    
    function insert_Fils(T: in TPtrCellule; N: in TElem) return TPtrCellule is
        M: TMeh;
    begin
        T.fils(hash(N)) := new TCellule'(N, T, M);
        return T;
    end insert_Fils;
    
    procedure modif_Val_Fils(T: in TPtrCellule; N: in TElem; L: in TPtrCellule) is
    begin
        T.fils(hash(N)) := L;
    end modif_Val_Fils;
    
    function fils_N_Int(T: in TPtrCellule; C: in Integer) return TPtrCellule is
    begin
        return T.fils(C);
    end fils_N_Int;
    
    function fils_Length(T: in TPtrCellule) return Integer is
    begin
        return T.fils'last;
    end fils_Length;
    
    procedure modif_Val_Tree(T: in TPtrCellule; N: in TElem) is
    begin
        T.val := N;
    end modif_Val_Tree;
      
end PTree_Gen;