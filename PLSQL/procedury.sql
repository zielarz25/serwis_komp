-- dodawanie pracownika
create or replace procedure add_account
(	pFirstName IN varchar2,
	pLastName IN varchar2,
	pAddress IN varchar2,
	pPostCode IN NUMBER,
	pCity IN varchar2,
	pState IN varchar2,
	pPhone IN NUMBER,
	pAdmAcc IN NUMBER,
	pContractStart IN DATE,
	pContractEnd IN DATE,
	pLogin IN varchar2,
	pPass IN varchar2,
	pSalary IN FLOAT
)
IS
vContractNo NUMBER;
vAccNo NUMBER;
BEGIN

SELECT (max(NR_UMOWY)+1) INTO vContractNo FROM SERWIS.UMOWY;
SELECT (max(ID_PRACOWNIKA)+1) INTO vAccNo FROM SERWIS.PRACOWNICY;



INSERT INTO SERWIS.UMOWY (
DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, WYPLATA, NR_UMOWY, ID_PRACOWNIKA)
VALUES (
pContractStart, pContractEnd, pSalary, vContractNo, vAccNo);

INSERT INTO SERWIS.PRACOWNICY (
IMIE, NAZWISKO, ADRES, KOD_POCZTOWY, MIASTO, WOJEWODZTWO, NR_TEL,
LOGIN, HASLO, UPRAWNIENIA_ADMIN, ID_PRACOWNIKA, NR_UMOWY)
VALUES (
pFirstName, pLastName, pAddress, pPostCode, pCity, pState, pPhone, pLogin, pPass, pAdmAcc, vAccNo, vContractNo);

commit;
END;

-- przykład użycia
CALL ADD_ACCOUNT('imie','nazwisko','adres',0000,'miasto','wojewodztwo',123,0,'18/01/05','18/01/10','login','pass',1000);


-- usuwanie z bazy (niezalecane używanie, bo znika ślad po pracowniku - można użyć tylko w przypadku błędnego dodania)
create or replace procedure delete_account
(	pAccId IN NUMBER
)
IS
BEGIN
    DELETE FROM SERWIS.PRACOWNICY WHERE ID_PRACOWNIKA = pAccId;
    DELETE FROM SERWIS.UMOWY WHERE ID_PRACOWNIKA = pAccId;
commit;
END;

--zwolnienie pracownika
-- uniemożliwia logowanie i zmienia datę końca umowy
create or replace procedure dismiss_worker
(	pAccId IN NUMBER
)
IS
vDismissDate DATE; 
BEGIN
    vDismissDate := SYSDATE;
    
    UPDATE SERWIS.PRACOWNICY
    SET UPRAWNIENIA_ADMIN = -1
    WHERE ID_PRACOWNIKA = pAccId;
    
    UPDATE SERWIS.UMOWY
    SET DATA_ZAKONCZENIA = vDismissDate
    WHERE ID_PRACOWNIKA = pAccId;
commit;
END;



-- 
SELECT ID_NAPRAWY, OPIS_USTERKI, STATUS, DATA_ROZPOCZECIA from ZAMOWIENIE_NAPRAWY;


-- przyjęcie komputera do naprawy

create or replace function take_work
(   pUserId NUMBER,
    pReportNo NUMBER -- nr zgloszenia wybrany przez pracownika z tabeli zamowienie_naprawy
)
RETURN NUMBER 
IS
PRAGMA AUTONOMOUS_TRANSACTION;
	vFlag NUMBER;
BEGIN
    SELECT CASE WHEN EXISTS (SELECT * FROM ZAMOWIENIE_NAPRAWY WHERE ID_NAPRAWY = pReportNo AND STATUS = 'nowy') THEN 1 ELSE 0 END INTO vFlag FROM dual;
    IF vFlag = 1 THEN
        INSERT INTO PRACE_NAPRAWCZE (ID_USLUGI, ID_NAPRAWY, ID_PRACOWNIKA)
        -- id usugi = 1 - przyjęcie do serwisu
        VALUES (1, pReportNo, pUserId);

        UPDATE "SERWIS"."ZAMOWIENIE_NAPRAWY"
        SET STATUS = 'przyjeto'
        WHERE ID_NAPRAWY = pReportNo;
        commit;
    ELSE
        vFlag := 0;
    END IF;
    
RETURN vFlag;
END;

-- result = 0 jesli nie mozna drugi raz przydzielic, 1 jesli przydzielono
select take_work(1,1) as "result" from dual;

