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
    vWorkNo NUMBER;
BEGIN
    SELECT max(ID_PRACY)+1 INTO vWorkNo FROM PRACE_NAPRAWCZE;
    SELECT CASE WHEN EXISTS (SELECT * FROM ZAMOWIENIE_NAPRAWY WHERE ID_NAPRAWY = pReportNo AND STATUS = 'nowy') THEN 1 ELSE 0 END INTO vFlag FROM dual;
    IF vFlag = 1 THEN
        INSERT INTO PRACE_NAPRAWCZE (ID_PRACY, ID_USLUGI, ID_NAPRAWY, ID_PRACOWNIKA)
        -- id usugi = 1 - przyjęcie do serwisu
        VALUES (vWorkNo, 1, pReportNo, pUserId);

        UPDATE "SERWIS"."ZAMOWIENIE_NAPRAWY"
        SET STATUS = 'w naprawie'
        WHERE ID_NAPRAWY = pReportNo;
        commit;
    ELSE
        vFlag := 0;
    END IF;

RETURN vFlag;
END;

-- result = 0 jesli nie mozna drugi raz przydzielic, 1 jesli przydzielono
select take_work(1,1) as "result" from dual;


-- wyswietlenie aktualnych napraw danego pracownika
select ID_NAPRAWY FROM PRACE_NAPRAWCZE p NATURAL JOIN ZAMOWIENIE_NAPRAWY z WHERE ID_PRACOWNIKA = 1 AND STATUS NOT LIKE 'naprawiony' GROUP BY ID_NAPRAWY;

-- wyświetlanie wszystkich wykonanych usług
select NAZWA_USLUGI, CENA FROM PRACE_NAPRAWCZE NATURAL JOIN CENNIK WHERE ID_NAPRAWY = 1;

-- wyswietlenie wymienionych czesci 
select NAZWA_KATEGORII, NAZWA_PRODUCENTA, MODEL, CENA FROM PRACE_NAPRAWCZE_CZESCI NATURAL JOIN CZESCI_ZAMIENNE NATURAL JOIN PRACE_NAPRAWCZE NATURAL JOIN KATEGORIE NATURAL JOIN PRODUCENCI WHERE ID_NAPRAWY = 1;

-- wykonaj usluge 
create or replace procedure doService( 
pServiceId NUMBER,  -- nr uslugi z cennika
pRepairId NUMBER,   -- nr pracy (ktory sprzet)
pWorkerId NUMBER    -- nr pracownika
)
IS
vWorkNo NUMBER;
BEGIN
SELECT MAX(ID_PRACY)+1 INTO vWorkNo FROM PRACE_NAPRAWCZE;
INSERT INTO PRACE_NAPRAWCZE (ID_PRACY, ID_USLUGI, ID_NAPRAWY, ID_PRACOWNIKA)
VALUES (vWorkNo, pServiceId, pRepairId, pWorkerId);
commit;
END;

-- wyszukaj dostępne części danego typu i danego producenta

--SELECT ID_CZESCI, MODEL, CENA FROM CZESCI_ZAMIENNE c LEFT JOIN MAGAZYN m ON m.id_czesci = c.ID_CZESCI WHERE c.ID_KATEGORII = 1AND c.ID_PRODUCENTA = 1
SELECT c.ID_CZESCI, MODEL, CENA FROM CZESCI_ZAMIENNE c LEFT JOIN MAGAZYN m ON m.id_czesci = c.ID_CZESCI WHERE c.ID_KATEGORII = 1 AND c.ID_PRODUCENTA = 1 AND m.LICZBA_SZTUK > 0

--zatwierdza wymiane czesci u klienta
create or replace procedure exchangePart(
pIdNaprawy NUMBER,
pIdCzesci NUMBER
)
IS
-- numer pracy napraczej gdy wymieniano czesc (100- kod wymiany czesci)
-- nie bierze pod uwagę przypadku, że wpisano usługi wymiana części i nie ma vPracyNaprawczej
vPracaNaprawcza NUMBER;
vPiecesBefore NUMBER;
vPiecesAfter NUMBER;
BEGIN
SELECT max(ID_PRACY) INTO vPracaNaprawcza FROM PRACE_NAPRAWCZE WHERE ID_NAPRAWY=pIdNaprawy AND ID_USLUGI = 100;

INSERT INTO PRACE_NAPRAWCZE_CZESCI (ID_PRACY, ID_CZESCI)
VALUES (vPracaNaprawcza, pIdCzesci);

SELECT LICZBA_SZTUK INTO vPiecesBefore FROM MAGAZYN WHERE ID_CZESCI = pIdCzesci;
vPiecesAfter := vPiecesBefore - 1;	
    
    UPDATE MAGAZYN
    SET LICZBA_SZTUK = vPiecesAfter 
    WHERE ID_CZESCI = pIdCzesci;

commit;
END;

