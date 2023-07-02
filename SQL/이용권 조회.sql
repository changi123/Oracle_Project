-- 정기권, 일일권 입력하면 목록 뽑아오는 코드
CREATE OR REPLACE PROCEDURE check_day_tickets
(
    p_type IN ticket.ticket_type%TYPE
)
IS
    CURSOR c_ticket IS
        SELECT ticket_type, ticket_period, ticket_timepass, ticket_price
        FROM ticket
        WHERE ticket_type = p_type;
    v_type ticket.ticket_type%TYPE;
    v_period ticket.ticket_period%TYPE;
    v_timepass ticket.ticket_timepass%TYPE;
    v_price ticket.ticket_price%TYPE;
BEGIN
     IF p_type = '일일권' OR p_type = '정기권' THEN
        DBMS_OUTPUT.PUT_LINE( CHR(10) || '   ' || ' 종류  기간  시간  금액 ' );
        OPEN c_ticket;
        LOOP
            FETCH c_ticket INTO v_type, v_period, v_timepass, v_price;
            EXIT WHEN c_ticket%NOTFOUND;
            IF v_type = '일일권' THEN
                DBMS_OUTPUT.PUT_LINE( CHR(9) || v_type || ' ' || v_period || ' ' || v_timepass || ' ' || v_price);
            ELSIF v_type = '정기권' THEN
                DBMS_OUTPUT.PUT_LINE( CHR(9) || v_type || ' ' || v_period || ' ' || v_timepass |
| ' ' || v_price);
            END IF;
        END LOOP;
        CLOSE c_ticket;
    ELSE
        RAISE_APPLICATION_ERROR(-20000, '잘못된 정보입니다. 존재하지 않는 이용권입니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Code: ' || SQLCODE || ' ' || SQLERRM);    
END;
EXECUTE check_day_tickets('일일권');
EXECUTE check_day_tickets('정기권');
EXECUTE check_day_tickets('정');