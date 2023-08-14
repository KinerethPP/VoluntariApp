CREATE DEFINER=`root`@`localhost` PROCEDURE `dividir_info`(
email_n varchar(45),
password_n varchar(45),
enable_n tinyint,
role_n int,
name varchar(255),
street_n varchar(255),
cologe_n varchar(255),
postal_code_n varchar(5)
,municiplay_n varchar(45),
state_n varchar(45),
rfc_n varchar(13),
phone_n varchar(10) 
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
	insert organizations(bussines_name,street,cologne,postal_code,municipality,state,rfc,phone,user_id) 
    values (name,street_n,cologe_n,postal_code_n,municiplay_n,state_n,rfc_n,phone_n, created_user );
	COMMIT;
END