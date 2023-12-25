-- Процедура оновлює інформацію про чемпіона за його ідентифікатором.
CREATE OR REPLACE PROCEDURE UpdateChampionInfo(IN championId INT, IN newName VARCHAR(30), IN newCountry VARCHAR(30))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Champion
    SET Name = newName, represented_country = newCountry
    WHERE ID = championId;
END;
$$;

-- CALL UpdateChampionInfo(1, 'Mykola Marynych', 'Ukraine');