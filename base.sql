CREATE TABLE t_candidat(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL
);
CREATE TABLE t_correcteur(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);
CREATE TABLE t_matiere(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);
CREATE TABLE t_resolution(
    id SERIAL PRIMARY KEY,
     nom VARCHAR(255) NOT NULL
   
);
CREATE TABLE t_operateur(
    id SERIAL PRIMARY KEY,
    operateur INT NOT NULL
   
);
CREATE TABLE t_parametre(
    id SERIAL PRIMARY KEY,
    id_matiere INT NOT NULL,
    diff NUMERIC(5,2) NOT NULL,
    id_operateur INT NOT NULL,
    id_resolution INT NOT NULL,
    FOREIGN KEY (id_matiere) REFERENCES t_matiere(id),
    FOREIGN KEY (id_operateur) REFERENCES t_operateur(id),
    FOREIGN KEY (id_resolution) REFERENCES t_resolution(id)
);


CREATE TABLE t_note(
    id SERIAL PRIMARY KEY,
    id_candidat INT NOT NULL,
    id_correcteur INT NOT NULL,
    id_matiere INT NOT NULL,
    note NUMERIC(5,2) NOT NULL,
    FOREIGN KEY (id_candidat) REFERENCES t_candidat(id),
    FOREIGN KEY (id_correcteur) REFERENCES t_correcteur(id),
    FOREIGN KEY (id_matiere) REFERENCES t_matiere(id)
);


CREATE TABLE t_notefinale(
    id SERIAL PRIMARY KEY,
    id_candidat INT NOT NULL,
    id_matiere INT NOT NULL,
    note_finale NUMERIC(5,2) NOT NULL,
    FOREIGN KEY (id_candidat) REFERENCES t_candidat(id),
    FOREIGN KEY (id_matiere) REFERENCES t_matiere(id)
);

---- alea V1 16/03/2026--------
INSERT INTO t_candidat (nom, numero) VALUES
('Candidat 3', 'C003');

INSERT INTO t_correcteur (nom) VALUES
('Correcteur 1'),
('Correcteur 2'),
('Correcteur 3');

INSERT INTO t_matiere (nom) VALUES
('PYTHON');

INSERT INTO t_resolution (nom) VALUES
('plus_petit'),
('plus_grand'),
('moyenne');

INSERT INTO t_operateur (operateur) VALUES
(1), -- <
(2),--  <=
(3),--- >
(4);--- >=

INSERT INTO t_parametre (id_matiere, diff, id_operateur, id_resolution) VALUES
(1, 4, 3, 1),
(1, 1, 3, 3);


INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(1, 1, 1, 14.5),
(1, 2, 1, 13);
