--------------------------------------------------------
--  File created - pi¹tek-stycznia-05-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence KLIENCI_ID_KLIENTA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."KLIENCI_ID_KLIENTA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence KOMPUTERY_ID_KOMPUTERA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."KOMPUTERY_ID_KOMPUTERA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PLATNOSCI_ID_FAKTURY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."PLATNOSCI_ID_FAKTURY_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PRACE_NAPRAWCZE_ID_PRACY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."PRACE_NAPRAWCZE_ID_PRACY_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PRACOWNICY_ID_PRACOWNIKA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."PRACOWNICY_ID_PRACOWNIKA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ZAMOWIENIE_NAPRAWY_ID_NAPRAWY_
--------------------------------------------------------

   CREATE SEQUENCE  "SERWIS"."ZAMOWIENIE_NAPRAWY_ID_NAPRAWY_"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CENNIK
--------------------------------------------------------

  CREATE TABLE "SERWIS"."CENNIK" 
   (	"ID_USLUGI" NUMBER(10,0), 
	"NAZWA_USLUGI" VARCHAR2(255 CHAR), 
	"CENA" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CZESCI_ZAMIENNE
--------------------------------------------------------

  CREATE TABLE "SERWIS"."CZESCI_ZAMIENNE" 
   (	"ID_CZESCI" NUMBER(10,0), 
	"ID_KATEGORII" NUMBER(10,0), 
	"ID_PRODUCENTA" NUMBER(10,0), 
	"MODEL" VARCHAR2(255 CHAR), 
	"CENA" FLOAT(126)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KATEGORIE
--------------------------------------------------------

  CREATE TABLE "SERWIS"."KATEGORIE" 
   (	"ID_KATEGORII" NUMBER(10,0), 
	"NAZWA_KATEGORII" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
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
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KOMPUTERY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."KOMPUTERY" 
   (	"ID_KOMPUTERA" NUMBER(10,0), 
	"PRODUCENT" VARCHAR2(255 CHAR), 
	"ROK_PRODUKCJI" NUMBER(10,0), 
	"NR_SERYJNY" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MAGAZYN
--------------------------------------------------------

  CREATE TABLE "SERWIS"."MAGAZYN" 
   (	"ID_CZESCI" NUMBER(10,0), 
	"LICZBA_SZTUK" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLATNOSCI
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PLATNOSCI" 
   (	"ID_FAKTURY" NUMBER(10,0), 
	"ID_NAPRAWY" NUMBER(10,0), 
	"DO_ZAPLATY" FLOAT(126), 
	"ZAPLACONO" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRACE_NAPRAWCZE
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PRACE_NAPRAWCZE" 
   (	"ID_PRACY" NUMBER(10,0), 
	"ID_USLUGI" NUMBER(10,0), 
	"ID_NAPRAWY" NUMBER(10,0), 
	"ID_PRACOWNIKA" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
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
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCENCI
--------------------------------------------------------

  CREATE TABLE "SERWIS"."PRODUCENCI" 
   (	"ID_PRODUCENTA" NUMBER(10,0), 
	"NAZWA_PRODUCENTA" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UMOWY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."UMOWY" 
   (	"NR_UMOWY" NUMBER(10,0), 
	"DATA_ROZPOCZECIA" DATE, 
	"DATA_ZAKONCZENIA" DATE, 
	"WYPLATA" FLOAT(126), 
	"ID_PRACOWNIKA" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZAMOWIENIE_NAPRAWY
--------------------------------------------------------

  CREATE TABLE "SERWIS"."ZAMOWIENIE_NAPRAWY" 
   (	"ID_NAPRAWY" NUMBER(10,0), 
	"ID_KLIENTA" NUMBER(10,0), 
	"ID_KOMPUTERA" NUMBER(10,0), 
	"OPIS_USTERKI" VARCHAR2(4000 CHAR), 
	"STATUS" VARCHAR2(255 CHAR), 
	"DATA_ROZPOCZECIA" DATE, 
	"DATA_ZAKONCZENIA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SERWIS.CENNIK
SET DEFINE OFF;
Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('11','Czyszczenie komputera','15');
Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('12','Wlacz/ Wyl¹cz komputer','5');
Insert into SERWIS.CENNIK (ID_USLUGI,NAZWA_USLUGI,CENA) values ('1','HARD RESET DYSKU','600');
REM INSERTING into SERWIS.CZESCI_ZAMIENNE
SET DEFINE OFF;
REM INSERTING into SERWIS.KATEGORIE
SET DEFINE OFF;
REM INSERTING into SERWIS.KLIENCI
SET DEFINE OFF;
Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('4','Pawel','W??dolny','?????????? 445','????????????????','szcz','dddddfsfs','$2y$10$GiCeEhCcZiKAHXyv1f45BOwkVZ1nfv6I4snoSRjS9.8io/thhQ7xi','kloss','mmm@gmail.com');
Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('3','klos','lans','asdres 23','34-100','malopolsk','Malopolskie','$2y$10$tBOp/FP27rSs2h3e2veeDurvXuEOTzIiLa6h90Ag5m7En5j3uQTv2','login2','email2@email.com');
Insert into SERWIS.KLIENCI (ID_KLIENTA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,HASLO,LOGIN,EMAIL) values ('21','aaaaa','aaaaa','aaaaa','00000','aaaaa','aaaaa','$2y$10$5.2EYgzSlJyEvH7jtn9yxe0wmrZrbaFIZFCRTjlI43V7r7sM/6Osu','aaaaa','a@a.pl');
REM INSERTING into SERWIS.KOMPUTERY
SET DEFINE OFF;
Insert into SERWIS.KOMPUTERY (ID_KOMPUTERA,PRODUCENT,ROK_PRODUKCJI,NR_SERYJNY) values ('15','Dell','2015',null);
REM INSERTING into SERWIS.MAGAZYN
SET DEFINE OFF;
REM INSERTING into SERWIS.PLATNOSCI
SET DEFINE OFF;
Insert into SERWIS.PLATNOSCI (ID_FAKTURY,ID_NAPRAWY,DO_ZAPLATY,ZAPLACONO) values ('458','11',null,null);
REM INSERTING into SERWIS.PRACE_NAPRAWCZE
SET DEFINE OFF;
Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA) values ('1','11','11',null);
Insert into SERWIS.PRACE_NAPRAWCZE (ID_PRACY,ID_USLUGI,ID_NAPRAWY,ID_PRACOWNIKA) values ('3','12','11',null);
REM INSERTING into SERWIS.PRACOWNICY
SET DEFINE OFF;
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('1','admin','admin','admin','0000','admin','admin','0','1','admin','1','admin');
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('2','user','user','uuser','00000','user','user','0','2','user','0','user');
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('3','imie','nazwisko','adres','0','miasto','wojewodztwo','123','3','pass','0','login');
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('4','test1','test1','test1','0','test1','test1','1111111','4','test1','1','test1');
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('5','test3','test3','test3','0','test3','test3','1111111','5','test1','1','test1');
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('6','test5','test5','test5','55555','test5','test5','55555','6','test5','1','test5');
Insert into SERWIS.PRACOWNICY (ID_PRACOWNIKA,IMIE,NAZWISKO,ADRES,KOD_POCZTOWY,MIASTO,WOJEWODZTWO,NR_TEL,NR_UMOWY,HASLO,UPRAWNIENIA_ADMIN,LOGIN) values ('7','test6','test6','test6','66666','test6','test6','66666','7','test6','1','test6');
REM INSERTING into SERWIS.PRODUCENCI
SET DEFINE OFF;
REM INSERTING into SERWIS.UMOWY
SET DEFINE OFF;
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('1',to_date('18/01/04','RR/MM/DD'),to_date('18/01/11','RR/MM/DD'),'1','1');
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('2',to_date('18/01/04','RR/MM/DD'),to_date('18/01/11','RR/MM/DD'),'2','2');
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('3',to_date('18/01/05','RR/MM/DD'),to_date('18/01/10','RR/MM/DD'),'1000','3');
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('4',to_date('18/01/05','RR/MM/DD'),to_date('18/02/05','RR/MM/DD'),'1111','4');
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('5',to_date('18/01/05','RR/MM/DD'),to_date('18/02/05','RR/MM/DD'),'1111','5');
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('6',to_date('18/01/01','RR/MM/DD'),to_date('19/01/01','RR/MM/DD'),'55555','6');
Insert into SERWIS.UMOWY (NR_UMOWY,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,WYPLATA,ID_PRACOWNIKA) values ('7',to_date('18/01/01','RR/MM/DD'),to_date('19/01/01','RR/MM/DD'),'66666','7');
REM INSERTING into SERWIS.ZAMOWIENIE_NAPRAWY
SET DEFINE OFF;
Insert into SERWIS.ZAMOWIENIE_NAPRAWY (ID_NAPRAWY,ID_KLIENTA,ID_KOMPUTERA,OPIS_USTERKI,STATUS,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA) values ('11','3','15','Zepsól siê','nowy',to_date('18/01/04','RR/MM/DD'),null);
Insert into SERWIS.ZAMOWIENIE_NAPRAWY (ID_NAPRAWY,ID_KLIENTA,ID_KOMPUTERA,OPIS_USTERKI,STATUS,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA) values ('1','3','15','Znowu siê zepsól','nowy',to_date('18/01/01','RR/MM/DD'),null);
--------------------------------------------------------
--  DDL for Index PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY" ON "SERWIS"."CENNIK" ("ID_USLUGI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_10
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_10" ON "SERWIS"."KOMPUTERY" ("ID_KOMPUTERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_5
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_5" ON "SERWIS"."PRACOWNICY" ("ID_PRACOWNIKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_9
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_9" ON "SERWIS"."KLIENCI" ("ID_KLIENTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_USLUGI
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_USLUGI" ON "SERWIS"."PRACE_NAPRAWCZE" ("ID_USLUGI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_PRODUCENTA
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_PRODUCENTA" ON "SERWIS"."CZESCI_ZAMIENNE" ("ID_PRODUCENTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_11
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_11" ON "SERWIS"."PLATNOSCI" ("ID_FAKTURY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_NAPRAWY
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_NAPRAWY" ON "SERWIS"."PRACE_NAPRAWCZE" ("ID_NAPRAWY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_1" ON "SERWIS"."UMOWY" ("NR_UMOWY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_6
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_6" ON "SERWIS"."ZAMOWIENIE_NAPRAWY" ("ID_NAPRAWY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_8
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_8" ON "SERWIS"."KATEGORIE" ("ID_KATEGORII") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index NR_UMOWY_2_1
--------------------------------------------------------

  CREATE INDEX "SERWIS"."NR_UMOWY_2_1" ON "SERWIS"."PRACOWNICY" ("NR_UMOWY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_KOMPUTERA
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_KOMPUTERA" ON "SERWIS"."ZAMOWIENIE_NAPRAWY" ("ID_KOMPUTERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_3" ON "SERWIS"."PRODUCENCI" ("ID_PRODUCENTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_KATEGORII
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_KATEGORII" ON "SERWIS"."CZESCI_ZAMIENNE" ("ID_KATEGORII") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_4
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_4" ON "SERWIS"."MAGAZYN" ("ID_CZESCI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_PRACOWNIKA
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_PRACOWNIKA" ON "SERWIS"."UMOWY" ("ID_PRACOWNIKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_KLIENTA
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_KLIENTA" ON "SERWIS"."ZAMOWIENIE_NAPRAWY" ("ID_KLIENTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_PRACOWNIKA_1
--------------------------------------------------------

  CREATE INDEX "SERWIS"."ID_PRACOWNIKA_1" ON "SERWIS"."PRACE_NAPRAWCZE" ("ID_PRACOWNIKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ID_NAPRAWY_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."ID_NAPRAWY_2" ON "SERWIS"."PLATNOSCI" ("ID_NAPRAWY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_2" ON "SERWIS"."PRACE_NAPRAWCZE" ("ID_PRACY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_7
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERWIS"."PRIMARY_7" ON "SERWIS"."CZESCI_ZAMIENNE" ("ID_CZESCI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger KLIENCI_ID_KLIENTA_TRG
--------------------------------------------------------

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
      --get the max indentity value from the table
      SELECT NVL(max(id_klienta),0) INTO v_newVal FROM klienci;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT klienci_id_klienta_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id_klienta := v_newVal;
  END IF;
END;

/
ALTER TRIGGER "SERWIS"."KLIENCI_ID_KLIENTA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KOMPUTERY_ID_KOMPUTERA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."KOMPUTERY_ID_KOMPUTERA_TRG" BEFORE INSERT ON komputery
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id_komputera IS NULL THEN
    SELECT  komputery_id_komputera_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id_komputera),0) INTO v_newVal FROM komputery;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT komputery_id_komputera_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id_komputera := v_newVal;
  END IF;
END;

/
ALTER TRIGGER "SERWIS"."KOMPUTERY_ID_KOMPUTERA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLATNOSCI_ID_FAKTURY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."PLATNOSCI_ID_FAKTURY_TRG" BEFORE INSERT ON platnosci
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id_faktury IS NULL THEN
    SELECT  platnosci_id_faktury_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id_faktury),0) INTO v_newVal FROM platnosci;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT platnosci_id_faktury_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id_faktury := v_newVal;
  END IF;
END;

/
ALTER TRIGGER "SERWIS"."PLATNOSCI_ID_FAKTURY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRACE_NAPRAWCZE_ID_PRACY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."PRACE_NAPRAWCZE_ID_PRACY_TRG" BEFORE INSERT ON prace_naprawcze
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id_pracy IS NULL THEN
    SELECT  prace_naprawcze_id_pracy_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id_pracy),0) INTO v_newVal FROM prace_naprawcze;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT prace_naprawcze_id_pracy_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id_pracy := v_newVal;
  END IF;
END;

/
ALTER TRIGGER "SERWIS"."PRACE_NAPRAWCZE_ID_PRACY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRACOWNICY_ID_PRACOWNIKA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."PRACOWNICY_ID_PRACOWNIKA_TRG" BEFORE INSERT ON pracownicy
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id_pracownika IS NULL THEN
    SELECT  pracownicy_id_pracownika_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id_pracownika),0) INTO v_newVal FROM pracownicy;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT pracownicy_id_pracownika_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id_pracownika := v_newVal;
  END IF;
END;

/
ALTER TRIGGER "SERWIS"."PRACOWNICY_ID_PRACOWNIKA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ZAMOWIENIE_NAPRAWY_ID_NAPRAW_1
--------------------------------------------------------

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
      --get the max indentity value from the table
      SELECT NVL(max(id_naprawy),0) INTO v_newVal FROM zamowienie_naprawy;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT zamowienie_naprawy_id_naprawy_.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id_naprawy := v_newVal;
  END IF;
END;

/
ALTER TRIGGER "SERWIS"."ZAMOWIENIE_NAPRAWY_ID_NAPRAW_1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ZAMOWIENIE_NAPRAWY_STATUS_ETRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SERWIS"."ZAMOWIENIE_NAPRAWY_STATUS_ETRG" 
BEFORE INSERT OR UPDATE ON zamowienie_naprawy
FOR EACH ROW
DECLARE
  v_val zamowienie_naprawy.status%TYPE;
  v_test zamowienie_naprawy.status%TYPE;
BEGIN
  v_val := 'nowy';
  v_test := TRIM(:new.status);
  if v_test = '1' OR v_test = 'nowy' THEN 
  v_val := 'nowy';
  elsif v_test = '2' OR v_test = 'przyjeto' THEN 
  v_val := 'przyjeto';
  elsif v_test = '3' OR v_test = 'w naprawie' THEN 
  v_val := 'w naprawie';
  elsif v_test = '4' OR v_test = 'naprawiony' THEN 
  v_val := 'naprawiony';
  end if;  :new.status := v_val;
END;

/
ALTER TRIGGER "SERWIS"."ZAMOWIENIE_NAPRAWY_STATUS_ETRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_ACCOUNT
--------------------------------------------------------
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
--------------------------------------------------------
--  Constraints for Table PLATNOSCI
--------------------------------------------------------

  ALTER TABLE "SERWIS"."PLATNOSCI" MODIFY ("ID_FAKTURY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PLATNOSCI" MODIFY ("ID_NAPRAWY" NOT NULL ENABLE);
  ALTER TABLE "SERWIS"."PLATNOSCI" ADD CONSTRAINT "PRIMARY_11" PRIMARY KEY ("ID_FAKTURY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SERWIS"."PLATNOSCI" ADD CONSTRAINT "ID_NAPRAWY_2" UNIQUE ("ID_NAPRAWY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
