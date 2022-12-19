program vse_chisla;
var n1,m1, m, n:integer;
begin
  for m:=10 to 99 do
    for n:=10 to 99 do begin
                         n1:=10*(n mod 10)+n div 10;
                         m1:=10*(m mod 10)+m div 10;
                         if n*m=n1*m1 then writeln(m,'*',n,'=',m1,'*',n1); 
                       end;
  readln
end.