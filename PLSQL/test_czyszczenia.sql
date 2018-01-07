--------------------------------------------------------
--  File created - niedziela-stycznia-07-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence KLIENCI_ID_KLIENTA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."KLIENCI_ID_KLIENTA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

--------------------------------------------------------
--  DDL for Sequence ZAMOWIENIE_NAPRAWY_ID_NAPRAWY_
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."ZAMOWIENIE_NAPRAWY_ID_NAPRAWY_"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CENNIK
--------------------------------------------------------

  CREATE TABLE "SERWIS"."CENNIK" 
   (	"ID_USLUGI" NUMBER(10,0), 
	"NAZWA_USLUGI" VARCHAR2(255 CHAR), 
	"CENA" FLOAT(126)
   ) 
--------------------------------------------------------
--  DDL for Table CZESCI_ZAMIENNE
--------------------------------------------------------

  CREATE TABLE "SERWIS"."CZESCI_ZAMIENNE" 
   (	"ID_CZESCI" NUMBER(10,0), 
	"ID_KATEGORII" NUMBER(10,0), 
	"ID_PRODUCENTA" NUMBER(10,0), 
	"MODEL" VARCHAR2(255 CHAR), 
	"CENA" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table KATEGORIE
--------------------------------------------------------

  CREATE TABLE "SERWIS"."KATEGORIE" 
   (	"ID_KATEGORII" NUMBER(10,0), 
	"NAZWA_KATEGORII" VARCHAR2(255 CHAR)
   )
--------------------------------------------------------
--  DDL for Table KLIENCI
--------------------------------------------------------

  CREATE TABLE "SERWIS"."KLIENCI" 
   (	"ID_KLIENTA" NUMBER(10,0), 
	"IMIE" VARCHAR2(255 CHAR), 
	"NAZWISKO" VARCHAR2(255 CHAR), 
	"ADRES" VARCHAR2(255 CHAR), 
	"KOD_POCZTOWY" VARCHAR2(255 CHAR), 
	"MIASTO" VARCHAR2(255 CHAR), 
	"WOJEWODZTWO" VARCHAR2(255 CHAR), 
	"HASLO" VARCHAR2(255 CHAR), 
	"LOGIN" VARCHAR2(255 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE)
   ) 
--------------------------------------------------------
--  DDL for Table KOMPUTERY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."KOMPUTERY" 
   (	"ID_KOMPUTERA" NUMBER(10,0), 
	"PRODUCENT" VARCHAR2(255 CHAR), 
	"ROK_PRODUKCJI" NUMBER(10,0), 
	"NR_SERYJNY" VARCHAR2(30 BYTE)
   )
--------------------------------------------------------
--  DDL for Table MAGAZYN
--------------------------------------------------------

  CREATE TABLE "SERWIS"."MAGAZYN" 
   (	"ID_CZESCI" NUMBER(10,0), 
	"LICZBA_SZTUK" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table PLATNOSCI
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PLATNOSCI" 
   (	"ID_FAKTURY" NUMBER(10,0), 
	"ID_NAPRAWY" NUMBER(10,0), 
	"DO_ZAPLATY" FLOAT(126), 
	"ZAPLACONO" FLOAT(126)
   ) 
--------------------------------------------------------
--  DDL for Table PRACE_NAPRAWCZE
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PRACE_NAPRAWCZE" 
   (	"ID_PRACY" NUMBER(10,0), 
	"ID_USLUGI" NUMBER(10,0), 
	"ID_NAPRAWY" NUMBER(10,0), 
	"ID_PRACOWNIKA" NUMBER(10,0), 
	"CENA_PRACY" FLOAT(63)
   )
--------------------------------------------------------
--  DDL for Table PRACE_NAPRAWCZE_CZESCI
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PRACE_NAPRAWCZE_CZESCI" 
   (	"ID_PRACY" NUMBER(10,0), 
	"ID_CZESCI" NUMBER(10,0), 
	"CENA_ZAKUPU" FLOAT(63)
   ) 
--------------------------------------------------------
--  DDL for Table PRACOWNICY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PRACOWNICY" 
   (	"ID_PRACOWNIKA" NUMBER(10,0), 
	"IMIE" VARCHAR2(255 CHAR), 
	"NAZWISKO" VARCHAR2(255 CHAR), 
	"ADRES" VARCHAR2(255 CHAR), 
	"KOD_POCZTOWY" VARCHAR2(255 CHAR), 
	"MIASTO" VARCHAR2(255 CHAR), 
	"WOJEWODZTWO" VARCHAR2(255 CHAR), 
	"NR_TEL" NUMBER(10,0), 
	"NR_UMOWY" NUMBER(10,0), 
	"HASLO" VARCHAR2(255 CHAR), 
	"UPRAWNIENIA_ADMIN" NUMBER(3,0), 
	"LOGIN" VARCHAR2(255 BYTE)
   )
--------------------------------------------------------
--  DDL for Table PRODUCENCI
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PRODUCENCI" 
   (	"ID_PRODUCENTA" NUMBER(10,0), 
	"NAZWA_PRODUCENTA" VARCHAR2(255 CHAR)
   ) 
--------------------------------------------------------
--  DDL for Table UMOWY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."UMOWY" 
   (	"NR_UMOWY" NUMBER(10,0), 
	"DATA_ROZPOCZECIA" DATE, 
	"DATA_ZAKONCZENIA" DATE, 
	"WYPLATA" FLOAT(126), 
	"ID_PRACOWNIKA" NUMBER(10,0)
   ) 
--------------------------------------------------------
--  DDL for Table ZAMOWIENIE_NAPRAWY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" 
   (	"ID_NAPRAWY" NUMBER(10,0), 
	"ID_KLIENTA" NUMBER(10,0), 
	"ID_KOMPUTERA" NUMBER(10,0), 
	"OPIS_USTERKI" VARCHAR2(4000 CHAR), 
	"DATA_ROZPOCZECIA" DATE, 
	"DATA_ZAKONCZENIA" DATE, 
	"STATUS" VARCHAR2(255 BYTE)
   ) 
  
	REM INSERTING into SERWIS.CENNIK
	SET DEFINE OFF;
	Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('101','usluga testowa','2');
	Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('1','Przyjecie do serwisu','15');
	Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('100','wymiana czesci','10');
	Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('11','Czyszczenie komputera','15');
	Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('12','Wlacz/ Wyl�cz komputer','5');
	Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('2','HARD RESET DYSKU','600');
	REM INSERTING into SERWIS.CZESCI_ZAMIENNE
	SET DEFINE OFF;
	Insert into SERWIS.CZESCI_ZAMIENNE (ID_CZESCI,ID_KATEGORII,ID_PRODUCENTA,MODEL,CENA) values ('3','5','10','4400','50');
	Insert into SERWIS.CZESCI_ZAMIENNE (ID_CZESCI,ID_KATEGORII,ID_PRODUCENTA,MODEL,CENA) values ('1','1','1','model','100');
	Insert into SERWIS.CZESCI_ZAMIENNE (ID_CZESCI,ID_KATEGORII,ID_PRODUCENTA,MODEL,CENA) values ('2','1','1','model2','200');
	Insert into SERWIS.CZESCI_ZAMIENNE (ID_CZESCI,ID_KATEGORII,ID_PRODUCENTA,MODEL,CENA) values ('4','5','7','4600','50');
	Insert into SERWIS.CZESCI_ZAMIENNE (ID_CZESCI,ID_KATEGORII,ID_PRODUCENTA,MODEL,CENA) values ('5','1','9','HD7850','250');
	Insert into SERWIS.CZESCI_ZAMIENNE (ID_CZESCI,ID_KATEGORII,ID_PRODUCENTA,MODEL,CENA) values ('6','6','11','TF-3239DL','50');
	REM INSERTING into SERWIS.KATEGORIE
	SET DEFINE OFF;
	Insert into SERWIS.KATEGORIE (ID_KATEGORII,NAZWA_KATEGORII) values ('5','bateria');
	Insert into SERWIS.KATEGORIE (ID_KATEGORII,NAZWA_KATEGORII) values ('1','karta graficzna');
	Insert into SERWIS.KATEGORIE (ID_KATEGORII,NAZWA_KATEGORII) values ('2','plyta glowna');
	Insert into SERWIS.KATEGORIE (ID_KATEGORII,NAZWA_KATEGORII) values ('3','procesor');
	Insert into SERWIS.KATEGORIE (ID_KATEGORII,NAZWA_KATEGORII) values ('4','RAM');
	Insert into SERWIS.KATEGORIE (ID_KATEGORII,NAZWA_KATEGORII) values ('6','karta sieciowa');
	REM INSERTING into SERWIS.KLIENCI
	SET DEFINE OFF;
	Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('41','mojeimie','mojenazwisko','mojadres','12347','krakow','ma�opolskie','$2y$10$ctQIrOVOkdt1R5FsJHVpY.Gx4qTtaz3s6EVZQTyCiLmBq7XYQz1f2','mojlogin','email@email.com');
	Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('4','Pawel','W??dolny','?????????? 445','????????????????','szcz','dddddfsfs','$2y$10$GiCeEhCcZiKAHXyv1f45BOwkVZ1nfv6I4snoSRjS9.8io/thhQ7xi','kloss','mmm@gmail.com');
	Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('3','klos','lans','asdres 23','34-100','malopolsk','Malopolskie','$2y$10$tBOp/FP27rSs2h3e2veeDurvXuEOTzIiLa6h90Ag5m7En5j3uQTv2','login2','email2@email.com');
	Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('21','aaaaa','aaaaa','aaaaa','00000','aaaaa','aaaaa','$2y$10$5.2EYgzSlJyEvH7jtn9yxe0wmrZrbaFIZFCRTjlI43V7r7sM/6Osu','aaaaa','a@a.pl');
	REM INSERTING into SERWIS.KOMPUTERY
	SET DEFINE OFF;
	Insert into SERWIS.KOMPUTERY (ID_KOMPUTERA,PRODUCENT,ROK_PRODUKCJI,NR_SERYJNY) values ('30','Dell','2014','Inspirion15');
	REM INSERTING into SERWIS.MAGAZYN
	SET DEFINE OFF;
	Insert into SERWIS.MAGAZYN (ID_CZESCI,LICZBA_SZTUK) values ('1','42');
	Insert into SERWIS.MAGAZYN (ID_CZESCI,LICZBA_SZTUK) values ('2','11');
	Insert into SERWIS.MAGAZYN (ID_CZESCI,LICZBA_SZTUK) values ('3','0');
	Insert into SERWIS.MAGAZYN (ID_CZESCI,LICZBA_SZTUK) values ('4','10');
	Insert into SERWIS.MAGAZYN (ID_CZESCI,LICZBA_SZTUK) values ('5','10');
	Insert into SERWIS.MAGAZYN (ID_CZESCI,LICZBA_SZTUK) values ('6','10');
	REM INSERTING into SERWIS.PLATNOSCI
	SET DEFINE OFF;
	Insert into SERWIS.PLATNOSCI (ID_FAKTURY,ID_NAPRAWY,DO_ZAPLATY,ZAPLACONO) values ('1','50','76','0');
	Insert into SERWIS.PLATNOSCI (ID_FAKTURY,ID_NAPRAWY,DO_ZAPLATY,ZAPLACONO) values ('2','51','77','0');
	REM INSERTING into SERWIS.PRACE_NAPRAWCZE
	SET DEFINE OFF;
	Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA,CENA_PRACY) values ('63','100','50','2','10');
	Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA,CENA_PRACY) values ('64','1','51','2','15');
	Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA,CENA_PRACY) values ('65','101','51','2','2');
	Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA,CENA_PRACY) values ('66','100','51','2','10');
	Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA,CENA_PRACY) values ('61','1','50','2','15');
	Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA,CENA_PRACY) values ('62','101','50','2','1');
	REM INSERTING into SERWIS.PRACE_NAPRAWCZE_CZESCI
	SET DEFINE OFF;
	Insert into SERWIS.PRACE_NAPRAWCZE_CZESCI (ID_PRACY,ID_CZESCI,CENA_ZAKUPU) values ('63','3','50');
	Insert into SERWIS.PRACE_NAPRAWCZE_CZESCI (ID_PRACY,ID_CZESCI,CENA_ZAKUPU) values ('66','3','50');
	REM INSERTING into SERWIS.PRACOWNICY
	SET DEFINE OFF;
	Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('1','admin','admin','admin','0000','admin','admin','0','1','admin','1','admin');
	Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('2','user','user','uuser','00000','user','user','0','2','user','0','user');
	Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('3','imie','nazwisko','adres','0','miasto','wojewodztwo','123','3','pass','0','login');
	Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('4','aa','bb','aaabb','111','gg','hh','123456','4','aaaa','1','aaaa');
	Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('5','y','y','y','11','y','y','3','5','y','0','y');
	REM INSERTING into SERWIS.PRODUCENCI
	SET DEFINE OFF;
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('10','dell');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('1','AMD');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('2','INTEL');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('3','MSI');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('4','Gigabyte');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('5','ASRock');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('6','GoodRam');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('7','Asus');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('8','Corsair');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('9','Sapphire');
	Insert into SERWIS.PRODUCENCI (ID_PRODUCENTA,NAZWA_PRODUCENTA) values ('11','TP-LINK');
	REM INSERTING into SERWIS.UMOWY
	SET DEFINE OFF;
	Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('1',to_date('18/01/04','RR/MM/DD'),to_date('18/01/11','RR/MM/DD'),'1','1');
	Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('2',to_date('18/01/04','RR/MM/DD'),to_date('18/01/11','RR/MM/DD'),'2','2');
	Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('3',to_date('18/01/05','RR/MM/DD'),to_date('18/01/10','RR/MM/DD'),'1000','3');
	Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('4',to_date('18/01/05','RR/MM/DD'),to_date('18/02/05','RR/MM/DD'),'25,5','4');
	Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('5',to_date('01/01/02','RR/MM/DD'),to_date('01/01/01','RR/MM/DD'),'3','5');
	REM INSERTING into SERWIS.ZAMOWIENIE_NAPRAWY
	SET DEFINE OFF;
	Insert into SERWIS.ZAMOWIENIE_NAPRAWY (ID_NAPRAWY,ID_KLIENTA,ID_KOMPUTERA,OPIS_USTERKI,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,STATUS) values ('50','41','30','Nie dzia�a',to_date('18/01/07','RR/MM/DD'),to_date('18/01/07','RR/MM/DD'),'naprawiony');
	Insert into SERWIS.ZAMOWIENIE_NAPRAWY (ID_NAPRAWY,ID_KLIENTA,ID_KOMPUTERA,OPIS_USTERKI,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,STATUS) values ('51','41','30','Nie dzia�aa',to_date('18/01/07','RR/MM/DD'),to_date('18/01/07','RR/MM/DD'),'naprawiony');

		----------------------------------------------------
		 -- DDL for Trigger KLIENCI_ID_KLIENTA_TRG
		------------------------------------------------

		CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."KLIENCI_ID_KLIENTA_TRG" BEFORE INSERT ON klienci
		FOR EACH ROW
		DECLARE 
		v_newVal NUMBER(12) := 0;
		v_incval NUMBER(12) := 0;
		BEGIN
		IF INSERTING AND :new.id_klienta IS NULL THEN
		SELECT  klienci_id_klienta_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
		-- If this is the first time this table have been inserted into (sequence == 1)
		IF v_newVal = 1 THEN 
		  -- get the max indentity value from the table
		  SELECT NVL(max(id_klienta),0) INTO v_newVal FROM klienci;
		  v_newVal := v_newVal + 1;
		  -- set the sequence to that value
		  LOOP
			   EXIT WHEN v_incval>=v_newVal;
			   SELECT klienci_id_klienta_SEQ.nextval INTO v_incval FROM dual;
		  END LOOP;
		END IF;
		-- used to emulate LAST_INSERT_ID()
		-- mysql_utilities.identity := v_newVal; 
		-- assign the value from the sequence to emulate the identity column
		:new.id_klienta := v_newVal;
		END IF;
		END;

		/
		ALTER TRIGGER "SERWIS"."KLIENCI_ID_KLIENTA_TRG" ENABLE;

		------------------------------------------------
		 -- DDL for Trigger ZAMOWIENIE_NAPRAWY_ID_NAPRAW_1
		------------------------------------------------

		CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."ZAMOWIENIE_NAPRAWY_ID_NAPRAW_1" BEFORE INSERT ON zamowienie_naprawy
		FOR EACH ROW
		DECLARE 
		v_newVal NUMBER(12) := 0;
		v_incval NUMBER(12) := 0;
		BEGIN
		IF INSERTING AND :new.id_naprawy IS NULL THEN
		SELECT  zamowienie_naprawy_id_naprawy_.NEXTVAL INTO v_newVal FROM DUAL;
		-- If this is the first time this table have been inserted into (sequence == 1)
		IF v_newVal = 1 THEN 
		  -- get the max indentity value from the table
		  SELECT NVL(max(id_naprawy),0) INTO v_newVal FROM zamowienie_naprawy;
		  v_newVal := v_newVal + 1;
		  -- set the sequence to that value
		  LOOP
			   EXIT WHEN v_incval>=v_newVal;
			   SELECT zamowienie_naprawy_id_naprawy_.nextval INTO v_incval FROM dual;
		  END LOOP;
		END IF;
		-- used to emulate LAST_INSERT_ID()
		-- mysql_utilities.identity := v_newVal; 
		-- assign the value from the sequence to emulate the identity column
		:new.id_naprawy := v_newVal;
		END IF;
		END;

		/
		ALTER TRIGGER "SERWIS"."ZAMOWIENIE_NAPRAWY_ID_NAPRAW_1" ENABLE;
 

