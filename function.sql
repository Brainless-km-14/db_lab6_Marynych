-- Функція повертає ім'я чемпіона та рік його перемоги за ідентифікатором чемпіона.
CREATE OR REPLACE FUNCTION GetChampionAndYearById(IN championId INT)
RETURNS TABLE (champoin_name VARCHAR(30),year_of_win INT)
LANGUAGE plpgsql
AS $$
BEGIN 
	RETURN QUERY
    SELECT Champion.Name AS ChampionName, year.Year AS WinningYear    
	FROM champion
    INNER JOIN year ON Champion.ID = year.ID    
	WHERE Champion.ID = ChampionID;
END;
$$;


