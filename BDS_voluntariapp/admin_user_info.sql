CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `admin_user_info` AS
    SELECT 
        `a`.`id` AS `admin_id`,
        `a`.`name` AS `admin_name`,
        `a`.`user_id` AS `user_id`,
        `u`.`id` AS `id_user`,
        `u`.`email` AS `email`,
        `u`.`enable` AS `enable`,
        `u`.`role_id` AS `role_id`
    FROM
        (`administrators` `a`
        JOIN `users` `u` ON ((`a`.`user_id` = `u`.`id`)))