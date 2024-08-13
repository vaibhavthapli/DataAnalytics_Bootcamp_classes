-- WHERE Clause

SELECT *
FROM employee_salary
WHERE  first_name = 'Leslie'
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female'
;

-- date column

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

# logical operater
-- AND OR NOT --

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIKE Statement
-- % and _
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE  'Jer%'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE  '%er%'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE  'a__'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date  LIKE  '1989%'
;