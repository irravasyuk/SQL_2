--Відображення усіх овочів з калорійністю, менше вказаної.
--SELECT *
--FROM VegetablesAndFruits
--WHERE type = 'овоч' AND calories < 20

--Відображення усіх фруктів з калорійністю у вказаному діапазоні.
--SELECT *
--FROM VegetablesAndFruits
--WHERE type = 'фрукт' AND calories BETWEEN 150 AND 170

--Відображення усіх овочів, у назві яких є вказане слово. Наприклад, слово: капуста.
--SELECT *
--FROM VegetablesAndFruits
--WHERE name LIKE '%Яблуко%'

--Відображення усіх овочів та фруктів, у короткому описі яких є вказане слово. Наприклад, слово: гемоглобін.
--SELECT *
--FROM VegetablesAndFruits
--WHERE description LIKE '%вітамінів%'

--Показати усі овочі та фрукти жовтого або червоного кольору
--SELECT *
--FROM VegetablesAndFruits
--WHERE color = 'жовтий' OR color = 'червоний'

--2
--Показати кількість овочів.
--SELECT COUNT(*)
--FROM VegetablesAndFruits
--WHERE type = 'овоч' 

--Показати кількість фруктів.
--SELECT COUNT(*)
--FROM VegetablesAndFruits
--WHERE type = 'фрукт'

--Показати кількість овочів та фруктів заданого кольору.
--SELECT type, color, COUNT(*) AS color_count
--FROM VegetablesAndFruits
--WHERE color = 'зелений'
--GROUP BY type, color

--Показати кількість овочів та фруктів кожного кольору.
--SELECT type, color, COUNT(*) AS color_count
--FROM VegetablesAndFruits
--GROUP BY type, color

--Показати колір мінімальної кількості овочів та фруктів.
--SELECT color
--FROM VegetablesAndFruits
--GROUP BY color
--HAVING COUNT(*) = (
--    SELECT MIN(quantity)
--    FROM (
--        SELECT COUNT(*) AS quantity 
--        FROM VegetablesAndFruits
--        GROUP BY color
--    ) AS min_count
--)

--Показати колір максимальної кількості овочів та фруктів.
SELECT color
FROM VegetablesAndFruits
GROUP BY color
HAVING COUNT(*) = (
    SELECT MAX(quantity)
    FROM (
        SELECT COUNT(*) AS quantity 
        FROM VegetablesAndFruits
        GROUP BY color
    ) AS max_count
)

--Показати мінімальну калорійність овочів та фруктів.
--SELECT type, MIN(calories) AS min_calories
--FROM VegetablesAndFruits
--GROUP BY type

--Показати максимальну калорійність овочів та фруктів.
--SELECT type, MAX(calories) AS max_calories
--FROM VegetablesAndFruits
--GROUP BY type

--Показати середню калорійність овочів та фруктів.
--SELECT type, AVG(calories) AS min_calories
--FROM VegetablesAndFruits
--GROUP BY type

--Показати фрукт з мінімальною калорійністю.
--SELECT name, calories AS min_fruit
--FROM VegetablesAndFruits
--WHERE type = 'фрукт' AND calories = (
--	SELECT MIN(calories)
--	FROM VegetablesAndFruits
--	WHERE type = 'фрукт'
--)


--Показати фрукт з максимальною калорійністю.
--SELECT name, calories AS max_fruit
--FROM VegetablesAndFruits
--WHERE type = 'фрукт' AND calories = (
--	SELECT MAX(calories)
--	FROM VegetablesAndFruits
--	WHERE type = 'фрукт'
--)