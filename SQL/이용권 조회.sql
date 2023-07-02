-- �����, ���ϱ� �Է��ϸ� ��� �̾ƿ��� �ڵ�
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
     IF p_type = '���ϱ�' OR p_type = '�����' THEN
        DBMS_OUTPUT.PUT_LINE( CHR(10) || '   ' || ' ����  �Ⱓ  �ð�  �ݾ� ' );
        OPEN c_ticket;
        LOOP
            FETCH c_ticket INTO v_type, v_period, v_timepass, v_price;
            EXIT WHEN c_ticket%NOTFOUND;
            IF v_type = '���ϱ�' THEN
                DBMS_OUTPUT.PUT_LINE( CHR(9) || v_type || ' ' || v_period || ' ' || v_timepass || ' ' || v_price);
            ELSIF v_type = '�����' THEN
                DBMS_OUTPUT.PUT_LINE( CHR(9) || v_type || ' ' || v_period || ' ' || v_timepass |
| ' ' || v_price);
            END IF;
        END LOOP;
        CLOSE c_ticket;
    ELSE
        RAISE_APPLICATION_ERROR(-20000, '�߸��� �����Դϴ�. �������� �ʴ� �̿���Դϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Code: ' || SQLCODE || ' ' || SQLERRM);    
END;
EXECUTE check_day_tickets('���ϱ�');
EXECUTE check_day_tickets('�����');
EXECUTE check_day_tickets('��');