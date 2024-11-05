CREATE DATABASE reserva_hotel;

\c reserva_hotel;

CREATE TABLE hospedes(
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL
);

INSERT INTO hospedes (nome, telefone, email, CPF)
VALUES
('Lucas Pereira', '(11) 91234-5678', 'lucas.pereira@gmail.com', '123.456.789-00'),
('Mariana Silva', '(21) 97654-3210', 'mariana.silva@gmail.com', '234.567.890-11'),
('Rafael Oliveira', '(31) 99876-5435', 'rafael.oliveira@gmail.com', '345.678.901-22'),
('Beatriz Costa', '(41) 98765-4321', 'beatriz.costa@gmail.com', '456.789.012-33'),
('Gabriel Santos', '(51) 91234-8765', 'gabriel.santos@gmail.com', '567.890.123-44'),
('Ana Martins', '(61) 92345-6789', 'ana.martins@gmail.com', '678.901.234-55'),
('Pedro Lima', '(71) 93456-7890', 'pedro.lima@gmail.com', '789.012.345-66'),
('Juliana Fernandes', '(81) 94567-8901', 'juliana.fernandes@gmail.com', '890.123.456-77'),
('Thiago Ribeiro', '(91) 95678-9012', 'thiago.ribeiro@gmail.com', '901.234.567-88'),
('Camila Rocha', '(91) 96789-0123', 'camila.rocha@gmail.com', '012.345.678.99');

SELECT * FROM hospedes;

CREATE TABLE quartos(
    id_quarto SERIAL PRIMARY KEY,
    n_quarto INT UNIQUE NOT NULL,
    andar VARCHAR(5) NOT NULL,
    tipo VARCHAR(100) NOT NULL
);

INSERT INTO quartos (n_quarto, andar, tipo)
VALUES
(01, '1°', 'Solteiro'),
(02, '1°', 'Suíte'),
(03, '1°', 'Solteiro'),
(04, '2°', 'Suíte'),
(05, '2°', 'Solteiro'),
(06, '2°', 'Suíte'),
(07, '3°', 'Solteiro'),
(08, '3°', 'Suíte'),
(09, '3°', 'Solteiro'),
(10, '4°', 'Suíte'),
(11, '4°', 'Solteiro'),
(12, '4°', 'Suíte'),
(13, '5°', 'Solteiro'),
(14, '5°', 'Suíte'),
(15, '5°', 'Solteiro');

SELECT * FROM quartos;

CREATE TABLE reservas(
    id_reserva SERIAL PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_entrada DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    data_saida DATE NOT NULL,
    hora_saida TIME NOT NULL,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO reservas (id_hospede, id_quarto, data_entrada, hora_entrada, data_saida, hora_saida)
VALUES
(1, 11, '22-10-2024', '14:30:00', '25-10-2024', '11:00:00'),
(2, 3, '15-10-2024', '16:00:00', '18-10-2024', '10:30:00'),
(3, 8, '01-11-2024', '09:00:00', '04-11-2024', '12:00:00'),
(4, 2, '28-02-2024', '12:45:00', '03-03-2024', '09:15:00'),
(5, 1, '20-09-2024', '10:00:00', '24-09-2024', '14:30:00'),
(6, 6, '10-11-2024', '15:20:00', '13-11-2024', '11:00:00'),
(7, 5, '05-06-2024', '17:45:00', '07-06-2024', '13:00:00'),
(8, 15, '19-03-2024', '08:00:00', '22-03-2024', '10:30:00'),
(9, 4, '02-12-2024', '13:30:00', '05-12-2024', '15:15:00'),
(10, 10, '23-09-2024', '14:00:00', '27-09-2024', '12:30:00');

SELECT * FROM reservas;