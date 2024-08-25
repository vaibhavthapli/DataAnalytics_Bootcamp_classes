# Exploratory Data Analysis

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!

SELECT * 
FROM layoffs_staging2;


SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
order by total_laid_off desc;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
order by funds_raised desc;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
group by company
order by 2 desc;

select *
from layoffs_staging2
where company = 'Amazon';

SELECT company, MAX(total_laid_off) AS max_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 desc;


select MIN(`date`), MAX(`date`)
from layoffs_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
group by industry
order by 2 desc;

SELECT * 
FROM layoffs_staging2;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
group by country
order by 2 desc;

SELECT `date`, SUM(total_laid_off)
FROM layoffs_staging2
group by `date`
order by 2 desc;

SELECT company, `date`, SUM(total_laid_off) AS total_laid_off_on_date
FROM layoffs_staging2
GROUP BY company, `date`
ORDER BY 2  ;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
group by YEAR(`date`)
order by 1 desc;


SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
group by stage
order by 1 desc;

-- roling total layoff

select SUBSTRING(`date`,1,7) as `MONTH`, SUM(total_laid_off)
from layoffs_staging2
group by `MONTH`
order by 1 ASC
;

WITH Rolling_Total As
(
select SUBSTRING(`date`,1,7) as `MONTH`, SUM(total_laid_off) as total_off
from layoffs_staging2
group by `MONTH`
order by 1 ASC
)
select `MONTH`,total_off,
SUM(total_off) over(order by `MONTH`) as Rolling_total
from Rolling_Total;

SELECT company,  SUM(total_laid_off) AS total_laid_off_on_date
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC  ;


-- layoff per year in a company
SELECT company, YEAR(`date`), SUM(total_laid_off) AS total_laid_off_on_date, country
FROM layoffs_staging2
GROUP BY company, YEAR(`date`), country
ORDER BY 1 ASC 
;



SELECT company, YEAR(`date`), SUM(total_laid_off) AS total_laid_off_on_date, country
FROM layoffs_staging2
GROUP BY company, YEAR(`date`), country
ORDER BY 3 DESC 
;

--- rank which year most employee layoff

WITH Company_Year (company, years, total_laid_off) as
(
SELECT company, YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank as
(
select *, dense_rank() OVER(partition by years order by total_laid_off desc) as Ranking
from Company_Year
where years is not null
)
select *
from Company_Year_Rank
where Ranking <= 5
;