-- zakończenie serwisowania - status naprawiony
create or replace procedure end_repair(
pWorkNo NUMBER
)
IS
vBillNo NUMBER;
vToPay NUMBER;
vToPayServices NUMBER;
vToPayParts NUMBER;
BEGIN
        SELECT max(ID_FAKTURY)+1 INTO vBillNo FROM PLATNOSCI;
        SELECT SUM(CENA) INTO vToPayParts FROM PRACE_NAPRAWCZE NATURAL JOIN CENNIK WHERE ID_NAPRAWY = pWorkNo;
        SELECT SUM(CENA) INTO vToPayServices FROM PRACE_NAPRAWCZE_CZESCI NATURAL JOIN PRACE_NAPRAWCZE NATURAL JOIN CZESCI_ZAMIENNE WHERE ID_NAPRAWY = pWorkNo;
        
        vToPay := vToPayParts + vToPayServices;
        UPDATE ZAMOWIENIE_NAPRAWY
        SET STATUS = 'naprawiony',
        DATA_ZAKONCZENIA = SYSDATE
        WHERE ID_NAPRAWY = pWorkNo;
        
        INSERT INTO PLATNOSCI(
        ID_FAKTURY, ID_NAPRAWY, DO_ZAPLATY, ZAPLACONO)
        VALUES (vBillNo, pWorkNo, vToPay, 0);
commit;
END;


SELECT * FROM CENNIK

-- wypisanie stanu magazynu
select CZESCI_ZAMIENNE.ID_CZESCI, NAZWA_KATEGORII, NAZWA_PRODUCENTA, MODEL, CENA, LICZBA_SZTUK from (CZESCI_ZAMIENNE NATURAL JOIN PRODUCENCI NATURAL JOIN KATEGORIE) LEFT JOIN MAGAZYN ON magazyn.id_czesci = CZESCI_ZAMIENNE.ID_CZESCI  



-- dodanie uslugi do cennika
create or replace procedure add_new_service (
pName VARCHAR2,
pPrice FLOAT
)
IS
vId NUMBER;
BEGIN
SELECT max(ID_USLUGI)+1 INTO vId FROM CENNIK;

       INSERT INTO CENNIK (ID_USLUGI, NAZWA_USLUGI, CENA)
       VALUES (vId, pName, pPrice);
commit;
END;


-- dodawanie nowego podzespolu do bazy

-- dodaje przedmiot
-- jesli nie ma kategorii albo producenta, tez go dodaje
create or replace procedure add_new_item (
pCategory VARCHAR2,
pProducer VARCHAR2,
pModel VARCHAR2,
pPrice NUMBER
)
IS
vId NUMBER;
vCategoryId NUMBER;
vProducerId NUMBER;
BEGIN
SELECT max(ID_CZESCI)+1 INTO vId FROM CZESCI_ZAMIENNE;
    BEGIN
        SELECT ID_KATEGORII INTO vCategoryId FROM KATEGORIE WHERE UPPER(NAZWA_KATEGORII) LIKE UPPER(pCategory); -- znajdz id kategorii
    EXCEPTION WHEN NO_DATA_FOUND THEN vCategoryId := null;
    END;
-- jesli nie ma dodaj
IF vCategoryId IS NULL THEN
    SELECT max(ID_KATEGORII)+1 INTO vCategoryId FROM KATEGORIE;
    INSERT INTO KATEGORIE(ID_KATEGORII, NAZWA_KATEGORII)
    VALUES (vCategoryId, pCategory);
END IF;
    BEGIN
        SELECT ID_PRODUCENTA INTO vProducerId FROM PRODUCENCI WHERE UPPER(NAZWA_PRODUCENTA) LIKE UPPER(pProducer); -- znajdz id producenta
    EXCEPTION WHEN NO_DATA_FOUND THEN vProducerId := null;
    END;
-- jesli nie ma dodaj 
IF vProducerId IS NULL THEN
    SELECT max(ID_PRODUCENTA)+1 INTO vProducerId FROM PRODUCENCI;
    INSERT INTO PRODUCENCI(ID_PRODUCENTA, NAZWA_PRODUCENTA)
    VALUES (vProducerId, pProducer);
END IF;      

       INSERT INTO CZESCI_ZAMIENNE (ID_CZESCI, ID_KATEGORII, ID_PRODUCENTA, MODEL, CENA)
       VALUES (vId, vCategoryId, vProducerId, pModel, pPrice);
       
       INSERT INTO MAGAZYN (ID_CZESCI, LICZBA_SZTUK)
       VALUES (vId, 0);
commit;
END;

-- dodaj czesci do magazynu
create or replace procedure add_items (
pPartId NUMBER,
pPiecesNo NUMBER
)
IS
vPiecesBefore NUMBER;
vPiecesAfter NUMBER;
BEGIN
	SELECT LICZBA_SZTUK INTO vPiecesBefore FROM MAGAZYN WHERE ID_CZESCI = pPartId;
    vPiecesAfter := vPiecesBefore + pPiecesNo;
	
	UPDATE MAGAZYN
    SET LICZBA_SZTUK = vPiecesAfter 
    WHERE ID_CZESCI = pPartId;
commit;
END;