/*
CREATE OR REPLACE TYPE numeClientiVector IS VARRAY(500) of varchar2(500);

create or replace function getNames0Ex1 ( codNotarParam notar.cod%Type ) return varchar2 is
declare
numeClient varchar2(50);
begin
    select nume into numeClient
    from notar join serviciu using on( notar.cod = serviciu.cod_notar ) join baneficiaza on ( serviciu.cod = baneficiaza.cod_serviciu ) join client on ( client.cod = baneficiaza.cod_client )
    where notar.cod = codNotarParam;
    return numeClient;
end;

create or replace function getNames1Ex1 ( codNotarParam notar.cod%Type ) return varchar2 is
declare prenumeClient varchar2(50);
begin
    select prenume into prenumeClient
    from notar join serviciu using on( notar.cod = serviciu.cod_notar ) join baneficiaza on ( serviciu.cod = baneficiaza.cod_serviciu ) join client on ( client.cod = baneficiaza.cod_client )
    where notar.cod = codNotarParam;
    return prenumeClient;
end;

create or replace procedure ex1 ( codNotarParam notar.cod%Type ) is
declare
CREATE OR REPLACE TYPE coduriClienti IS VARRAY(500) ofclient.cod%Type;
codClienti coduriClienti;
begin
select client.cod bulk collect into codClienti
from notar join serviciu using on( notar.cod = serviciu.cod_notar ) join baneficiaza on ( serviciu.cod = baneficiaza.cod_serviciu ) join client on ( client.cod = baneficiaza.cod_client )
where notar.cod = codNotarParam
end;
*/

BEGIN TRANSACTION;

/* Create a table called NAMES */
CREATE TABLE CLIENT(cod integer PRIMARY KEY, nume text, prenume text, data_nastere date);
CREATE TABLE SERVICIU(cod integer PRIMARY KEY, denumire text, tip integer, valoare integer, cod_notar);
CREATE TABLE NOTAR(cod integer PRIMARY KEY, nume text, prenume text, salariu integer, data_angajare date, procent_comision integer, oras text);
CREATE TABLE BENEFICIAZA(cod_client integer, cod_serviciu integer, data date, procent_reducere integer, PRIMARY KEY(cod_client,cod_serviciu,data));

/* Create few records in this table */
INSERT INTO CLIENT VALUES(0,'Tonny' , 'Default0', '11-Nov-1999');
INSERT INTO CLIENT VALUES(1,'Tom' , 'Default1' , '11-Nov-1998' );
INSERT INTO CLIENT VALUES(2,'Lucy' , 'Default2' , '14-Nov-1999' );
INSERT INTO CLIENT VALUES(3,'Frank' , 'Default3' , '11-Oct-1999' );
INSERT INTO CLIENT VALUES(4,'Jane' , 'Default4' , '11-Nov-1999' );
INSERT INTO CLIENT VALUES(5,'Robert' , 'Default5' , '14-Nov-1994' );

INSERT INTO SERVICIU VALUES( 6 , 'Serviciu 0' , 0 , 100 , 13 );
INSERT INTO SERVICIU VALUES( 7 , 'Serviciu 1' , 0 , 100 , 13 );
INSERT INTO SERVICIU VALUES( 8 , 'Serviciu 2' , 1 , 150 , 14 );
INSERT INTO SERVICIU VALUES( 9 , 'Serviciu 1' , 0 , 200 , 15 );
INSERT INTO SERVICIU VALUES( 10 , 'Serviciu 1' , 0 , 100 , 16 );
INSERT INTO SERVICIU VALUES( 11 , 'Serviciu 3' , 0 , 300 , 16 );
INSERT INTO SERVICIU VALUES( 12 , 'Serviciu 4' , 1 , 350 , 17 );

INSERT INTO NOTAR VALUES( 13 , 'Notar 0' , 'P 0 ' , 1000 , '17-Dec-1979' , 0, 'Bucuresti' );
INSERT INTO NOTAR VALUES( 14 , 'Notar 1' , 'P 1 ' , 1500 , '12-Dec-1989' , 1, 'Bucuresti' );
INSERT INTO NOTAR VALUES( 15 , 'Notar 2' , 'P 2 ' , 1700 , '17-Dec-1979' , 0, 'Constanta' );
INSERT INTO NOTAR VALUES( 16 , 'Notar 3' , 'P 3 ' , 1300 , '11-Dec-2000' , 4, 'Iasi' );
INSERT INTO NOTAR VALUES( 17 , 'Notar 4' , 'P 4 ' , 2300 , '17-Dec-2004' , 7, 'Bacau' );

INSERT INTO BENEFICIAZA VALUES( 0, 6, '13-Nov-2014' , 0 );
INSERT INTO BENEFICIAZA VALUES( 0, 6, '17-Nov-2014' , 1 );
INSERT INTO BENEFICIAZA VALUES( 0, 7, '20-Nov-2014' , 0 );
INSERT INTO BENEFICIAZA VALUES( 1, 6, '13-Oct-2014' , 0 );
INSERT INTO BENEFICIAZA VALUES( 2, 8, '12-Nov-2014' , 0 );
INSERT INTO BENEFICIAZA VALUES( 3, 9, '15-Nov-2014' , 1 );
INSERT INTO BENEFICIAZA VALUES( 4, 10, '09-Oct-2014' , 0 );
INSERT INTO BENEFICIAZA VALUES( 4, 11, '08-Nov-2014' , 0 );
INSERT INTO BENEFICIAZA VALUES( 5, 12, '07-Dec-2014' , 1 );
INSERT INTO BENEFICIAZA VALUES( 5, 7, '13-Nov-2014' , 1 );

COMMIT;

/* Display all the records from the table */
SELECT * FROM CLIENT;
SELECT * FROM SERVICIU;
SELECT * FROM NOTAR;
SELECT * FROM BENEFICIAZA;
