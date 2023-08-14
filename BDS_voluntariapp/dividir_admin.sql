CREATE DEFINER=`root`@`localhost` PROCEDURE `dividir_admin`(
email_n varchar(45),
password_n varchar(45),
enable_n tinyint,
role_n int,
name varchar(255)

)
BEGIN 
	DECLARE created_user INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	START TRANSACTION;
	insert users (email,password,enable,role_id) values (email_n,password_n,enable_n,role_n);
	SELECT LAST_INSERT_ID() INTO created_user;
	insert administrators(name,user_id) 
    values (name, created_user );
	COMMIT;
END