program z1;
type mas = array[1..100] of char;
var a:mas;
    i, j, n, s:integer;
    w: boolean;
procedure scht (l:char; var e:boolean);
begin
  if l in ['a'..'z'] then e:=true
                     else e:=false;
end;
begin
  writeln('Введите длину строки ');
  readln(n);
  j:=0;
  writeln ('Введите строку ');
  for i:=1 to n do begin
                      readln (a[i]);
                      scht (a[i], w);
                      writeln (w);
                      if w=false then j:=j+1;
                    end;
  writeln ('Полученная строка: ');
  for i:=1 to n do write(a[i], ' ');
  if j=n then s:=n
         else s:=n-j;
  writeln ('В сторооке цифр: ', s);
end.