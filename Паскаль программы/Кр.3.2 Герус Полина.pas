program prog_2;
type mas=array[1..10,1..10] of integer;
var a:mas;
    i,j,m,n,e,g:integer;
procedure opr (l:mas; var e:integer);
var cht,i, j: integer;
  begin
    cht:=0;
    for i:=1 to n do
      for j:=1 to m do if l[i,j] mod 2 = 0 then cht:=cht+1;
   e:=cht;
  end;
begin
  randomize;
  repeat
    writeln('Введите размерность массива NxM, где N>=1, M<=10 ');
    readln (n,m);  
  until (((n>1) or (n=1)) and ((n<10) or (n=10))) and ((m<10) or (m=10)and (((n<10) or (n=10)))); 
  for i:=1 to n do
    for j:=1 to m do a[i,j]:=random (99)+1;
  writeln ('Полученный массив: ');
  for i:=1 to n do begin
    for j:=1 to m do write(a[i,j], ' ');
                     writeln;
                   end;
  opr(a,e);
  g:=(m*n)-e;
  writeln('Количество четных элементов: ', e);
  writeln('Количество нечетных элементов: ', g);
end.