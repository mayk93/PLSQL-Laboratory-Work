--exemplu procedure
/*--3. S� se creeze o procedur� stocat� f�U� parametri care afi�eaz� un mesaj 
�Programare PL/SQL�, ziua de ast�zi �n formatul DD-MONTH-YYYY �i ora curent�, 
precum �i ziua de ieri �n formatul DDMON-YYYY. */

create procedure printdate is
  azi date := SYSDate;
begin
  dbms_output.put_line(to_char(azi, "dd-month-yyyy hh:mm"));
  azi:= azi-1;
  dbms_output.put_line(to_char(azi, "dd-mon-yyyy"));
end;


begin
  printdate();
end;
  