--- Data Cleaning

SELECT *
FROM layoffs;

# Steps
--- 1. Remove Duplicates
--- 2. Standardize the Data
--- 3. Null values or blank values
--- 4. Remove any columns 



--- create a dublicate table

CREATE TABLE layoffs_staging
LIKE layoffs;

---- check
SELECT * 
FROM layoffs_staging;

-- insert data
INSERT layoffs_staging
SELECT *
FROM layoffs;

--- 1. check duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised  ) as row_num
FROM layoffs_staging;

-- cte
-- find duplicates

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised ) as row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

-- check manually duplicate
SELECT * 
FROM layoffs_staging
where company= 'Beyond Meat';

---- create new database with extra row

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` bigint DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised` double DEFAULT NULL,
  `row_num` INT
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- check table

SELECT * 
FROM layoffs_staging2;

-- copy the values of cte : bcz we can not update cte 

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised ) as row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging2
WHERE row_num >1;

SELECT * 
FROM layoffs_staging2
where company= 'Beyond Meat';

-- Delete the row where row_num > 1

DELETE
FROM layoffs_staging2
WHERE row_num >1;

-- check after delete
SELECT * 
FROM layoffs_staging2
WHERE row_num >1;

---- now remove the row_num
ALTER TABLE layoffs_staging2 
DROP COLUMN row_num; 

--- Standardizing data
--- trim the data

UPDATE layoffs_staging2
SET 
	company = TRIM(company),
    location = TRIM(location),
    industry = TRIM(industry),
    stage = TRIM(stage),
    country = TRIM(country);
    
SELECT *
from layoffs_staging2;
	
---- data column in  date type

SELECT `date`
from layoffs_staging2;

-- change format

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

--- change dtype to date

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

---- Working in NULL & Blank values
-- check null values column by column

SELECT *
from layoffs_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
 # remove this null values bcz both laid off is null
 
-- check blank
SELECT *
from layoffs_staging2 
WHERE percentage_laid_off = ''
AND total_laid_off = ''
;

-- industry 

SELECT *
from layoffs_staging2 
WHERE industry = ''
;

--- check table
SELECT *
from layoffs_staging2 
WHERE company = 'Appsmith'
;

--- update blank vlaues to NULL

UPDATE layoffs_staging2
SET industry = null
WHERE industry = '';

UPDATE layoffs_staging2
SET 
    company = NULLIF(company, ''),
    location = NULLIF(location, ''),
    total_laid_off = NULLIF(total_laid_off, ''),
    percentage_laid_off = NULLIF(percentage_laid_off, ''),
    stage = NULLIF(stage, ''),
    country = NULLIF(country, ''),
    funds_raised = NULLIF(funds_raised, '')
WHERE 
    company = '' OR 
    location = '' OR 
    total_laid_off = '' OR 
    percentage_laid_off = '' OR 
    stage = '' OR 
    country = '' OR 
    funds_raised = '';


