-- 검색 주변 대여소 조회
CREATE OR REPLACE PROCEDURE sel_std
(
    paround_address bic_std.stand_address%type


)
IS
    varound_address bic_std.stand_address%type := paround_address;
    
    vbike_model bic_info.bicycle_model%type;
    vcommon_bike_model number;
    vsprout_bike_model number;
    CURSOR vcursor IS(
    SELECT stand_address
    FROM  bic_std bs, bic_info bi
      WHERE stand_address LIKE ('%'||varound_address||'%')


    );   
BEGIN
    DBMS_OUTPUT.PUT_LINE('주변 대여소 목록');


    OPEN vcursor;
    LOOP
        FETCH vcursor INTO varound_address;
        EXIT WHEN vcursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(varound_address ||  vcommon_bike_model || vsprout_bike_model);
    END LOOP;
    CLOSE vcursor;
END;
EXEC sel_around_address('송파');
	