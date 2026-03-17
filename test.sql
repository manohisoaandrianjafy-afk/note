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


