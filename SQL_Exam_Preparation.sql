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
COMMIT;

/* Display all the records from the table */
SELECT * FROM CLIENT;
