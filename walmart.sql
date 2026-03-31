SELECT * FROM walmart;



-- 1 Find sales trend by season

SELECT 
    season,
    ROUND((SUM(weekly_sales) / (SELECT 
                    SUM(weekly_sales)
                FROM
                    walmart)) * 100,
            2) AS percentage,
    ROUND(SUM(weekly_sales), 2) AS total_sales,
    ROUND(AVG(weekly_sales), 2) AS average_sales
FROM
    walmart
GROUP BY season
ORDER BY season DESC;


-- 2 Find month with highest sales


SELECT 
    `month`, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM
    walmart
GROUP BY `month`
ORDER BY total_sales DESC
LIMIT 1;


-- 3 Compare holiday vs non-holiday sales

SELECT 
    holiday_flag, ROUND(AVG(weekly_sales), 2) AS total_sales
FROM
    walmart
GROUP BY holiday_flag;


-- 4 Find the top 3 stores with the highest total sales.
SELECT 
    store, ROUND(SUM(weekly_sales)) AS total_sales
FROM
    walmart
GROUP BY store
ORDER BY total_sales DESC
LIMIT 3;



-- 5 Rank stores based on total sales.
select rank() over(order by round(sum(weekly_sales),2) desc) as `rank`,store,round(sum(weekly_sales),2) as total_sales from walmart group by store; 



-- 6 Find the best-performing store in each season
select season,store,total_sales from(

select store,season,sum(weekly_sales) as total_sales,
rank() over(partition by season   order by sum(weekly_sales)desc) as `rank`
from walmart group by season,store) t
where `rank`=1
;


-- 7 Find the date with the highest weekly sales
SELECT 
    `date`, weekly_sales
FROM
    walmart
ORDER BY `date` DESC
LIMIT 1;



-- 8 Find percentage contribution of each store to total sales.
SELECT 
    store,
    ROUND(SUM(weekly_sales) / (SELECT 
                    SUM(weekly_sales)
                FROM
                    walmart) * 100,
            2) AS percentage
FROM
    walmart
GROUP BY store;
 
 
 
 -- 9 Compare average sales on holiday vs non-holiday weeks
SELECT 
    holiday_flag, ROUND(AVG(weekly_sales), 2) AS weekly_sales
FROM
    walmart
GROUP BY holiday_flag;



-- 10 Does temperature affect sales?
SELECT 
    temperature, ROUND(AVG(weekly_sales), 2) AS average
FROM
    walmart
GROUP BY temperature
ORDER BY temperature DESC
LIMIT 10;



-- 11 Season with Highest Sales
SELECT 
    season, ROUND(SUM(weekly_sales), 2) AS sales
FROM
    walmart
GROUP BY season
ORDER BY season DESC;



-- 12 “Which store performs best during holidays?

SELECT 
    holiday_flag, store, AVG(weekly_sales) AS sales
FROM
    walmart
WHERE
    holiday_flag = 1
GROUP BY store
ORDER BY sales DESC
LIMIT 1



-- 13 Calculate Sales Change


select store,`date`,weekly_sales,lag(weekly_sales,1,0) over(partition  by store order by `date`)
as prev_sales,weekly_sales-lag(weekly_sales,1,0) over(partition  by store order by `date`) as sale_change from walmart; 


-- 14 Which store has the largest increase in sales compared to previous week?
select store,`date`,weekly_sales,weekly_sales-lag(weekly_sales,1,0) 
over(partition by store order by `date` desc ) as sales_growth 
 from walmart order by sales_growth desc limit 1;     