var c, d, e,a,b,n,m,t,y:integer;
begin
  readln(n,m,t,y);
  a:=n*y;
  b:=m*t;
  e:=a;
  d:=b;
while a<>b do if a>b then a:=a-b
                     else b:=b-a;
  c:=a;
  writeln(c);
  e:=e div c;
  d:=d div c;
  writeln (e,'/',d );
end.