-- ȸ��Ż��


CREATE OR REPLACE PROCEDURE user_delete
(
    p_user_id IN u_info.user_id%TYPE
)
IS
BEGIN
    DELETE FROM u_info
    WHERE user_id = p_user_id;
        DBMS_OUTPUT.PUT_LINE(p_user_id || ' ȸ������ ������ �����Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ȸ���� �������� �ʽ��ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� �� ������ �߻��߽��ϴ�.');
END;

EXEC Sign_up('ABC922',211,'QWE','������','ksjdh@naver.com','010-4567-8452','��','1995-05-18',45,1);