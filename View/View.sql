-- 1
CREATE VIEW just_oz AS
SELECT * FROM alcove_book WHERE Title like '%Oz%'

  -----------------------------------
-- 2
CREATE VIEW GoT  AS
SELECT
	alcove_book.BOOKID,
    alcove_book.Title,
    alcove_book.PubDate,
    alcove_author.FName,
    alcove_author.LName,
    alcove_book.Price,
    alcove_book.inStock
FROM
    alcove_author
INNER JOIN alcove_book ON alcove_author.AUTHORID = alcove_book.AUTHORID AND alcove_author.LName = 'Martin'
----------------------------------
-- 3

  SELECT
    alcove_book.BOOKID,
    alcove_book.Title,
    alcove_book.PubDate,
    alcove_author.FName,
    alcove_author.LName,
    alcove_book.Price,
    alcove_book.inStock
FROM
    alcove_author
INNER JOIN alcove_book ON alcove_author.AUTHORID = alcove_book.AUTHORID AND alcove_author.LName = 'Martin'
ORDER BY
    alcove_book.PubDate
DESC



---------------------------------
-- 4
CREATE VIEW ALL_DATA AS SELECT
    alcove_book.BOOKID,
    alcove_book.Title,
    alcove_book.AUTHORID,
    alcove_book.PubDate,
    alcove_book.Price,
    alcove_book.InStock,
    alcove_author.FName ,
    alcove_author.LName,
    alcove_author.BirthDate,
    alcove_author.DeathDate,
    alcove_author.Netionality
FROM
    alcove_author
INNER JOIN alcove_book ON alcove_author.AUTHORID = alcove_book.AUTHORID



----------------------------------------------------
-- 5

 CREATE VIEW Books_by_Living_Authors AS SELECT
    alcove_book.BOOKID,
    alcove_book.Title,
    alcove_book.AUTHORID,
    alcove_book.PubDate,
    alcove_book.Price,
    alcove_book.InStock,
    alcove_author.FName,
    alcove_author.LName,
    alcove_author.BirthDate,
    alcove_author.DeathDate,
    alcove_author.Netionality
FROM
    alcove_author
INNER JOIN alcove_book ON alcove_author.AUTHORID = alcove_book.AUTHORID AND ALCOVE_AUTHOR.DeathDate IS NULL;

----------------------------------------------------
-- 6

CREATE VIEW View_by_Series AS SELECT
    alcove_book.Title,
    CONCAT(
        alcove_author.FName,
        " ",
        alcove_author.LName
    ) AS Author,
    alcove_book.PubDate,
    alcove_book.Price,
    alcove_book.InStock
FROM
    `alcove_author`
INNER JOIN alcove_book ON alcove_author.AUTHORID = alcove_book.AUTHORID

----------------------------------------------------
-- 7
CREATE VIEW Sale_View AS SELECT
    alcove_book.Title,
    CONCAT(
        alcove_author.FName,
        " ",
        alcove_author.LName
    ) AS Author,
    alcove_book.PubDate,
    alcove_book.Price,
    ROUND(
        alcove_book.Price -(price * 10.0 / 100.0),
        2
    ) AS SalePrice,
    alcove_book.InStock
FROM
    `alcove_author`
INNER JOIN alcove_book ON alcove_author.AUTHORID = alcove_book.AUTHORID


----------------------------------------------------
-- 8

CREATE VIEW Low_Price_Books  AS SELECT
    *
FROM
    alcove_book
WHERE
    Price < (
    SELECT
        AVG(Price)
    FROM
        `alcove_book`
)

----------------------------------------------------
-- 9

SELECT * FROM `alcove_book`
GROUP BY AUTHORID


SELECT
    *
FROM
    alcove_book
WHERE
    Price < (
    SELECT
        AVG(Price)
    FROM
        `alcove_book`
)
GROUP BY AUTHORID

----------------------------------------------------
-- 10

DROP VIEW just_oz,books_by_living_authors;
