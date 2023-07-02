-- 로그인
    CREATE OR REPLACE PROCEDURE login
    (
    --파라미터 로그인ID , 로그인비밀번호
        pid u_info.user_id%type
        , ppwd u_info.user_password%type
        ,  plevel u_info.user_level%type
    ) 
    IS 
        vid u_info.user_id%type := pid;   
        vpwd u_info.user_password%type := ppwd;
        vlevel u_info.user_level%type := plevel; 
    
    BEGIN
        SELECT user_id , user_password, user_level  
        INTO vid , vpwd, vlevel 
        FROM u_info 
        WHERE user_id = vid AND user_password = vpwd;


        if vid = pid AND vpwd = ppwd AND plevel = '2' then  
        DBMS_OUTPUT.PUT_LINE('관리자로그인성공!');        
        ELSIF vid = pid AND plevel = '1' then
        DBMS_OUTPUT.PUT_LINE('사용자로그인성공!');
        else 
        DBMS_OUTPUT.PUT_LINE('비회원로그인 성공!');
        -- 레벨 =0
        END if;
        
    EXCEPTION 
    WHEN NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('비밀번호 또는 ID가 일치하지 않습니다');
    END;
       




execute login('ABC456','INFP','2'); -- 관리자
execute login('ABC123','ESFP','1'); -- 사용자
execute login('비회원1','비회원1','0'); -- 비회원
execute login('','12','O'); -- 없는 비번
	
