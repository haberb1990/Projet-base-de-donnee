begin transaction;

drop schema if exists bibliotheque cascade;
create schema bibliotheque;
set search_path to bibliotheque;

create table Livre
(
    IdentifiantL serial not null UNIQUE,
    ISBN         text   not null UNIQUE,
    primary key (IdentifiantL)
);


create table InfoLivre
(
    ISBN    text    not null,
    Auteur  text    not null,
    Titre   text    not null,
    Genre   text    not null,
    Editeur text    not null,
    NbPage  INTEGER not null,
    primary key (ISBN),
    foreign key (ISBN) references Livre (ISBN)
);



create table Adherant
(
    IdentifiantA serial not null Unique,
    Nom          text   not null,
    Prenom       text   not null,
    Adresse      text   not null,
    Ville        text   not null,
    NbTelephone  text   not null,
    primary key (IdentifiantA)
);


create table Emprunt
(
    NoEmprunt    serial                    not null Unique,
    DateEmprunt  date DEFAULT CURRENT_DATE not null,
    DateRetour   date,
    IdentifiantL int                       not null,
    IdentifiantA int                       not null,
    primary key (NoEmprunt),
    foreign key (IdentifiantL) references Livre (IdentifiantL),
    foreign key (IdentifiantA) references Adherant (IdentifiantA)
);

create table TypeEtatCommande
(
    EtatCommande text not null,
    primary key (EtatCommande)
);

create table Commande
(
    NoCommande   serial                    not null Unique,
    DateCommande date default current_date not null,
    EtatCommande text                      not null,
    IdentifiantL int                       not null,
    IdentifiantA int                       not null,
    primary key (NoCommande),
    foreign key (IdentifiantL) references Livre (IdentifiantL),
    foreign key (IdentifiantA) references Adherant (IdentifiantA),
    foreign key (EtatCommande) references TypeEtatCommande (EtatCommande)
);

------------------------
--Insertion
------------------------
INSERT INTO Livre (ISBN)
VALUES ('173001');
INSERT INTO Livre (ISBN)
VALUES ('173002');
INSERT INTO Livre (ISBN)
VALUES ('173003');
INSERT INTO Livre (ISBN)
VALUES ('173004');
INSERT INTO Livre (ISBN)
VALUES ('173005');
INSERT INTO Livre (ISBN)
VALUES ('173006');
INSERT INTO Livre (ISBN)
VALUES ('173007');
INSERT INTO Livre (ISBN)
VALUES ('173008');
INSERT INTO Livre (ISBN)
VALUES ('173009');
INSERT INTO Livre (ISBN)
VALUES ('173010');
INSERT INTO Livre (ISBN)
VALUES ('173011');
INSERT INTO Livre (ISBN)
VALUES ('173012');
INSERT INTO Livre (ISBN)
VALUES ('173013');
INSERT INTO Livre (ISBN)
VALUES ('173014');


INSERT INTO InfoLivre
VALUES ('173001', 'Joel Dicker', 'Énigme de la chambre 622', 'Roman policier', 'ROSIE & WOLFE', 576);
INSERT INTO InfoLivre
VALUES ('173002', 'L P Sicard', 'Ali Baba et les 40 voleurs', 'Science-Fiction & Fantastique', 'ADA', 216);
INSERT INTO InfoLivre
VALUES ('173003', 'Christie Golden', 'Valérian et la cité des mille planètes', 'Science-Fiction & Fantastique',
        'FLEURUS', 192);
INSERT INTO InfoLivre
VALUES ('173004', 'Thomas Cirotteau', 'Lady Sapiens : enquête sur la femme au temps de la Préhistoire', 'Anthopologie',
        'MULTIMONDES', 254);
INSERT INTO InfoLivre
VALUES ('173005', 'Pierre Perrault', 'Le mal du Nord', 'Essais Canadiens', 'LUX EDITEUR', 391);
INSERT INTO InfoLivre
VALUES ('173006', 'Haruki Murakami', 'Abandonner un chat', 'Littérature Etrangère', 'BELLFOND', 76);
INSERT INTO InfoLivre
VALUES ('173007', 'Marie Hélène Poitras', 'Soudain le Minotaure', 'Littérature Québec', 'ALTO', 180);
INSERT INTO InfoLivre
VALUES ('173008', 'Squeezie & Al', '3 histoires horreur #01', 'Albums', 'OMAKE BOOKS', 72);
INSERT INTO InfoLivre
VALUES ('173009', 'Andrée A Michaud', 'Proies', 'Littérature amérique', 'QUEBEC/AMERIQUE', 344);
INSERT INTO InfoLivre
VALUES ('173010', 'Fabrice Midal', '50 méditations pour mieux aimer', 'Croissance personnelle', 'POCKET', 152);
INSERT INTO InfoLivre
VALUES ('173011', 'Christine Le Boeuf', 'Tout ce que j aimais', 'Roman', 'ACTES SUD', 464);
INSERT INTO InfoLivre
VALUES ('173012', 'Joanne Kathleen Rowling', 'Harry potter à école des sorciers', 'Science-Fiction & Fantastique',
        'GALLIMARD', 311);
