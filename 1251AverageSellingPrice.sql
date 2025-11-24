-- нужно понять для начала к какому диапазону дат относятся проданные товары
-- для каждой строки с purchase_date даты товара делать (кол-во проданных * цену)
-- когда конец по строкам делать (кол-во проданных_1 * цену)+(кол-во проданных_2 * цену) / (кол-во проданных_1 + кол_во проданных_2)

SELECT Prices.product_id,
	ROUND(
		COALESCE(SUM(UnitsSold.units * Prices.price)*1.0/NULLIF(SUM(UnitsSold.units),0),0),
		2
	)AS average_price

FROM Prices 
LEFT JOIN UnitsSold
ON Prices.product_id = UnitsSold.product_id
AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id;