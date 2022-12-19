program idz7;
var y:integer;
function rec (N:integer):real;
var i: integer;
begin
  if N=1 then rec:=sqrt(2)
         else for i:=1 to n do rec:=rec(n-1)+sqrt(i+1);
end;
begin
  readln(y);
  writeln(rec(y));
end.