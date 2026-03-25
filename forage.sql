CREATE TABLE t_client (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    contact VARCHAR(100)
);
INSERT INTO t_client (nom, contact) VALUES
('Rakoto Jean', '0341234567'),
('Rabe Marie', '0329876543'),
('Randria Paul', '0334567890'),
('Rasoa Lala', '0347654321'),
('Rakotondrazaka Hery', '0321112233');

CREATE TABLE t_demande (
    id SERIAL PRIMARY KEY,
    id_client INT NOT NULL,
    date_demande DATE NOT NULL,
    lieu VARCHAR(150),
    district VARCHAR(100),
    CONSTRAINT fk_demande_client
        FOREIGN KEY (id_client)
        REFERENCES t_client(id)
        ON DELETE CASCADE
);
INSERT INTO t_demande (id_client, date_demande, lieu, district) VALUES
-- Client 1
(1, '2026-01-10', 'Ambohimanarina', 'Antananarivo Avaradrano'),
(1, '2026-02-15', 'Talatamaty', 'Ambohidratrimo'),

-- Client 2
(2, '2026-01-05', 'Ivato', 'Ambohidratrimo'),
(2, '2026-03-01', 'Anosizato', 'Antananarivo Atsimondrano'),
(2, '2026-03-10', 'Ampefiloha', 'Antananarivo Renivohitra'),

-- Client 3
(3, '2026-02-20', 'Mahitsy', 'Ambohidratrimo'),
(3, '2026-02-25', 'Sabotsy Namehana', 'Avaradrano'),

-- Client 4
(4, '2026-01-18', 'Fenoarivo', 'Avaradrano'),
(4, '2026-02-22', 'Andoharanofotsy', 'Atsimondrano'),
(4, '2026-03-05', 'Ankadindratombo', 'Avaradrano'),

-- Client 5
(5, '2026-01-30', 'Ambohibao', 'Ambohidratrimo'),
(5, '2026-02-12', 'Ambatolampy', 'Vakinankaratra');


CREATE TABLE t_status (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);
INSERT INTO t_status (libelle) VALUES
('Cree'),
('Devis Cree'),
('Devis Etude accepté'),
('Devis Etude refusé'),
('Devis Forage accepté'),
('Devis Forage refusé'),
('Forage commencé'),
('Forage terminé'),
('Analyse terrain');

CREATE TABLE t_demande_status (
    id SERIAL PRIMARY KEY,
    id_demande INT NOT NULL,
    id_status INT NOT NULL,
    date_status TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ds_demande
        FOREIGN KEY (id_demande)
        REFERENCES t_demande(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_ds_status
        FOREIGN KEY (id_status)
        REFERENCES t_status(id)
);

CREATE TABLE t_typedevis (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);
INSERT INTO t_typedevis (libelle) VALUES
('Etude'),
('Forage');

CREATE TABLE t_devis (
    id SERIAL PRIMARY KEY,
    id_type INT NOT NULL,
    id_demande INT NOT NULL,
    montant_total NUMERIC(12,2) NOT NULL,
    CONSTRAINT fk_devis_type
        FOREIGN KEY (id_type)
        REFERENCES t_typedevis(id),
    CONSTRAINT fk_devis_demande
        FOREIGN KEY (id_demande)
        REFERENCES t_demande(id)
        ON DELETE CASCADE
);

CREATE TABLE t_details_devis (
    id SERIAL PRIMARY KEY,
    id_devis INT NOT NULL,
    libelle VARCHAR(150) NOT NULL,
    prix NUMERIC(12,2) NOT NULL,
    CONSTRAINT fk_details_devis
        FOREIGN KEY (id_devis)
        REFERENCES t_devis(id)
        ON DELETE CASCADE
);

