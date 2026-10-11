USE ecommerce_analytics;

-- Advanced Question 1: How does monthly revenue change compared with the previous month?

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
        ROUND(SUM(oi.price), 2) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY month
)

SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(
        monthly_revenue -
        LAG(monthly_revenue) OVER (ORDER BY month),
        2
    ) AS revenue_change
FROM monthly_revenue
ORDER BY month;

USE ecommerce_analytics;

-- Advanced Question 2: Which sellers rank highest based on delivered revenue?

WITH seller_revenue AS (
    SELECT
        oi.seller_id,
        COUNT(DISTINCT oi.order_id) AS total_orders,
        COUNT(*) AS total_items_sold,
        ROUND(SUM(oi.price), 2) AS total_revenue
    FROM order_items oi
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.seller_id
),

ranked_sellers AS (
    SELECT
        seller_id,
        total_orders,
        total_items_sold,
        total_revenue,
        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC
        ) AS seller_rank
    FROM seller_revenue
)

SELECT
    seller_rank,
    seller_id,
    total_orders,
    total_items_sold,
    total_revenue
FROM ranked_sellers
WHERE seller_rank <= 10
ORDER BY seller_rank;

USE ecommerce_analytics;

-- Advanced Question 2: Which sellers rank highest based on delivered revenue?

WITH seller_revenue AS (
    SELECT
        oi.seller_id,
        COUNT(DISTINCT oi.order_id) AS total_orders,
        COUNT(*) AS total_items_sold,
        ROUND(SUM(oi.price), 2) AS total_revenue
    FROM order_items oi
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.seller_id
),

ranked_sellers AS (
    SELECT
        seller_id,
        total_orders,
        total_items_sold,
        total_revenue,
        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC
        ) AS seller_rank
    FROM seller_revenue
)

SELECT
    seller_rank,
    seller_id,
    total_orders,
    total_items_sold,
    total_revenue
FROM ranked_sellers
WHERE seller_rank <= 10
ORDER BY seller_rank;

USE ecommerce_analytics;

-- Advanced Question 3: How many unique customers are one-time versus repeat customers?

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
),

customer_segments AS (
    SELECT
        customer_unique_id,
        total_orders,
        CASE
            WHEN total_orders = 1 THEN 'One-time Customer'
            ELSE 'Repeat Customer'
        END AS customer_segment
    FROM customer_orders
)

SELECT
    customer_segment,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_segments),
        2
    ) AS customer_percentage
FROM customer_segments
GROUP BY customer_segment
ORDER BY total_customers DESC;
