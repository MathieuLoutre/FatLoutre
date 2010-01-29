--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 01/10 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/ptree_gros_noeud.adb
--
-- Mimique le comportement de PTree_Noeud. Les mécanismes sont les mêmes que pour PTree_Noeud.
-- Si c'est un mot, il aura la somme de ses occurrences > 0
-- On a 3 fonctions inédites aussi, l'union, la différence et l'intersection qui seront plus amplement commentés

package body PTree_Gros_Noeud is

    function creer_Tree_Gros_Noeud return TTree_Gros_Noeud is
    begin
        return creer_Tree(creer_Gros_Noeud('*', 0, 0));
    end creer_Tree_Gros_Noeud;
        
    function tree_Gros_Noeud_Vide(T: in TTree_Gros_Noeud) return Boolean is
    begin
        return elem_Vide(T);
    end Tree_Gros_Noeud_Vide;
    	
    function valeur_Gros_Noeud(T: in TTree_Gros_Noeud) return TGros_Noeud is
    begin
        return valeur_Elem(T);
    end valeur_Gros_Noeud;
    
    function get_Mot_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot := creer_Mot) return TMot is
        MehMot: TMot := Mot;
    begin
        if not tree_Gros_Noeud_Vide(T) and then not tree_Gros_Noeud_Vide(precedent(T)) then
            MehMot := ajout_Lettre_Debut(MehMot, char_Gros_Noeud(valeur_Gros_Noeud(T)));
            return get_Mot_Tree_Gros(precedent(T), MehMot);
        else
            return Mot;
        end if;
    end get_Mot_Tree_Gros;
    
    procedure affiche_Tree_Gros(T: in TTree_Gros_Noeud) is
    begin
        if not tree_Gros_Noeud_Vide(T) then
            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                affiche_Mot(get_Mot_Tree_Gros(T));
                put(" ");
                put(integer'image(occurrence1_Gros_Noeud(valeur_Gros_Noeud(T))));
                put(" ");
                put_line(integer'image(occurrence2_Gros_Noeud(valeur_Gros_Noeud(T))));
            end if;
                
            for I in 1..fils_Length(T) loop
                affiche_Tree_Gros(fils_N_Int(T, I));
            end loop;
        end if;
    end affiche_Tree_Gros;
    
    function nb_Mots_Tree_Gros(T: in TTree_Gros_Noeud) return integer is
        Meh: integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Mots_Tree_Gros(fils_N_Int(T, I));
            end loop;
            
            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                return 1 + Meh;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Mots_Tree_Gros;
    
    function nb_Occurrence_Mot_Tree_Gros(T: in TTree_Gros_Noeud; M: in TMot) return Integer is
    begin
        if not tree_Gros_Noeud_Vide(retrouve_Mot_Gros(T, M)) then
            --put(integer'image(occurrence1_Gros_Noeud(valeur_Gros_Noeud(retrouve_Mot_Gros(T, M)))));
            return occurrence_Gros_Noeud(valeur_Gros_Noeud(retrouve_Mot_Gros(T, M)));
        else
            return 0;
        end if;
    end nb_Occurrence_Mot_Tree_Gros;
    
    function nb_Occurrences_Total_Gros(T: in TTree_Gros_Noeud) return Integer is
        Meh: integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Occurrences_Total_Gros(fils_N_Int(T, I));
            end loop;
            
            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                return occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) + Meh;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Occurrences_Total_Gros;
    
    function moy_Occurrence_Tree_Gros(T: in TTree_Gros_Noeud) return Float is
    begin
        return float(nb_Occurrences_Total_Gros(T))/float(nb_Mots_Tree_Gros(T));
    end moy_Occurrence_Tree_Gros;
    
    function Longueur_Totale_Mot_Tree_Gros(T: in TTree_Gros_Noeud) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + longueur_Totale_Mot_Tree_Gros(fils_N_Int(T, I));
            end loop;

            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                return longueur_Mot(get_Mot_Tree_Gros(T)) + Meh;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end Longueur_Totale_Mot_Tree_Gros;
    
    function nb_Prefixe_Tree_Gros(T: in TTree_Gros_Noeud; M: in TMot) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Prefixe_Tree_Gros(fils_N_Int(T, I), M);
            end loop;

            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                if prefixe(get_Mot_Tree_Gros(T), M) then
                    return occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Prefixe_Tree_Gros;

    function nb_Suffixe_Tree_Gros(T: in TTree_Gros_Noeud; M: in TMot) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Suffixe_Tree_Gros(fils_N_Int(T, I), M);
            end loop;

            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                if suffixe(get_Mot_Tree_Gros(T), M) then
                    return occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Suffixe_Tree_Gros;
    
    function nb_Facteur_Tree_Gros(T: in TTree_Gros_Noeud; M: in TMot) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Facteur_Tree_Gros(fils_N_Int(T, I), M);
            end loop;

            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                if facteur(get_Mot_Tree_Gros(T), M) then
                    return occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Facteur_Tree_Gros;
    
    function nb_Superieur_Tree_Gros(T: in TTree_Gros_Noeud; N: in Integer) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Superieur_Tree_Gros(fils_N_Int(T, I), N);
            end loop;

            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                if longueur_Mot(get_Mot_Tree_Gros(T)) >= N then
                    return 1 + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Superieur_Tree_Gros;
    
    function moy_Longueur_Tree_Gros(T: in TTree_Gros_Noeud) return Float is
    begin
        return float(Longueur_Totale_Mot_Tree_Gros(T))/float(nb_Mots_Tree_Gros(T));
    end moy_Longueur_Tree_Gros;
    
    function fils_Existe_Gros(T: in TTree_Gros_Noeud; N: in Character) return Boolean is
    begin
        return not tree_Gros_Noeud_Vide(fils_N(T, creer_Gros_Noeud(N, 0, 0)));
    end fils_Existe_gros;
    
    function fils_Char_Gros(T: in TTree_Gros_Noeud; N: in Character) return TTree_Gros_Noeud is
    begin
        return fils_N(T, creer_Gros_Noeud(N, 0, 0));
    end fils_Char_Gros;
    
    function present_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot) return Boolean is
    begin
        if not tree_Gros_Noeud_Vide(T) and not mot_Vide(Mot) then
            if not tree_Gros_Noeud_Vide(fils_Char_Gros(T, valeur_Mot(Mot))) then
                -- Si les fils contiennent la lettre, on continue
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- fin !
                    if occurrence_Gros_Noeud(valeur_Gros_Noeud(fils_Char_Gros(T, valeur_Mot(Mot)))) > 0 then
                        return True;
                    else
                        return False;
                    end if;
                else
                    -- on continue
                    return present_Tree_Gros(fils_Char_Gros(T, valeur_Mot(Mot)), Lettre_Suivante(Mot));
                end if;
            else
                return False;
            end if;
        else
            return False;
        end if;
    end present_Tree_Gros;
    
    function retrouve_Mot_Gros(T: in TTree_Gros_Noeud; Mot: in TMot) return TTree_Gros_Noeud is
    begin
        if not tree_Gros_Noeud_Vide(T) and not mot_Vide(Mot) then
            if not tree_Gros_Noeud_Vide(fils_Char_Gros(T, valeur_Mot(Mot))) then
                -- Si les fils contiennent la lettre, on continue
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- fin !
                    if occurrence_Gros_Noeud(valeur_Gros_Noeud(fils_Char_Gros(T, valeur_Mot(Mot)))) > 0 then
                        return fils_Char_Gros(T, valeur_Mot(Mot));
                    else
                        return Tree_Vide;
                    end if;
                else
                    -- on continue
                    return retrouve_Mot_Gros(fils_Char_Gros(T, valeur_Mot(Mot)), Lettre_Suivante(Mot));
                end if;
            else
                return Tree_Vide;
            end if;
        else
            return Tree_Vide;
        end if;
    end retrouve_Mot_Gros;
    
    function fusion_Mot_Tree_Gros(T: in TTree_Gros_Noeud; M1, M2: in TMot) return TTree_Gros_Noeud is
        L1: TTree_Gros_Noeud := retrouve_Mot_Gros(T, M1);
        L2: TTree_Gros_Noeud := retrouve_Mot_Gros(T, M2);
        Muh: TTree_Gros_Noeud;
        Meh: TGros_Noeud;
    begin
        if not Tree_Gros_Noeud_Vide(L1) and not Tree_Gros_Noeud_Vide(L2) then
            Meh := ajout_Occurrence_Gros(valeur_Gros_Noeud(L1), occurrence1_Gros_Noeud(valeur_Gros_Noeud(L2)), occurrence2_Gros_Noeud(valeur_Gros_Noeud(L2)));
            Modif_Val_Tree(L1, Meh);
            Muh := supprime_Mot_Tree_Gros(T, M2);
            return Muh;
        else
            return T;
        end if;
    end fusion_Mot_Tree_Gros;
    
    function tree_To_Liste_Occurrence_Decroissante_Gros(T: in TTree_Gros_Noeud; L: in TListe_Trio := creer_Liste_Trio) return TListe_Trio is
        K: TListe_Trio := L;
        C: TTrio;
    begin -- tree_To_Liste
        if not tree_Gros_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                K := tree_To_Liste_Occurrence_Decroissante_Gros(fils_N_Int(T, I), K);
            end loop;
            
            if occurrence_Gros_Noeud(valeur_Gros_Noeud(T)) > 0 then
                C := creer_Trio(get_Mot_Tree_Gros(T), occurrence1_Gros_Noeud(valeur_Gros_Noeud(T)), occurrence2_Gros_Noeud(valeur_Gros_Noeud(T)));
                K := insert_Decroissant_Occurrence_Trio(K, C);
            end if;
            
            return K;
        else
            return K;
        end if;
    end tree_To_Liste_Occurrence_Decroissante_Gros;
    
    procedure affiche_Decroissant_Occurrence_Gros(T: in TTree_Gros_Noeud; N: in Integer) is
        L: TListe_Trio := tree_To_Liste_Occurrence_Decroissante_Gros(T);
        I: integer := 0;
    begin
        affiche_N_Trio(L, N);
    end affiche_Decroissant_Occurrence_Gros;
    
    function supprime_Mot_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot) return TTree_Gros_Noeud is
        Meh: TGros_Noeud;
        Moo: TTree_Gros_Noeud;
    begin
        if not Tree_Gros_Noeud_Vide(retrouve_Mot_Gros(T, Mot)) then
            Moo := retrouve_Mot_Gros(T, Mot);
            Meh := valeur_Gros_Noeud(Moo);
            Meh := suppr_Occurrence_Gros(Meh);
            Modif_Val_Tree(Moo, Meh);
        end if;
        
        return T;
    end supprime_Mot_Tree_Gros;
    
    function ajout_Mot_Tree_Gros(T: in TTree_Gros_Noeud; Mot: in TMot; Oc1, Oc2: in Integer) return TTree_Gros_Noeud is
        Meh: TTree_Gros_Noeud := T;
        Moo: TGros_Noeud;
    begin
        if not mot_Vide(Mot) then
            if not fils_Existe_Gros(Meh, valeur_Mot(Mot)) then
                -- Le fils n'existe pas, on l'ajoute et on passe à ce fils pour inserer la suite
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- on est a la derniere lettre (on met l'occurence à 1) on arrête de lancer l'ajout mot
                    Meh := insert_Fils(Meh, creer_Gros_Noeud(valeur_Mot(Mot), Oc1, Oc2));
                else
                    -- On ajoute et on relance
                    Meh := insert_Fils(Meh, creer_Gros_Noeud(valeur_Mot(Mot), 0, 0));
                    modif_Val_Fils(Meh, creer_Gros_Noeud(valeur_Mot(Mot), 0, 0), ajout_Mot_Tree_Gros(fils_Char_Gros(Meh, valeur_Mot(Mot)), Lettre_Suivante(Mot), Oc1, Oc2));
                end if;
            else -- le fils existe déjà, on passe à ce fils pour inserer la suite
                -- On relance sans ajouter (il y est déjà)
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- Il faut mettre les occurrences à + 1
                    Moo := ajout_Occurrence_Gros(valeur_Gros_Noeud(fils_Char_Gros(Meh, valeur_Mot(Mot))), Oc1, Oc2);
                    Meh := insert_Fils(Meh, Moo, fils_Meh(fils_Char_Gros(Meh, valeur_Mot(Mot))));
                    
                    modif_Val_Fils(Meh, creer_Gros_Noeud(valeur_Mot(Mot), 0, 0), ajout_Mot_Tree_Gros(fils_Char_Gros(Meh, valeur_Mot(Mot)), Lettre_Suivante(Mot), Oc1, Oc2));
                else
                    modif_Val_Fils(Meh, creer_Gros_Noeud(valeur_Mot(Mot), 0, 0), ajout_Mot_Tree_Gros(fils_Char_Gros(Meh, valeur_Mot(Mot)), Lettre_Suivante(Mot), Oc1, Oc2));
                end if; 
            end if;
            
            return Meh;
        else
            return Meh;
        end if;
    end ajout_Mot_Tree_Gros;
    
    function mots_Communs_Tree(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
        L: TTree_Gros_Noeud := T3;
    begin
        if not tree_Noeud_Vide(T1) then
            if occurrence_Noeud(valeur_Noeud(T1)) > 0 then -- Si c'est un mot
                if not tree_Noeud_Vide(retrouve_Mot(T2, get_Mot_Tree(T1))) then -- et qu'il est présent dans les 2
                    -- On l'ajoute !
                    L := ajout_Mot_Tree_Gros(T3, get_Mot_Tree(T1), occurrence_Noeud(valeur_Noeud(T1)), occurrence_Noeud(valeur_Noeud(retrouve_Mot(T2, get_Mot_Tree(T1)))));
                end if;
            end if;
                
            for I in 1..fils_Length(T3) loop
                -- Puis on parcours tout les autres
                L := mots_Communs_Tree(fils_Char_Int(T1, I), T2, L);
            end loop;
            
            return L;
        else
            return L;
        end if;
    end mots_Communs_Tree;
    
    -- On utilise 2 fonctions cachées pour faire le boulot dans les 2 listes
    function mots_Differents_Tree(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
           L: TTree_Gros_Noeud := T3;
       begin
           L := mots_Differents_Tree_Gch(T1, T2, T3);
           L := mots_Differents_Tree_Drt(T2, T1, T3);

           return L;
    end mots_Differents_Tree;
    
    function mots_Differents_Tree_Gch(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
       L: TTree_Gros_Noeud := T3;
    begin
        if not tree_Noeud_Vide(T1) then
            if occurrence_Noeud(valeur_Noeud(T1)) > 0 then
                if tree_Noeud_Vide(retrouve_Mot(T2, get_Mot_Tree(T1))) then -- Si il n'y est pas dans l'autre ;)
                    -- on ajoute
                    L := ajout_Mot_Tree_Gros(T3, get_Mot_Tree(T1), occurrence_Noeud(valeur_Noeud(T1)), 0);
                end if;
            end if;
                
            for I in 1..fils_Length(T3) loop
                L := mots_Differents_Tree_Gch(fils_Char_Int(T1, I), T2, L);
            end loop;
            
            return L;
        else
            return L;
        end if;
    end mots_Differents_Tree_Gch;
    
    function mots_Differents_Tree_Drt(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
       L: TTree_Gros_Noeud := T3;
    begin
        if not tree_Noeud_Vide(T1) then
            if occurrence_Noeud(valeur_Noeud(T1)) > 0 then
                if tree_Noeud_Vide(retrouve_Mot(T2, get_Mot_Tree(T1))) then
                    -- on ajoute
                    L := ajout_Mot_Tree_Gros(T3, get_Mot_Tree(T1), 0, occurrence_Noeud(valeur_Noeud(T1)));
                end if;
            end if;
                
            for I in 1..fils_Length(T3) loop
                L := mots_Differents_Tree_Drt(fils_Char_Int(T1, I), T2, L);
            end loop;
            
            return L;
        else
            return L;
        end if;
    end mots_Differents_Tree_Drt;
    
    -- même chose que pour la différence
    function fusion_Tree(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
        L: TTree_Gros_Noeud := T3;
    begin
        L := fusion_Tree_Gch(T1, T2, T3);
        L := fusion_Tree_Drt(T2, T1, T3);
        
        return L;
    end fusion_Tree;
    
    function fusion_Tree_Gch(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
        L: TTree_Gros_Noeud := T3;
    begin
        if not tree_Noeud_Vide(T1) then
            if occurrence_Noeud(valeur_Noeud(T1)) > 0 then
                L := ajout_Mot_Tree_Gros(T3, get_Mot_Tree(T1), occurrence_Noeud(valeur_Noeud(T1)), 0);
            end if;
                
            for I in 1..fils_Length(T3) loop
                L := fusion_Tree_Gch(fils_Char_Int(T1, I), T2, L);
            end loop;
            
            return L;
        else
            return L;
        end if;
    end fusion_Tree_Gch;
    
    function fusion_Tree_Drt(T1: in TTree_Noeud; T2: in TTree_Noeud; T3: in TTree_Gros_Noeud := creer_Tree_Gros_Noeud) return TTree_Gros_Noeud is
        L: TTree_Gros_Noeud := T3;
    begin
        if not tree_Noeud_Vide(T1) then
            if occurrence_Noeud(valeur_Noeud(T1)) > 0 then
                L := ajout_Mot_Tree_Gros(T3, get_Mot_Tree(T1), 0, occurrence_Noeud(valeur_Noeud(T1)));
            end if;
                
            for I in 1..fils_Length(T3) loop
                L := fusion_Tree_Drt(fils_Char_Int(T1, I), T2, L);
            end loop;
            
            return L;
        else
            return L;
        end if;
    end fusion_Tree_Drt;
    
    -- Alias de fonctions pour utilisation externe --
    
    function longueur_Fils_Gros(T: in TTree_Gros_Noeud) return Integer is
    begin
        return fils_Length(T);
    end longueur_Fils_Gros;
    
    function fils_Char_Int_Gros(T: in TTree_Gros_Noeud; C: in Integer) return TTree_Gros_Noeud is
    begin
        return fils_N_int(T, C);
    end fils_Char_Int_Gros;
    
    procedure modif_Tree_Gros(T: in TTree_Gros_Noeud; N: in TGros_Noeud) is
    begin
        modif_Val_Tree(T, N);
    end modif_Tree_Gros;

end PTree_Gros_Noeud;