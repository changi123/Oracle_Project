-- �α���
    CREATE OR REPLACE PROCEDURE login
    (
    --�Ķ���� �α���ID , �α��κ�й�ȣ
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
        DBMS_OUTPUT.PUT_LINE('�����ڷα��μ���!');        
        ELSIF vid = pid AND plevel = '1' then
        DBMS_OUTPUT.PUT_LINE('����ڷα��μ���!');
        else 
        DBMS_OUTPUT.PUT_LINE('��ȸ���α��� ����!');
        -- ���� =0
        END if;
        
    EXCEPTION 
    WHEN NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('��й�ȣ �Ǵ� ID�� ��ġ���� �ʽ��ϴ�');
    END;
       




execute login('ABC456','INFP','2'); -- ������
execute login('ABC123','ESFP','1'); -- �����
execute login('��ȸ��1','��ȸ��1','0'); -- ��ȸ��
execute login('','12','O'); -- ���� ���
	
