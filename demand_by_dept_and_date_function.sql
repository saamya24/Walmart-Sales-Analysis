CREATE DEFINER=`root`@`localhost` FUNCTION `demand_by_department_and_date`(department_id TEXT, start_date TEXT, end_date TEXT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_demand INT;

    SELECT SUM(demand) INTO total_demand
    FROM walmart.`m5 sampled test`
    WHERE dept_id = department_id
    AND date BETWEEN start_date AND end_date;

    RETURN total_demand;
END