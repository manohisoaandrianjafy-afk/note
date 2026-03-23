INSERT INTO t_candidat (nom, numero) VALUES
('Rakoto Jean', 'C001');
INSERT INTO t_correcteur (nom) VALUES
('Prof Rakoto'),
('Prof Rabe'),
('Prof Andria'),
('Prof Ranaivo'),
('Prof Rasoa');
INSERT INTO t_matiere (nom) VALUES
('Mathematiques'),
('Physique'),
('Chimie'),
('Informatique'),
('Anglais');
INSERT INTO t_resolution (nom) VALUES
('plus_petit'),
('plus_grand'),
('moyenne');
-- INSERT INTO t_operateur (operateur) VALUES
-- (1), -- <
-- (2); -- >
INSERT INTO t_operateur (operateur) VALUES
(1), -- <
(2),--  <=
(3),--- >
(4);--- >=
INSERT INTO t_parametre (id_matiere, diff, id_operateur, id_resolution) VALUES
(1, 3.00, 1, 1),
(1, 3.00, 2, 3);  
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
-- Mathématiques (matiere 1)
(1, 1, 1, 6),
(1, 2, 1, 7),
(1, 3, 1, 8);

-------test 1 ----------
INSERT INTO t_candidat (nom, numero) VALUES
('Rakoto Jean', 'C001');

INSERT INTO t_correcteur (nom) VALUES
('Prof Rakoto'),
('Prof Rabe'),
('Prof Andria'),
('Prof Ranaivo'),
('Prof Rasoa');
INSERT INTO t_matiere (nom) VALUES
('Mathematiques'),
('Physique'),
('Chimie'),
('Informatique'),
('Anglais');
INSERT INTO t_resolution (nom) VALUES
('plus_petit'),
('plus_grand'),
('moyenne');
INSERT INTO t_operateur (operateur) VALUES
(1), -- <
(2); -- >
INSERT INTO t_parametre (id_matiere, diff, id_operateur, id_resolution) VALUES
(1, 3.00, 1, 1),
(1, 3.00, 2, 3);  
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
-- Mathématiques (matiere 1)
(1, 1, 1, 6),
(1, 2, 1, 7),
(1, 3, 1, 7);


------------test 2 -------------------------
INSERT INTO t_candidat (nom, numero) VALUES
('Rakoto Jean', 'C001');
INSERT INTO t_correcteur (nom) VALUES
('Prof Rakoto'),
('Prof Rabe'),
('Prof Andria'),
('Prof Ranaivo'),
('Prof Rasoa');
INSERT INTO t_matiere (nom) VALUES
('Mathematiques'),
('Physique'),
('Chimie'),
('Informatique'),
('Anglais');
INSERT INTO t_resolution (nom) VALUES
('plus_petit'),
('plus_grand'),
('moyenne');
INSERT INTO t_operateur (operateur) VALUES
(1), -- >
(2); -- <
INSERT INTO t_parametre (id_matiere, diff, id_operateur, id_resolution) VALUES
(1, 4.00, 2, 3),
(1, 6.00, 1, 2),
(1, 2.00, 2, 1);  
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
-- Mathématiques (matiere 1)
(1, 1, 1, 12),
(1, 2, 1, 10),
(1, 3, 1, 8);


------------test aujourd'hui (OK)-------------------------
INSERT INTO t_candidat (nom, numero) VALUES
('Candidat 1', 'C001'),
('Candidat 2', 'C002');

INSERT INTO t_correcteur (nom) VALUES
('Correcteur 1'),
('Correcteur 2'),
('Correcteur 3');

INSERT INTO t_matiere (nom) VALUES
('JAVA'),
('PHP');

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
(1, 3, 1, 2),
(1, 3, 4, 3),
(2, 2, 2, 1),
(2, 2, 3, 2);

----candidat 1--------
--JAVA
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(1, 1, 1, 12),
(1, 2, 1, 11);

--PHP
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(1, 1, 2, 7),
(1, 2, 2, 11);


----candidat 2--------
--JAVA
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(2, 1, 1, 13),
(2, 2, 1, 10);

--PHP
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(2, 1, 2, 14),
(2, 2, 2, 16);






------------test aujourd'hui-------------------------
INSERT INTO t_candidat (nom, numero) VALUES
('Candidat 1', 'C001'),
('Candidat 2', 'C002');

INSERT INTO t_correcteur (nom) VALUES
('Correcteur 1'),
('Correcteur 2'),
('Correcteur 3');

INSERT INTO t_matiere (nom) VALUES
('JAVA'),
('PHP');

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
(1, 7, 1, 2),
(1, 7, 4, 3),
(2, 2, 2, 1),
(2, 2, 3, 2);



----candidat 1--------
--JAVA
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(1, 1, 1, 15),
(1, 2, 1, 10),
(1, 3, 1, 12);

--PHP--------------
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(1, 1, 2, 10),
(1, 2, 2, 10);


----candidat 2--------
--JAVA---------
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(2, 1, 1, 9),
(2, 2, 1, 8),
(2, 3, 1, 11);

--PHP----------
INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(2, 1, 2, 13),
(2, 2, 2, 11);


----test alea candidat 1--------
INSERT INTO t_candidat (nom, numero) VALUES
('Candidat 1', 'C001');

INSERT INTO t_correcteur (nom) VALUES
('Correcteur 1'),
('Correcteur 2'),
('Correcteur 3');

INSERT INTO t_matiere (nom) VALUES
('JAVA');

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
(1, 8, 4, 2),
(1, 12, 1, 1);


INSERT INTO t_note (id_candidat, id_correcteur, id_matiere, note) VALUES
(1, 1, 1, 15),
(1, 2, 1, 10),
(1, 3, 1, 12);
