-- 일별 매출,일별 이용권 카운트 
CREATE OR REPLACE PROCEDURE ticket_total
(
    p_pad   t_order.order_paidtime%TYPE
)
IS
    vcount11 NUMBER;
    vcount12 NUMBER;
    
    vcount211 NUMBER;
    vcount221 NUMBER;
    
    vcount212 NUMBER;
    vcount222 NUMBER;
    
    vcount213 NUMBER;
    vcount223 NUMBER;
    
    vcount214 NUMBER;
    vcount224 NUMBER;
    
    -------------------------------------------
    vcountprice11 NUMBER ;
    vcountprice12 NUMBER ;
    
    vcountprice211 NUMBER ;
    vcountprice221 NUMBER ;
    
    vcountprice212 NUMBER ;
    vcountprice222 NUMBER ;
    
    vcountprice213 NUMBER ;
    vcountprice223 NUMBER ;
    
    vcountprice214 NUMBER ;
    vcountprice224 NUMBER ;
    
    
BEGIN






    SELECT count(*) INTO vcount11  -- 일일권 11판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,2) = '11';
    
    SELECT count(*) INTO vcount12  -- 일일권 12판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,2) = '12';
    
    ------------------------------------------------------------------
    
    SELECT count(*) INTO vcount211  -- 일일권 211판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '211';
    
    SELECT count(*) INTO vcount221  -- 일일권 221판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '221';
    
    SELECT count(*) INTO vcount212  -- 일일권 212판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '212';
    
    SELECT count(*) INTO vcount222  -- 일일권 222판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '222';
    
    
    SELECT count(*) INTO vcount213  -- 일일권 213판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '213';
    
    
    SELECT count(*) INTO vcount223  -- 일일권 223판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '223';
    
    
    SELECT count(*) INTO vcount214  -- 일일권 214판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '214';
    
    
    SELECT count(*) INTO vcount224  -- 일일권 224판매 개수 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '224';
    
    


    vcountprice11 := vcount11 *1000;
    vcountprice12 := vcount12 *2000;
    
    vcountprice211 := vcount211 *3000;
    vcountprice221 := vcount221 *4000;
    
    vcountprice212 := vcount212 *5000;
    vcountprice222 := vcount222 *7000;
    
    vcountprice213 := vcount213 *15000;
    vcountprice223 := vcount223 *20000;
    
    vcountprice214 := vcount214 * 30000;
    vcountprice224 := vcount224 * 40000;
    


    DBMS_OUTPUT.PUT_LINE('[이용권종류]'|| '[이용권 코드]' ||  '[이용권 판매 수량]' ||'[일간 매출]');
     
    DBMS_OUTPUT.PUT_LINE('   일일권' || '       '|| '11' || '            ' || vcount11 || '          ' || vcountprice11);
    DBMS_OUTPUT.PUT_LINE('   일일권' || '       '|| '12' || '            ' || vcount12 || '          ' || vcountprice12);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '211' || '            '|| vcount211 || '          ' || vcountprice211);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '221' || '            '|| vcount221 || '          ' || vcountprice221);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '212' || '            '|| vcount212 || '          ' || vcountprice212);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '222' || '            '|| vcount222 || '          ' || vcountprice222);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '213' || '            '|| vcount213 || '          ' || vcountprice213);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '223' || '            '|| vcount223 || '          ' || vcountprice223);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '214' || '            '|| vcount214 || '          ' || vcountprice214);
    DBMS_OUTPUT.PUT_LINE('   정기권' || '      '|| '224' || '            '|| vcount224 || '          ' || vcountprice224);
    
    
    
            
    
--EXCEPTION
END;


EXECUTE ticket_total ('2022-12-09');
	