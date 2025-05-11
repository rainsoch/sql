CREATE TABLE fine (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    number_plate VARCHAR(6),
    violation VARCHAR(50),
    sum_fine DECIMAL(8,2),
    date_violation DATE,
    date_payment DATE
);

INSERT INTO fine (fine_id, name, number_plate, violation, sum_fine, date_violation, date_payment) VALUES
(1, 'Баранов П.Е.', 'Р523ВТ', 'Превышение скорости (от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
(2, 'Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 1000.00, '2020-01-14', '2020-02-27'),
(3, 'Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости (от 20 до 40)', 500.00, '2020-01-23', '2020-02-23'),
(4, 'Яковлев Г.Р.', 'М701АА', 'Превышение скорости (от 20 до 40)', NULL, '2020-01-12', NULL),
(5, 'Колесов С.П.', 'К892АХ', 'Превышение скорости (от 20 до 40)', NULL, '2020-02-01', NULL),
(6, 'Баранов П.Е.', 'Р523ВТ', 'Превышение скорости (от 40 до 60)', NULL, '2020-02-14', NULL),
(7, 'Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', NULL, '2020-02-23', NULL),
(8, 'Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', NULL, '2020-03-03', NULL);
select *from fine;
CREATE TABLE traffic_violation (
    violation_id INT PRIMARY KEY AUTO_INCREMENT,
    violation VARCHAR(50),
    sum_fine DECIMAL(8,2)
);

INSERT INTO traffic_violation (violation_id, violation, sum_fine) VALUES
(1, 'Превышение скорости (от 20 до 40)', 500.00),
(2, 'Превышение скорости (от 40 до 60)', 1000.00),
(3, 'Проезд на запрещающий сигнал', 1000.00);
select *from traffic_violation;
/*SET fine.sum_fine = fine.sum_fine * 2 
WHERE EXISTS (SELECT 1 FROM fine AS f2 WHERE f2.name = f1.name AND f2.number_plate = f1.number_plate AND f2.violation = f1.violation AND f2.fine_id < fine.fine_id );*/
/*UPDATE fine
SET sum_fine = sum_fine / 2
WHERE date_payment IS NOT NULL AND DATEDIFF(date_payment, date_violation) <= 20;*/
CREATE TABLE unpaid_fines 
SELECT *
FROM fine
WHERE date_payment IS NULL;
SELECT *from unpaid_fines;

/*DELETE FROM fine WHERE date_violation < '2020-02-01';*/


