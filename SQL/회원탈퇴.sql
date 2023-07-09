-- 회원탈퇴


CREATE OR REPLACE PROCEDURE user_delete
(
    p_user_id IN u_info.user_id%TYPE
)
IS
BEGIN
    DELETE FROM u_info
    WHERE user_id = p_user_id;
        DBMS_OUTPUT.PUT_LINE(p_user_id || ' 회원님의 정보가 삭제되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 회원이 존재하지 않습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('삭제 중 오류가 발생했습니다.');
END;

EXEC Sign_up('ABC922',211,'QWE','장준혁','ksjdh@naver.com','010-4567-8452','남','1995-05-18',45,1);