----------------------------------------------------
 -- DDL for Procedure ADD_ACCOUNT
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."ADD_ACCOUNT" 
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

/
----------------------------------------------------
 -- DDL for Procedure ADD_ITEMS
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."ADD_ITEMS" (
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

/
----------------------------------------------------
 -- DDL for Procedure ADD_NEW_ITEM
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."ADD_NEW_ITEM" (
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

/
----------------------------------------------------
 -- DDL for Procedure ADD_NEW_SERVICE
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."ADD_NEW_SERVICE" (
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

/
----------------------------------------------------
 -- DDL for Procedure DELETE_ACCOUNT
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."DELETE_ACCOUNT" 
(	pAccId IN NUMBER
)
IS
BEGIN
    DELETE FROM SERWIS.PRACOWNICY WHERE ID_PRACOWNIKA = pAccId;
    DELETE FROM SERWIS.UMOWY WHERE ID_PRACOWNIKA = pAccId;
commit;
END;

/
----------------------------------------------------
 -- DDL for Procedure DISMISS_WORKER
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."DISMISS_WORKER" 
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

/
----------------------------------------------------
 -- DDL for Procedure DOSERVICE
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."DOSERVICE" ( 
pServiceId NUMBER,  -- nr uslugi z cennika
pRepairId NUMBER,   -- nr pracy (ktory sprzet)
pWorkerId NUMBER    -- nr pracownika
)
IS
vWorkNo NUMBER;
vPrice NUMBER;
BEGIN
SELECT MAX(ID_PRACY)+1 INTO vWorkNo FROM PRACE_NAPRAWCZE;
SELECT CENA INTO vPrice FROM CENNIK WHERE ID_USLUGI = pServiceId;
INSERT INTO PRACE_NAPRAWCZE (ID_PRACY, ID_USLUGI, ID_NAPRAWY, ID_PRACOWNIKA, CENA_PRACY)
VALUES (vWorkNo, pServiceId, pRepairId, pWorkerId, vPrice);
commit;
END;

/
----------------------------------------------------
 -- DDL for Procedure END_REPAIR
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."END_REPAIR" (
pWorkNo NUMBER
)
IS
vBillNo NUMBER;
vToPay NUMBER;
vToPayServices NUMBER;
vToPayParts NUMBER;
BEGIN
        SELECT max(ID_FAKTURY)+1 INTO vBillNo FROM PLATNOSCI;
        SELECT SUM(CENA_PRACY) INTO vToPayParts FROM PRACE_NAPRAWCZE WHERE ID_NAPRAWY = pWorkNo;
        SELECT SUM(CENA_ZAKUPU) INTO vToPayServices FROM PRACE_NAPRAWCZE_CZESCI NATURAL JOIN PRACE_NAPRAWCZE WHERE ID_NAPRAWY = pWorkNo;

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

/
----------------------------------------------------
 -- DDL for Procedure EXCHANGEPART
----------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SERWIS"."EXCHANGEPART" (
pIdNaprawy NUMBER,
pIdCzesci NUMBER
)
IS
-- numer pracy napraczej gdy wymieniano czesc (100- kod wymiany czesci)
-- nie bierze pod uwag� przypadku, �e wpisano us�ugi wymiana cz�ci i nie ma vPracyNaprawczej
vPracaNaprawcza NUMBER;
vPiecesBefore NUMBER;
vPiecesAfter NUMBER;
vPrice NUMBER;
BEGIN
SELECT CENA INTO vPrice FROM CZESCI_ZAMIENNE WHERE ID_CZESCI = pIdCzesci;
SELECT max(ID_PRACY) INTO vPracaNaprawcza FROM PRACE_NAPRAWCZE WHERE ID_NAPRAWY=pIdNaprawy AND ID_USLUGI = 100;

INSERT INTO PRACE_NAPRAWCZE_CZESCI (ID_PRACY, ID_CZESCI, CENA_ZAKUPU)
VALUES (vPracaNaprawcza, pIdCzesci, vPrice);

SELECT LICZBA_SZTUK INTO vPiecesBefore FROM MAGAZYN WHERE ID_CZESCI = pIdCzesci;
vPiecesAfter := vPiecesBefore - 1;	

    UPDATE MAGAZYN
    SET LICZBA_SZTUK = vPiecesAfter 
    WHERE ID_CZESCI = pIdCzesci;

commit;
END;

/
----------------------------------------------------
 -- DDL for Function TAKE_WORK
----------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SERWIS"."TAKE_WORK" 
(   pUserId NUMBER,
    pReportNo NUMBER -- nr zgloszenia wybrany przez pracownika z tabeli zamowienie_naprawy
)
RETURN NUMBER 
IS
PRAGMA AUTONOMOUS_TRANSACTION;
	vFlag NUMBER;
    vWorkNo NUMBER;
    vPrice NUMBER;
BEGIN
    SELECT max(ID_PRACY)+1 INTO vWorkNo FROM PRACE_NAPRAWCZE;
    SELECT CENA INTO vPrice FROM CENNIK WHERE ID_USLUGI = 1; -- cena przyjecia do serwisu
    SELECT CASE WHEN EXISTS (SELECT * FROM ZAMOWIENIE_NAPRAWY WHERE ID_NAPRAWY = pReportNo AND STATUS = 'nowy') THEN 1 ELSE 0 END INTO vFlag FROM dual;
    IF vFlag = 1 THEN
        INSERT INTO PRACE_NAPRAWCZE (ID_PRACY, ID_USLUGI, ID_NAPRAWY, ID_PRACOWNIKA, CENA_PRACY)
        -- id usugi = 1 - przyj�cie do serwisu
        VALUES (vWorkNo, 1, pReportNo, pUserId, vPrice);

        UPDATE "SERWIS"."ZAMOWIENIE_NAPRAWY"
        SET STATUS = 'w naprawie'
        WHERE ID_NAPRAWY = pReportNo;
        commit;
    ELSE
        vFlag := 0;
    END IF;

RETURN vFlag;
END;

-- / */
--------------------------------------------------------
--  Constraints for Table PLATNOSCI
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PLATNOSCI" MODIFY ("ID_FAKTURY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PLATNOSCI" MODIFY ("ID_NAPRAWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PLATNOSCI" ADD CONSTRAINT "PRIMARY_11" PRIMARY KEY ("ID_FAKTURY")
 
  ALTER TABLE "SERWIS"."PLATNOSCI" ADD CONSTRAINT "ID_NAPRAWY_2" UNIQUE ("ID_NAPRAWY")
 
--------------------------------------------------------
--  Constraints for Table PRACOWNICY
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("ID_PRACOWNIKA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("ADRES" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("KOD_POCZTOWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("MIASTO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("WOJEWODZTWO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("NR_TEL" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("NR_UMOWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("HASLO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" MODIFY ("UPRAWNIENIA_ADMIN" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACOWNICY" ADD CONSTRAINT "PRIMARY_5" PRIMARY KEY ("ID_PRACOWNIKA")

--------------------------------------------------------
--  Constraints for Table KOMPUTERY
--------------------------------------------------------

  ALTER TABLE "SERWIS"."KOMPUTERY" MODIFY ("ID_KOMPUTERA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KOMPUTERY" ADD CONSTRAINT "PRIMARY_10" PRIMARY KEY ("ID_KOMPUTERA")

--------------------------------------------------------
--  Constraints for Table MAGAZYN
--------------------------------------------------------

  ALTER TABLE "SERWIS"."MAGAZYN" MODIFY ("ID_CZESCI" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."MAGAZYN" MODIFY ("LICZBA_SZTUK" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."MAGAZYN" ADD CONSTRAINT "PRIMARY_4" PRIMARY KEY ("ID_CZESCI")

--------------------------------------------------------
--  Constraints for Table CENNIK
--------------------------------------------------------

  ALTER TABLE "SERWIS"."CENNIK" MODIFY ("ID_USLUGI" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CENNIK" MODIFY ("NAZWA_USLUGI" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CENNIK" MODIFY ("CENA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CENNIK" ADD CONSTRAINT "PRIMARY" PRIMARY KEY ("ID_USLUGI")

--------------------------------------------------------
--  Constraints for Table KATEGORIE
--------------------------------------------------------

  ALTER TABLE "SERWIS"."KATEGORIE" MODIFY ("ID_KATEGORII" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KATEGORIE" MODIFY ("NAZWA_KATEGORII" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KATEGORIE" ADD CONSTRAINT "PRIMARY_8" PRIMARY KEY ("ID_KATEGORII")

--------------------------------------------------------
--  Constraints for Table UMOWY
--------------------------------------------------------

  ALTER TABLE "SERWIS"."UMOWY" MODIFY ("NR_UMOWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."UMOWY" MODIFY ("DATA_ROZPOCZECIA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."UMOWY" MODIFY ("DATA_ZAKONCZENIA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."UMOWY" MODIFY ("WYPLATA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."UMOWY" MODIFY ("ID_PRACOWNIKA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."UMOWY" ADD CONSTRAINT "PRIMARY_1" PRIMARY KEY ("NR_UMOWY")

--------------------------------------------------------
--  Constraints for Table PRODUCENCI
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PRODUCENCI" MODIFY ("ID_PRODUCENTA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRODUCENCI" MODIFY ("NAZWA_PRODUCENTA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRODUCENCI" ADD CONSTRAINT "PRIMARY_3" PRIMARY KEY ("ID_PRODUCENTA")

--------------------------------------------------------
--  Constraints for Table ZAMOWIENIE_NAPRAWY
--------------------------------------------------------

  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" MODIFY ("ID_NAPRAWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" MODIFY ("ID_KLIENTA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" MODIFY ("ID_KOMPUTERA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" MODIFY ("OPIS_USTERKI" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" ADD CONSTRAINT "PRIMARY_6" PRIMARY KEY ("ID_NAPRAWY")

  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" MODIFY ("DATA_ROZPOCZECIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KLIENCI
--------------------------------------------------------

  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("ID_KLIENTA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("ADRES" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("KOD_POCZTOWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("MIASTO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("WOJEWODZTWO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("HASLO" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" ADD CONSTRAINT "PRIMARY_9" PRIMARY KEY ("ID_KLIENTA")

  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."KLIENCI" MODIFY ("EMAIL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRACE_NAPRAWCZE
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" MODIFY ("ID_PRACY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" MODIFY ("ID_USLUGI" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" MODIFY ("ID_NAPRAWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" ADD CONSTRAINT "PRIMARY_2" PRIMARY KEY ("ID_PRACY")

--------------------------------------------------------
--  Constraints for Table CZESCI_ZAMIENNE
--------------------------------------------------------

  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" MODIFY ("ID_CZESCI" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" MODIFY ("ID_KATEGORII" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" MODIFY ("ID_PRODUCENTA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" MODIFY ("MODEL" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" MODIFY ("CENA" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" ADD CONSTRAINT "PRIMARY_7" PRIMARY KEY ("ID_CZESCI")

--------------------------------------------------------
--  Ref Constraints for Table CZESCI_ZAMIENNE
--------------------------------------------------------

  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" ADD CONSTRAINT "CZESCI_ZAMIENNE_IBFK_1" FOREIGN KEY ("ID_KATEGORII")
	  REFERENCES "SERWIS"."KATEGORIE" ("ID_KATEGORII") ENABLE;
  ALTER TABLE "SERWIS"."CZESCI_ZAMIENNE" ADD CONSTRAINT "CZESCI_ZAMIENNE_IBFK_2" FOREIGN KEY ("ID_PRODUCENTA")
	  REFERENCES "SERWIS"."PRODUCENCI" ("ID_PRODUCENTA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MAGAZYN
--------------------------------------------------------

  ALTER TABLE "SERWIS"."MAGAZYN" ADD CONSTRAINT "MAGAZYN_IBFK_1" FOREIGN KEY ("ID_CZESCI")
	  REFERENCES "SERWIS"."CZESCI_ZAMIENNE" ("ID_CZESCI") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLATNOSCI
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PLATNOSCI" ADD CONSTRAINT "PLATNOSCI_IBFK_1" FOREIGN KEY ("ID_NAPRAWY")
	  REFERENCES "SERWIS"."ZAMOWIENIE_NAPRAWY" ("ID_NAPRAWY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRACE_NAPRAWCZE
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" ADD CONSTRAINT "PRACE_NAPRAWCZE_IBFK_1" FOREIGN KEY ("ID_PRACOWNIKA")
	  REFERENCES "SERWIS"."PRACOWNICY" ("ID_PRACOWNIKA") ENABLE;
  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" ADD CONSTRAINT "PRACE_NAPRAWCZE_IBFK_2" FOREIGN KEY ("ID_USLUGI")
	  REFERENCES "SERWIS"."CENNIK" ("ID_USLUGI") ENABLE;
  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE" ADD CONSTRAINT "PRACE_NAPRAWCZE_IBFK_3" FOREIGN KEY ("ID_NAPRAWY")
	  REFERENCES "SERWIS"."ZAMOWIENIE_NAPRAWY" ("ID_NAPRAWY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRACE_NAPRAWCZE_CZESCI
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE_CZESCI" ADD CONSTRAINT "FK_PRAC_NAPR" FOREIGN KEY ("ID_PRACY")
	  REFERENCES "SERWIS"."PRACE_NAPRAWCZE" ("ID_PRACY") ENABLE;
  ALTER TABLE "SERWIS"."PRACE_NAPRAWCZE_CZESCI" ADD CONSTRAINT "FK_ID_CZESCI" FOREIGN KEY ("ID_CZESCI")
	  REFERENCES "SERWIS"."CZESCI_ZAMIENNE" ("ID_CZESCI") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRACOWNICY
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PRACOWNICY" ADD CONSTRAINT "PRACOWNICY_IBFK_1" FOREIGN KEY ("NR_UMOWY")
	  REFERENCES "SERWIS"."UMOWY" ("NR_UMOWY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAMOWIENIE_NAPRAWY
--------------------------------------------------------

  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" ADD CONSTRAINT "ZAMOWIENIE_NAPRAWY_IBFK_1" FOREIGN KEY ("ID_KLIENTA")
	  REFERENCES "SERWIS"."KLIENCI" ("ID_KLIENTA") ENABLE;
  ALTER TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" ADD CONSTRAINT "ZAMOWIENIE_NAPRAWY_IBFK_2" FOREIGN KEY ("ID_KOMPUTERA")
	  REFERENCES "SERWIS"."KOMPUTERY" ("ID_KOMPUTERA") ENABLE;
