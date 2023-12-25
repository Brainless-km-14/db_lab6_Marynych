-- Створення таблиці champion_log для логування змін у таблиці champion.
DROP TABLE IF EXISTS champion_log;
CREATE TABLE champion_log (
    log_id SERIAL PRIMARY KEY,
    champion_id INT,
    modification_time TIMESTAMP);


-- Створення функції та тригера для автоматичного додавання записів у champion_log при модифікації champion.
CREATE OR REPLACE FUNCTION log_champion_modifications()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO champion_log (champion_id, modification_time)
    VALUES (NEW.ID, CURRENT_TIMESTAMP);
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER log_champion_modifications_trigger
AFTER UPDATE ON champion
FOR EACH ROW
EXECUTE FUNCTION log_champion_modifications();


-- Тестування тригера для таблиці Champion
UPDATE Champion SET Name = 'Mikola Marinich' WHERE ID = 1;

-- Перевірка логу для таблиці champion_log
SELECT * FROM champion_log;


