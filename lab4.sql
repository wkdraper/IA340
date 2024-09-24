-- Q4.1
delete from name
where fips = '51' 

/* It does not work, because we still have VA records in other tables */

-- Q4.2
/* No, because no state has fips of 80 */
 
 Key (fips)=(80) is not present in table "name".

-- Q4.3
/* While close, the tables presented by ChatGPT are imperfect. */

  Table for States' Names and FIPS Codes:
  
  CREATE TABLE states (
    state_id SERIAL PRIMARY KEY,  -- Auto-incrementing primary key
    state_name VARCHAR(100) NOT NULL,  -- Name of the state
    fips_code CHAR(2) NOT NULL UNIQUE  -- FIPS code for the state
);

Table for states' population in different years: 
  
CREATE TABLE state_population (
    population_id SERIAL PRIMARY KEY,  -- Auto-incrementing primary key
    state_id INT NOT NULL,  -- Foreign key referencing states table
    year INT NOT NULL,  -- Year for the population data
    population BIGINT NOT NULL,  -- Population value
    FOREIGN KEY (state_id) REFERENCES states(state_id),
    UNIQUE (state_id, year)  -- Ensure unique population data per state and year
);

-- Q4.5
Chat GPT recognizes the table 

-- Q4.6
/* The code in question does not run. It's attempting to highlight and pull from data that doesn't exist, despite specifications. */

SELECT s.state_name, i.year, i.income
FROM states s
JOIN income i ON s.state_id = i.state_id
WHERE i.year IN (SELECT DISTINCT year FROM income ORDER BY year DESC LIMIT 5)
ORDER BY i.year DESC, i.income DESC;

-- Q4.7
/* My prompt was "calculate the VA population growth in the last five years". This is the code given by Chatgpt: */
  WITH PopulationData AS (
    SELECT sp.year, sp.population
    FROM state_population sp
    JOIN states s ON s.state_id = sp.state_id
    WHERE s.state_name = 'Virginia'
      AND sp.year IN (SELECT DISTINCT year FROM state_population ORDER BY year DESC LIMIT 5)
    ORDER BY sp.year DESC
)
SELECT
    (MAX(population) - MIN(population)) AS population_growth,
    MIN(population) AS population_five_years_ago,
    MAX(population) AS population_current_year
FROM PopulationData;

/* The modified prompt was " Using the ERD provided, calculate the VA population growth in the last five years". 
  This didnt even produce a result in chatGPT besides asking for a description of the table. */

-- Q4.8 
/* ChatGPT is unreliable at best, and seems to not be able to comprehend the ERD when provided. Upon further prompt, it attempts to provide useful code, but the code doesn't run in the
query tool on PGAdmin. */










