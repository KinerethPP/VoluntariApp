CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_administrador`(
    IN id_admin INT,
    IN name_ VARCHAR(255),
    IN email_ VARCHAR(255),
    IN password_ VARCHAR(15)
)
BEGIN
    DECLARE current_email VARCHAR(255);
    DECLARE current_password VARCHAR(255);
    
    /* Obtener el correo y la contraseña actuales */
    SELECT email, password INTO current_email, current_password
    FROM users
    WHERE id = (SELECT user_id FROM administrators WHERE id = id_admin);

    /* Verificar que el correo y la contraseña sean diferentes a los actuales */
    IF current_email <> email_ AND current_password <> password_ THEN
        /* Tabla de organizacion, actualización de datos personales */
        UPDATE administrators
        SET name = name_
        WHERE id = id_admin;

        /* Tabla de usuarios, actualización de datos (email, password) */
        UPDATE users
        SET email = email_, password = password_
        WHERE id = (SELECT user_id FROM administrators WHERE id = id_admin);
        commit;

        SELECT 'Actualización exitosa' AS result;
    ELSE
        SELECT 'El correo y la contraseña deben ser diferentes a los actuales' AS result;
    END IF;
END