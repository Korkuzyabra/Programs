program idz7;
var R:integer;
    y:real;
function rec (x:real; N:integer):real;
begin
  if N=0 then rec:=0
         else rec:=sqrt(rec(x, N-1)+sqr(x));
end;
begin
  readln(y);
  readln(R);
  writeln(rec(y,R)-2);
end.