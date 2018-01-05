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


-- usuwanie z bazy (niezalecane używanie, bo znika ślad po pracowniku)
create or replace procedure delete_account
(	pAccId IN NUMBER
)
IS
BEGIN
    DELETE FROM SERWIS.PRACOWNICY WHERE ID_PRACOWNIKA = pAccId;
    DELETE FROM SERWIS.UMOWY WHERE ID_PRACOWNIKA = pAccId;
commit;
END;

