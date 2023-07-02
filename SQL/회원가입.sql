-- 회원가입


CREATE OR REPLACE PROCEDURE Sign_up
(
    puser_id u_info.user_id%type,
    
    pticket_code u_info.ticket_code%type,
    
    puser_password u_info.user_password%type,
    
    puser_name u_info.user_name%type,
    
    puser_email u_info.user_email%type,


    puser_phone_num u_info.user_phone_num%type,
    
    puser_gender u_info.user_gender%type,
    
    puser_birth u_info.user_birth%type,
    
    puser_weight u_info.user_weight%type,
    
    puser_level u_info.user_level%type




)
IS


    vuser_id u_info.user_id%type;
    
BEGIN
   
    SELECT user_id INTO vuser_id
    FROM u_info
    WHERE user_id = puser_id;
    DBMS_OUTPUT.PUT_LINE('이미 있는 아이디입니다');
 
    
EXCEPTION when no_data_found then
    INSERT INTO u_info(user_id, ticket_code, user_password, user_name, user_email, user_phone_num, user_gender, user_birth, user_weight, user_level)
    VALUES(puser_id, pticket_code, puser_password, puser_name, puser_email, puser_phone_num, puser_gender, puser_birth, puser_weight, puser_level) ;
    
    
    INSERT INTO user_using(user_id, user_total_mileage, user_used_min, user_used_km)
    VALUES (puser_id ,0,0,0) ;
    
 
    DBMS_OUTPUT.PUT_LINE('회원가입 완료!');
    
END;




EXEC Sign_up('ABC922',211,'QWE','장준혁','ksjdh@naver.com','010-4567-8452','남','1995-05-18',45,1);