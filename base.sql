CREATE TABLE t_candidat(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL
);
INSERT INTO t_candidat (nom, numero) VALUES
('Rakoto Jean', 'C001'),
('Rabe Marie', 'C002'),
('Andriamatoa Paul', 'C003'),
('Rasoanaivo Clara', 'C004'),
('Randria Tom', 'C005'),
('Rafidy Lova', 'C006'),
('Razafindrakoto Hery', 'C007'),
('Ratsimbazafy Nina', 'C008'),
('Rakotomalala Eric', 'C009'),
('Andrianina Sarah', 'C010');

CREATE TABLE t_correcteur(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE t_matiere(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);
INSERT INTO t_matiere (nom) VALUES
('Mathematiques'),
('Physique'),
('Chimie'),
('Informatique'),
('Anglais');

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


CREATE TABLE t_noteFinale(
    id SERIAL PRIMARY KEY,
    id_candidat INT NOT NULL,
    id_matiere INT NOT NULL,
    note_finale NUMERIC(5,2) NOT NULL,
    FOREIGN KEY (id_candidat) REFERENCES t_candidat(id),
    FOREIGN KEY (id_matiere) REFERENCES t_matiere(id)
);