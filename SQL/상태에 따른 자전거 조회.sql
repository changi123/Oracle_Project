-- 자전거 상태 조회
CREATE OR REPLACE PROCEDURE sel_bike_status
(
    pbike_status bic_info.bicycle_status%type
)
IS
    
    vbike_id bic_info.bicycle_id%type;
    vbicycle_model bic_info.bicycle_model%type;
    vbicycle_status bic_info.bicycle_status%type;
    
    CURSOR vcursor IS(
    SELECT bicycle_id, bicycle_model , bicycle_status
    FROM bic_info
    WHERE  bicycle_status = pbike_status
    
    );
BEGIN


    
    DBMS_OUTPUT.PUT_LINE('현재 상태 : '|| pbike_status);
    OPEN vcursor;
    LOOP
        FETCH vcursor INTO vbike_id, vbicycle_model , vbicycle_status;
        EXIT WHEN vcursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vbike_id || ' ' || vbicycle_model);
    END LOOP;
    CLOSE vcursor;
 
END;




EXEC sel_bike_status('수리중');