
SELECT * FROM `sample - superstore` LIMIT 10;

-- 卖的最热的一个产品是什么，带来了多少利益
SELECT category,round(SUM(profit),2) as totalprofit
FROM `sample - superstore`
GROUP BY category
ORDER BY totalprofit desc
LIMIT 1;

-- 公司的利润每年是怎样得？
SELECT YEAR(`order date`)as YEAR, round(sum(profit),2) as Profit
from `sample - superstore`
GROUP BY YEAR(`order date`)
ORDER BY Profit;

-- 购买这家公司最多的客户前十是谁
SELECT `customer id`,`customer name`
from `sample - superstore`
GROUP BY`customer id`,`customer name`
ORDER BY sum(profit) DESC
limit 10;

-- 每个产品里的子产品销售额情况,排名
SELECT category,
`sub-category`,
 SUM(profit) as total_profit,
DENSE_RANK()over(
      PARTITION by  category
      ORDER BY SUM(profit) DESC
   ) as erank 
FROM `sample - superstore`
GROUP BY category,`sub-category`
ORDER BY category,erank ;