INSERT INTO InfoLivre
VALUES ('173013', 'Joanne Kathleen Rowling', 'Harry potter et la chambre des secrets', 'Science-Fiction & Fantastique',
        'GALLIMARD', 355);
INSERT INTO InfoLivre
VALUES ('173014', 'Dante', 'La divine comedie', 'Poesie', 'FLAMMARION', 806);


INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Hani', 'Berchan', '999 rue Souvenir', 'Laval', '5145556666');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Mike', 'Jones', '777 rue Notre-Dame', 'Laval', '5145536789');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Marc-Olivier', 'Morin', '1925 rue Jarry', 'Saint-Eustache', '5144388990');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Pierre', 'Goyer', '1845 rue Avenir', 'Montreal', '5146985521');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Stephane', 'Lamoureux', '45 avenue Desjardins', 'Montreal', '5148797894');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Michel', 'Lamoureux', '45 avenue Desjardins', 'Montreal', '5148797895');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Jean', 'Pascal', '450 rue Herny Bourassa', 'Montreal', '5148625489');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Michel', 'Lafleur', '360 avenue Cartier', 'Laval', '4506166616');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('Philippe', 'Lapointe', '3601 boulevard Concorde', 'Laval', '4507478999');
INSERT INTO Adherant (Nom, Prenom, Adresse, Ville, NbTelephone)
VALUES ('John', 'Roy', '25 rue Berry', 'Montreal', '4503213211');


INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/03/01', '2022/03/15', 1, 1);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/04/01', '2022/04/15', 2, 2);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/05/01', '2022/05/15', 3, 3);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/06/01', '2022/06/15', 4, 4);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/08/25', '2022/09/08', 5, 5);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/09/30', '2022/10/13', 6, 5);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/09/30', '2022/10/13', 7, 7);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/09/30', '2022/10/13', 8, 8);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/10/01', '2022/10/14', 2, 6);
INSERT INTO Emprunt (DateEmprunt, DateRetour, IdentifiantL, IdentifiantA)
VALUES ('2022/11/30', '2022/12/08', 1, 6);


INSERT INTO TypeEtatCommande
VALUES ('annule');
INSERT INTO TypeEtatCommande
VALUES ('honore');


INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/10/05', 'annule', 10, 1);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/02/06', 'honore', 1, 1);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/02/06', 'annule', 11, 3);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/03/09', 'honore', 2, 2);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/05/21', 'honore', 4, 4);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/05/23', 'annule', 12, 5);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/05/23', 'annule', 13, 5);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/08/24', 'honore', 5, 5);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/08/27', 'honore', 7, 7);
INSERT INTO Commande (DateCommande, EtatCommande, IdentifiantL, IdentifiantA)
VALUES ('2022/10/16', 'annule', 14, 10);


-- Afficher les tableaux
SELECT *
FROM Livre;
SELECT *
FROM InfoLivre;
SELECT *
FROM Adherant;
SELECT *
FROM Emprunt;
SELECT *
FROM TypeEtatCommande;
SELECT *
FROM Commande;


------------------------
-- Requetes
------------------------
-- count the books <= specified page number
CREATE OR REPLACE FUNCTION count_books_page(page_number INTEGER, OUT count_books_nb INTEGER) as
$$
DECLARE
    tuple RECORD;
BEGIN
    count_books_nb := 0;
    FOR tuple IN (SELECT bibliotheque.InfoLivre.Titre,
                         bibliotheque.Livre.ISBN,
                         bibliotheque.InfoLivre.NbPage,
                         bibliotheque.InfoLivre.ISBN
                  FROM Livre
                           INNER JOIN bibliotheque.InfoLivre ON bibliotheque.Livre.ISBN = bibliotheque.InfoLivre.ISBN)
        LOOP
            IF (tuple.NbPage <= page_number)
            THEN
                count_books_nb := count_books_nb + 1;
            ELSE
                RAISE NOTICE '% a plus de % pages. ', tuple.Titre, page_number;
            END IF;
        END LOOP;
END;
$$ language 'plpgsql';



-- Requete 1 -- Selectionner les adherants qui habitent à laval et ont emprunté un livre entre le 1er janvier et le dernier jour de decembre annee 2022
-- find name in a specific city
CREATE OR REPLACE FUNCTION find_name(ville_1 text)
    RETURNS table
            (
                IdentifiantA_1 INTEGER,
                nom_1          text,
                prenom_1       text
            )
