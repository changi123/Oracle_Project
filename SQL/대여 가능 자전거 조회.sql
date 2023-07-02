-- 대여가능 자전거 일반/새싹
        CREATE OR REPLACE PROCEDURE sel_bike_quantity
(
    ppaking_address bic_info.bicycle_stand%type
)
IS
    vparking_address bic_info.bicycle_stand%type := ppaking_address;
    vstand_id bic_std.stand_id%type;
    vcommon_bike number;
    vsprout_bike number ; 
    
BEGIN
    SELECT COUNT(*) 
    INTO vcommon_bike
    FROM bic_info
    WHERE bicycle_stand = ppaking_address AND bicycle_model= '일반' AND bicycle_status = '비치중';


    SELECT COUNT(*) 
    INTO vsprout_bike
    FROM bic_info
    WHERE bicycle_stand = ppaking_address AND bicycle_model= '새싹' AND bicycle_status = '비치중';
    
    
    SELECT stand_id 
    INTO vstand_id
    FROM bic_std
    WHERE stand_name = ppaking_address;
    DBMS_OUTPUT.PUT_LINE(vstand_id||vparking_address);
    DBMS_OUTPUT.PUT_LINE('일반 따릉이 : '|| ' ' || vcommon_bike);
    DBMS_OUTPUT.PUT_LINE('새싹 따릉이 : '|| ' ' || vsprout_bike);
END;
EXEC sel_bike_quantity('MBC 앞');