--  _____     _   _                _            
-- |  ___|_ _| |_| |    ___  _   _| |_ _ __ ___ 
-- | |_ / _` | __| |   / _ \| | | | __| '__/ _ \
-- |  _| (_| | |_| |__| (_) | |_| | |_| | |  __/
-- |_|  \__,_|\__|_____\___/ \__,_|\__|_|  \___|
--
-- By Fat & Loutre - 01/10 - mathieu.triay(at)gmail(dot)com / yann.pravo(at)gmail(dot)com
-- Modifications: http://github.com/Nagy/FatLoutre/commits/master/pTree_noeud.adb
--
-- Paquet qui instancie la structure générique de tree PTree_Gen. 
-- On utilisera la fonction de hashage des Noeuds
-- et les Noeuds comme élément de la structure.
-- On notera les occurrences d'un mot sur la dernière lettre de celui-ci. Si elles sont à 0, c'est simplement une lettre.
-- Si c'est superieur à 0, elle fait référence à un Mot.

package body PTree_Noeud is
    
    -- Création de la racine du tree avec un charactère spécial * et des occurrences à 0
    function creer_Tree_Noeud return TTree_Noeud is
    begin
        return creer_Tree(creer_Noeud('*', 0));
    end creer_Tree_Noeud;
    
    -- Donne un TMot en fonction du T donné en remontant de père en père
    function get_Mot_Tree(T: in TTree_Noeud; Mot: in TMot := creer_Mot) return TMot is
        MehMot: TMot := Mot;
    begin
        if not tree_Noeud_Vide(T) and then not tree_Noeud_Vide(precedent(T)) then
            MehMot := ajout_Lettre_Debut(MehMot, char_Noeud(valeur_Noeud(T)));
            -- On stocke les lettres au début à chaque fois pour avoir le mot à l'endroit
            return get_Mot_Tree(precedent(T), MehMot);
            -- On passe au père
        else
            return Mot;
        end if;
    end get_Mot_Tree;
    
    -- Affiche le tree en parcourant le tree.
    -- Si on a un noeud avec des occurrence > 0, on affiche le mot et les occurrences corresspondantes
    -- Ensuite on regarde tout les fils du tableau
    procedure affiche_Tree(T: in TTree_Noeud) is
    begin
        if not tree_Noeud_Vide(T) then
            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                affiche_Mot(get_Mot_Tree(T));
                put(" ");
                put_line(integer'image(occurrence_Noeud(valeur_Noeud(T))));
            end if;
                
            for I in 1..fils_Length(T) loop
                affiche_Tree(fils_N_Int(T, I));
            end loop;
        end if;
    end affiche_Tree;
    
    -- retourne le nombre de mots contenus dans le Tree
    -- On ajoute 1 à chaque fois qu'on trouve des occurrences > 0
    function nb_Mots_Tree(T: in TTree_Noeud) return integer is
        Meh: integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Mots_Tree(fils_N_Int(T, I));
            end loop;
            
            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                return 1 + Meh;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Mots_Tree;
    
    -- Retourne les occurrences d'un mot donné
    -- On regarde si on peut retrouver le mot, si oui on renvoi les occurrences simplement
    -- Sinon, 0.
    function nb_Occurrence_Mot_Tree(T: in TTree_Noeud; M: in TMot) return Integer is
    begin
        if not tree_Noeud_Vide(retrouve_Mot(T, M)) then
            -- retrouve renvoi un pointeur vers la dernière lettre du mot
            -- Plus facile pour acceder aux occurrences
            return occurrence_Noeud(valeur_Noeud(retrouve_Mot(T, M)));
        else
            return 0;
        end if;
    end nb_Occurrence_Mot_Tree;
    
    -- retourne le nombre d'occurrences totale du Tree.
    -- A chaque occurrence > 0 on ajoute et on relance sur tous les fils
    function nb_Occurrences_Total(T: in TTree_Noeud) return Integer is
        Meh: integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Occurrences_Total(fils_N_Int(T, I));
            end loop;
            
            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                return occurrence_Noeud(valeur_Noeud(T)) + Meh;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Occurrences_Total;
    
    -- On utilise la même méthode pour toutes les fonctions suivantes --
    
    function Longueur_Totale_Mot_Tree(T: in TTree_Noeud) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + longueur_Totale_Mot_Tree(fils_N_Int(T, I));
            end loop;

            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                return longueur_Mot(get_Mot_Tree(T)) + Meh;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end Longueur_Totale_Mot_Tree;
    
    function nb_Prefixe_Tree(T: in TTree_Noeud; M: in TMot) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Prefixe_Tree(fils_N_Int(T, I), M);
            end loop;

            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                if prefixe(get_Mot_Tree(T), M) then
                    return occurrence_Noeud(valeur_Noeud(T)) + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Prefixe_Tree;

    function nb_Suffixe_Tree(T: in TTree_Noeud; M: in TMot) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Suffixe_Tree(fils_N_Int(T, I), M);
            end loop;

            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                if suffixe(get_Mot_Tree(T), M) then
                    return occurrence_Noeud(valeur_Noeud(T)) + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Suffixe_Tree;
    
    function nb_Facteur_Tree (T: in TTree_Noeud; M: in TMot) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Facteur_Tree(fils_N_Int(T, I), M);
            end loop;

            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                if facteur(get_Mot_Tree(T), M) then
                    return occurrence_Noeud(valeur_Noeud(T)) + Meh;
                else
                    return Meh;
                end if;
            else
                return Meh;
            end if;
        else
            return 0;
        end if;
    end nb_Facteur_Tree;
    
    function nb_Superieur_Tree(T: in TTree_Noeud; N: in Integer) return Integer is
        Meh: Integer := 0;
    begin
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                Meh := Meh + nb_Superieur_Tree(fils_N_Int(T, I), N);
            end loop;

            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                if longueur_Mot(get_Mot_Tree(T)) >= N then
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
    end nb_Superieur_Tree;
    
    -- On retourne la division du nb d'occurrences totale par le nombre de mots
    function moy_Occurrence_Tree(T: in TTree_Noeud) return Float is
    begin
        return float(nb_Occurrences_Total(T))/float(nb_Mots_Tree(T));
    end moy_Occurrence_Tree;
    
    -- On retourne la division de la longueur totale des mots du tree par le nombre de mots
    function moy_Longueur_Tree(T: in TTree_Noeud) return Float is
    begin
        return float(Longueur_Totale_Mot_Tree(T))/float(nb_Mots_Tree(T));
    end moy_Longueur_Tree;
    
    -- Retourne True si le fils N de T est là, faux sinon
    function fils_Existe(T: in TTree_Noeud; N: in Character) return Boolean is
    begin
        return not tree_Noeud_Vide(fils_N(T, creer_Noeud(N, 0)));
    end fils_Existe;
    
    -- Retourne le pointeur corresspondant au charactère contenu dans N
    function fils_Char(T: in TTree_Noeud; N: in Character) return TTree_Noeud is
    begin
        return fils_N(T, creer_Noeud(N, 0));
    end fils_Char;
    
    -- Retourne vrai si le mot est contenu dans le tree, faux sinon
    function present_Tree(T: in TTree_Noeud; Mot: in TMot) return Boolean is
    begin
        if not tree_Noeud_Vide(T) and not mot_Vide(Mot) then
            if not tree_Noeud_Vide(fils_Char(T, valeur_Mot(Mot))) then
                -- Si les fils contiennent la lettre, on continue
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- fin !
                    if occurrence_Noeud(valeur_Noeud(fils_Char(T, valeur_Mot(Mot)))) > 0 then
                        -- Si c'est un mot, c'est ok
                        return True;
                    else -- sinon on retourne chez sa mère !
                        return False;
                    end if;
                else
                    -- on continue
                    return present_Tree(fils_Char(T, valeur_Mot(Mot)), Lettre_Suivante(Mot));
                end if;
            else -- le fils existe pas, c'est mort
                return False;
            end if;
        else -- on a un T vide avant la fin du mot, c'est mort
            return False;
        end if;
    end present_Tree;
    
    -- Utilise la même technique que précédement mais retourne le pointeur 
    -- (on aurait pu se pencher sur une version générique de cette fonction)
    function retrouve_Mot(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud is
    begin
        if not tree_Noeud_Vide(T) and not mot_Vide(Mot) then
            if not tree_Noeud_Vide(fils_Char(T, valeur_Mot(Mot))) then
                -- Si les fils contiennent la lettre, on continue
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- fin !
                    if occurrence_Noeud(valeur_Noeud(fils_Char(T, valeur_Mot(Mot)))) > 0 then
                        return fils_Char(T, valeur_Mot(Mot));
                    else
                        return Tree_Vide;
                    end if;
                else
                    -- on continue
                    return retrouve_Mot(fils_Char(T, valeur_Mot(Mot)), Lettre_Suivante(Mot));
                end if;
            else
                return Tree_Vide;
            end if;
        else
            return Tree_Vide;
        end if;
    end retrouve_Mot;
    
    -- Fusionne les occurrences de M1 et M2 et supprime M2
    function fusion_Mot_Tree(T: in TTree_Noeud; M1, M2: in TMot) return TTree_Noeud is
        L1: TTree_Noeud := retrouve_Mot(T, M1);
        L2: TTree_Noeud := retrouve_Mot(T, M2);
        Muh: TTree_Noeud;
        Meh: TNoeud;
    begin
        if not Tree_Noeud_Vide(L1) and not Tree_Noeud_Vide(L2) then
            Meh := ajout_Occurrence(valeur_Noeud(L1), occurrence_Noeud(valeur_Noeud(L2)));
            Modif_Val_Tree(L1, Meh); -- On modifie la valeur avec le nouveau Noeud
            Muh := supprime_Mot_Tree(T, M2); -- et on supprime
            return Muh;
        else
            return T;
        end if;
    end fusion_Mot_Tree;
    
    -- Converti un tree en liste ordonnée sur les occurrences de manière décroissante
    function tree_To_Liste_Occurrence_Decroissante(T: in TTree_Noeud; L: in TListe_Couple := creer_Liste_Couple) return TListe_Couple is
        K: TListe_Couple := L;
        C: TCouple;
    begin -- tree_To_Liste
        if not tree_Noeud_Vide(T) then
            for I in 1..fils_Length(T) loop
                K := tree_To_Liste_Occurrence_Decroissante(fils_N_Int(T, I), K);
            end loop;
            
            if occurrence_Noeud(valeur_Noeud(T)) > 0 then
                C := creer_Couple(get_Mot_Tree(T), occurrence_Noeud(valeur_Noeud(T))); -- On créé le couple à la volée
                K := insert_Decroissant_Occurrences(K, C); -- et on l'insert dans la liste
            end if;
            
            return K;
        else
            return K;
        end if;
    end tree_To_Liste_Occurrence_Decroissante;
    
    -- Affiche la liste de couples à partir d'un Tree
    procedure affiche_Decroissant_Occurrence(T: in TTree_Noeud; N: in Integer) is
        L: TListe_Couple := tree_To_Liste_Occurrence_Decroissante(T); -- On converti...
        I: integer := 0;
    begin
        affichage_N(L, N); -- .. et on affiche
    end affiche_Decroissant_Occurrence;
    
    -- Supprime un mot du Tree, si il n'y est pas, on fait rien
    function supprime_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud is
        Meh: TNoeud;
        Moo: TTree_Noeud;
    begin
        if not Tree_Noeud_Vide(retrouve_Mot(T, Mot)) then
            Moo := retrouve_Mot(T, Mot); -- On retrouve le mot
            Meh := valeur_Noeud(Moo); -- On le stocke
            Meh := suppr_Occurrence(Meh); -- On supprime les occurrences (ce n'est donc plus un mot)
            Modif_Val_Tree(Moo, Meh); -- et on modifie
            
            -- On ne supprime pas les noeuds car ils peuvent servir 
            -- dans le meilleur des cas à d'autres mots plus tard
        end if;
        
        return T;
    end supprime_Mot_Tree;
    
    -- Ajoute un mot donné au Tree. On utilise un chainage arrière pour renvoyer le père
    function ajout_Mot_Tree(T: in TTree_Noeud; Mot: in TMot) return TTree_Noeud is
        Meh: TTree_Noeud := T;
        Moo: TNoeud;
    begin
        if not mot_Vide(Mot) then
            if not fils_Existe(Meh, valeur_Mot(Mot)) then
                -- Le fils n'existe pas, on l'ajoute et on passe à ce fils pour inserer la suite
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- on est a la derniere lettre (on met l'occurence à 1) on arrête de lancer l'ajout mot
                    Meh := insert_Fils(Meh, creer_Noeud(valeur_Mot(Mot), 1));
                else
                    -- On ajoute et on relance
                    Meh := insert_Fils(Meh, creer_Noeud(valeur_Mot(Mot), 0));
                    modif_Val_Fils(Meh, creer_Noeud(valeur_Mot(Mot), 0), ajout_Mot_Tree(fils_Char(Meh, valeur_Mot(Mot)), Lettre_Suivante(Mot)));
                end if;
            else -- le fils existe déjà, on passe à ce fils pour inserer la suite
                -- On relance sans ajouter (il y est déjà)
                if mot_Vide(Lettre_Suivante(Mot)) then
                    -- Il faut mettre les occurrences à + 1
                    Moo := ajout_Occurrence(valeur_Noeud(fils_Char(Meh, valeur_Mot(Mot))), 1);
                    Meh := insert_Fils(Meh, Moo, fils_Meh(fils_Char(Meh, valeur_Mot(Mot))));
                end if; 
                -- On modifie la valeur du fils avec le suivant (chainage arrière)
                modif_Val_Fils(Meh, creer_Noeud(valeur_Mot(Mot), 0), ajout_Mot_Tree(fils_Char(Meh, valeur_Mot(Mot)), Lettre_Suivante(Mot)));
            end if;
            
            return Meh;
        else
            return Meh;
        end if;
    end ajout_Mot_Tree;
    
    -- Alias des fonctions génériques pour accès exterieur --
    
    function tree_Noeud_Vide(T: in TTree_Noeud) return Boolean is
    begin
        return elem_Vide(T);
    end Tree_Noeud_Vide;
    
    function valeur_Noeud(T: in TTree_Noeud) return TNoeud is
    begin
        return valeur_Elem(T);
    end valeur_Noeud;
    
    function longueur_Fils(T: in TTree_Noeud) return Integer is
    begin
        return fils_Length(T);
    end longueur_Fils;
    
    function fils_Char_Int(T: in TTree_Noeud; C: in Integer) return TTree_Noeud is
    begin
        return fils_N_int(T, C);
    end fils_Char_Int;
    
    procedure modif_Tree(T: in TTree_Noeud; N: in TNoeud) is
    begin
        modif_Val_Tree(T, N);
    end modif_Tree;

end PTree_Noeud;