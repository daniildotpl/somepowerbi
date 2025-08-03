USE test;
WITH ranked AS (
SELECT 
    year,
    region,
    tip_mo,
    visits,
    ROUND(COUNT(*) OVER (PARTITION BY region, tip_mo)*100/COUNT(*) OVER (PARTITION BY region), 1) peroftype,
    ROUND(visits/(SELECT test.population.population FROM population WHERE population.region=statinfo.region AND population.year=statinfo.year)*100000, 1) visits_on_th
FROM test.statinfo
)
SELECT 
    year AS " | YEAR",
    region AS " | REGION",
    tip_mo AS " | TYPE OF ORG.",
    peroftype AS " | PERC. OF ORG. OF THIS TYPE",
    DENSE_RANK() OVER (PARTITION BY region ORDER BY peroftype DESC) AS " | RANK PERC. OF TYPE",
    visits_on_th AS " | VISITS ON 100th",
    DENSE_RANK() OVER (PARTITION BY region ORDER BY visits_on_th DESC) AS " | RANK VISITS JF ORG. ON 100th"
FROM ranked
ORDER BY year, region;