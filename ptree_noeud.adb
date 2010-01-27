--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 12/09 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pTree_noeud.adb
--

package body PTree_Noeud is

    function creer_Tree_Noeud return TTree_Noeud is
    begin
        return creer_Tree(creer_Noeud(' ', 0));
    end creer_Tree_Noeud;
        
    function tree_Noeud_Vide(T: in TTree_Noeud) return Boolean is
    begin
        return elem_Vide(T);
    end Tree_Noeud_Vide;
    	
    function valeur_Noeud(T: in TTree_Noeud) return TNoeud is
    begin
        return valeur_Elem(T);
    end valeur_Noeud;
    
    procedure affiche_Tree(T: in TTree_Noeud) is
    begin
        if not tree_Noeud_Vide(T) then
            affiche_Noeud(valeur_Noeud(T));
            affiche_Tree(precedent(T));
        end if;
    end affiche_Tree;
    
    function fils_Existe(T: in TTree_Noeud; N: in Character) return Boolean is
    begin
        return not tree_Noeud_Vide(fils_N(T, creer_Noeud(N, 0)));
    end fils_Existe;
    
    function present_Tree(T: in TTree_Noeud; Mot: in TMot) return Boolean is
    begin
        if not tree_Noeud_Vide(T) and not mot_Vide(Mot) then
            if not tree_Noeud_Vide(fils_N(T, creer_Noeud(valeur_Mot(Mot), 0))) then
                -- passe à la suite
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- fin !
                    if occurrence(valeur_Noeud(T)) > 0 then
                        return True;
                    else
                        return False;
                    end if;
                else
                    -- on continue
                    return present_Tree(fils_N(T, creer_Noeud(valeur_Mot(Mot), 0)), Lettre_Suivante(Mot));
                end if;
            else
                return False;
            end if;
        else
            return False;
        end if;
    end present_Tree;
    
    function ajout_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud is
        Meh: TTree_Noeud;
    begin
        if not mot_Vide(Mot) then
            if not fils_Existe(T, valeur_Mot(Mot)) then
                -- Le fils n'existe pas, on l'ajoute et on passe à ce fils pour inserer la suite
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- on est a la derniere lettre (on met l'occurence à 1) on arrête de lancer l'ajout mot
                    Meh := insert_Fils(T, creer_Noeud(valeur_Mot(Mot), 1));
                else
                    -- On ajoute et on relance
                    Meh := insert_Fils(T, creer_Noeud(valeur_Mot(Mot), 0));
                end if;
            --else -- le fils existe déjà, on passe à ce fils pour inserer la suite
                -- On relance sans ajouter (il y est déjà)
            end if;
                
            return ajout_Mot_Tree(fils_N(T, creer_Noeud(valeur_Mot(Mot), 0)), Lettre_Suivante(Mot));
        else
            return T;
        end if;
    end ajout_Mot_Tree;

end PTree_Noeud;