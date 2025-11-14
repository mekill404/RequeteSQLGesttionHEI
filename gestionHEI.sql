CREATE DATABASE "gestionHEI"
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LOCALE_PROVIDER = 'libc'
  CONNECTION LIMIT = -1
  IS_TEMPLATE = False;

COMMENT ON DATABASE "gestionHEI"
  IS 'Exercice pour la rentrer';

CREATE TABLE Team
(
 id SERIAL PRIMARY KEY,
 name VARCHAR(50) NOT NULL
);

INSERT INTO Team VALUES (DEFAULT, 'AXIAN'), (DEFAULT, 'SODIATE'), (DEFAULT,'TGV');

CREATE TABLE Employe
(
 id SERIAL PRIMARY KEY,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 contract_type VARCHAR(50) NOT NULL,
 salary INTEGER NOT NULL,
 id_team INTEGER REFERENCES Team(id)
);

INSERT INTO Employe VALUES (DEFAULT, 'Hassanein', 'Hiridjee', 'CDI', '80000000', 1),
                      (DEFAULT, 'Jean', 'Dupont', 'CDD', '5000000', 2),
                      (DEFAULT, 'Marie', 'Curie', 'CDI', '7000000', NULL),
                      (DEFAULT, 'Albert', 'Einstein', 'Freelance', '6000000', 3),
                      (DEFAULT, 'Isaac', 'Newton', 'CDI', '7500000', NULL);

-- ici leave répresente une congée
CREATE TABLE Leave
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  id_employe INTEGER REFERENCES Employe(id)
);

INSERT INTO Leave VALUES (DEFAULT, '2025-11-14', '2025-11-20', 1), (DEFAULT, '2025-11-30', '2026-01-05', 3);


--Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.
-- SELECT id, first_name, last_name
-- FROM Employe
-- WHERE id_team IS NULL;

--Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.
-- SELECT e.id, e.first_name, e.last_name
-- FROM Employe AS e
-- LEFT JOIN Leave AS l ON e.id = l.id_employe
-- WHERE l.id IS NULL;
--Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé, le nom & prénom de l’employé qui prend congé et le nom de son équipe.
--Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat, et le nombre d’employés associés.
--Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus jusqu’à end_date inclus.
--Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui sont en congé aujourd’hui. Pour rappel, la end_date est incluse dans le congé, l’employé ne revient que le lendemain. 

