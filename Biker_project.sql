WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
SELECT 
    a.dteday,
    a.season,
    a.yr,
    a.weekday,
    a.hr,
    a.rider_type,
    a.riders,
    b.price,
    b.COGS,
    a.riders * b.price AS total_revenue,
    a.riders * b.price - b.COGS*riders AS profit
FROM cte a
LEFT JOIN cost_table b 
    ON a.yr = b.yr;
