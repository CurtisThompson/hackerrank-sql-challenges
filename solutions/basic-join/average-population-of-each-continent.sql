SELECT Country.Continent, FLOOR(AVG(City.Population))
FROM Country
INNER JOIN City ON Country.Code = City.CountryCode
GROUP BY Country.Continent