as
$$
DECLARE
    tuple RECORD;
BEGIN
    FOR tuple IN (SELECT IdentifiantA, Nom, Prenom FROM bibliotheque.Adherant WHERE Ville = ville_1)
        LOOP
            IdentifiantA_1 := tuple.IdentifiantA;
            nom_1 := tuple.Nom;
            prenom_1 := tuple.Prenom;
            RETURN NEXT;
        END LOOP;
END;
$$ language 'plpgsql';

WITH r1 AS (SELECT * FROM bibliotheque.Emprunt WHERE DateEmprunt BETWEEN '2022/01/01' AND '2022/12/31'),
     r2 AS (SELECT IdentifiantA_1 FROM bibliotheque.find_name('Laval')),
     r3 AS (SELECT r1.NoEmprunt as id_a
            FROM r1
                     INNER JOIN r2 ON r1.IdentifiantA = r2.IdentifiantA_1),
     r4 AS (SELECT IdentifiantA, Nom, Prenom, adresse, Ville, NbTelephone
            FROM bibliotheque.Adherant
                     INNER JOIN r3 ON r3.id_a = bibliotheque.Adherant.IdentifiantA)
SELECT *
FROM r4;

-- Requete 2 -- Afficher le nombre de livres en Science-Fiction & Fantastique et Roman policier dans la table InfoLivre

--Repartion des emprunts pour le genre de science fiction
CREATE OR REPLACE FUNCTION genre_books(genre_1 text, genre_2 text, OUT count_books_nb_1 INTEGER,
                                       OUT count_books_nb_2 INTEGER) as
$$
DECLARE
    tuple RECORD;
BEGIN
    count_books_nb_1 := 0;
    count_books_nb_2 := 0;
    FOR tuple IN (SELECT bibliotheque.InfoLivre.Titre,
                         bibliotheque.Livre.ISBN,
                         bibliotheque.InfoLivre.Genre,
                         bibliotheque.InfoLivre.ISBN
                  FROM bibliotheque.Livre
                           INNER JOIN bibliotheque.InfoLivre ON bibliotheque.Livre.ISBN = InfoLivre.ISBN)
        LOOP
            IF (tuple.Genre = genre_1)
            THEN
                count_books_nb_1 := count_books_nb_1 + 1;
            END IF;
            IF (tuple.Genre = genre_2)
            THEN
                count_books_nb_2 := count_books_nb_2 + 1;
            END IF;
        END LOOP;
END;
$$ language 'plpgsql';


SELECT *
FROM bibliotheque.genre_books('Science-Fiction & Fantastique', 'Roman policier');


-- Requete 3 -- Afficher le titre du livre, l'identifiant du livre, le numéro d'emprunt, le nom et prénom de la personne ainsi que 
-- le numéro de commande dont la date de commande est entre 2022/01/01 et 2022/12/31. Les adhérants habitent à Montréal.
WITH r1 AS (SELECT *
            FROM bibliotheque.Commande
            WHERE DateCommande BETWEEN '2022/01/01' AND '2022/12/31' and EtatCommande = 'honore'),
     r2 AS (SELECT IdentifiantA_1 as identifiantA FROM bibliotheque.find_name('Montreal')),
     r3 as (select r1.identifiantA as id1, r1.identifiantL, r1.NoCommande
            from r1
                     inner join r2 ON r1.identifiantA = r2.identifiantA),
     r4 AS (SELECT IdentifiantA, Nom, Prenom, r3.NoCommande
            FROM bibliotheque.Adherant
                     INNER JOIN r3 ON r3.id1 = bibliotheque.Adherant.IdentifiantA),
     r5 AS (SELECT bibliotheque.Emprunt.IdentifiantL, NoEmprunt, r4.Nom, r4.Prenom, r4.noCommande
            FROM bibliotheque.Emprunt
                     INNER JOIN r4 ON Emprunt.IdentifiantA = r4.IdentifiantA),
     r6 AS (select bibliotheque.Livre.Identifiantl as ID, bibliotheque.InfoLivre.Titre
            from bibliotheque.Livre
                     inner join bibliotheque.InfoLivre on Livre.isbn = bibliotheque.InfoLivre.isbn),
     r7 AS (SELECT *
            FROM r6
                     INNER JOIN r5 ON r5.IdentifiantL = r6.ID)
SELECT *
FROM r7;


-- Requete 4 --
-- Selectionner le nombre de livre emprunté
SELECT COUNT(EtatCommande) AS Etat_des_livres
FROM bibliotheque.Commande
GROUP BY EtatCommande;



commit;

