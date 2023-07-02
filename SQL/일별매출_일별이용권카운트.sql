-- �Ϻ� ����,�Ϻ� �̿�� ī��Ʈ 
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






    SELECT count(*) INTO vcount11  -- ���ϱ� 11�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,2) = '11';
    
    SELECT count(*) INTO vcount12  -- ���ϱ� 12�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,2) = '12';
    
    ------------------------------------------------------------------
    
    SELECT count(*) INTO vcount211  -- ���ϱ� 211�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '211';
    
    SELECT count(*) INTO vcount221  -- ���ϱ� 221�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '221';
    
    SELECT count(*) INTO vcount212  -- ���ϱ� 212�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '212';
    
    SELECT count(*) INTO vcount222  -- ���ϱ� 222�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '222';
    
    
    SELECT count(*) INTO vcount213  -- ���ϱ� 213�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '213';
    
    
    SELECT count(*) INTO vcount223  -- ���ϱ� 223�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '223';
    
    
    SELECT count(*) INTO vcount214  -- ���ϱ� 214�Ǹ� ���� 
    FROM t_order
    WHERE order_paidtime = p_pad AND substr(ticket_code , 1,3) = '214';
    
    
    SELECT count(*) INTO vcount224  -- ���ϱ� 224�Ǹ� ���� 
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
    


    DBMS_OUTPUT.PUT_LINE('[�̿������]'|| '[�̿�� �ڵ�]' ||  '[�̿�� �Ǹ� ����]' ||'[�ϰ� ����]');
     
    DBMS_OUTPUT.PUT_LINE('   ���ϱ�' || '       '|| '11' || '            ' || vcount11 || '          ' || vcountprice11);
    DBMS_OUTPUT.PUT_LINE('   ���ϱ�' || '       '|| '12' || '            ' || vcount12 || '          ' || vcountprice12);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '211' || '            '|| vcount211 || '          ' || vcountprice211);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '221' || '            '|| vcount221 || '          ' || vcountprice221);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '212' || '            '|| vcount212 || '          ' || vcountprice212);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '222' || '            '|| vcount222 || '          ' || vcountprice222);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '213' || '            '|| vcount213 || '          ' || vcountprice213);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '223' || '            '|| vcount223 || '          ' || vcountprice223);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '214' || '            '|| vcount214 || '          ' || vcountprice214);
    DBMS_OUTPUT.PUT_LINE('   �����' || '      '|| '224' || '            '|| vcount224 || '          ' || vcountprice224);
    
    
    
            
    
--EXCEPTION
END;


EXECUTE ticket_total ('2022-12-09');
	