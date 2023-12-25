-- Виклик функції GetChampionAndYearById для отримання інформації про чемпіона з ідентифікатором 1
SELECT * FROM GetChampionAndYearById(1);

-- Виклик процедури UpdateChampionInfo для оновлення інформації про чемпіона з ідентифікатором 1
CALL UpdateChampionInfo(1, 'Maryncyh Mykola', 'Ukraine');

-- Оновлення імені чемпіона, тригер log_champion_modifications_trigger повинен автоматично викликати функцію log_champion_modifications
UPDATE Champion SET Name = 'Mikola Marinich' WHERE ID = 1;

SELECT * FROM champion_log;
