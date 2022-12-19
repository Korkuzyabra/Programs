program matric;
var i, j, m, n, maxi, maxj, mini, minj, c, v, m1, n1: integer;
    max, min, f, l: real;
    yes: boolean;
    a: array [1..20,1..20] of integer;
    k: array [1..20,1..20] of integer;
    r: array [1..20,1..20] of integer;
    q: array [1..20,1..20] of integer;
    w: array [1..20,1..20] of integer;
    e: array [1..20,1..20] of integer;
    t: array [1..20,1..20] of integer;
    y: array [1..20,1..20] of integer;
    o: array [1..20,1..20] of integer;
    x: array [1..20,1..20] of integer;
begin
  randomize;
  write ('Размерность матрицы 20*20 ');
  m:=5;
  n:=5;
  for i:=1 to m do begin
    for j:=1 to n do begin 
                      a[i, j]:=random(201)-100;
                      r[i, j]:=a[i, j];
                      k[i,j]:=a[i, j];
                      q[i, j]:=a[i, j];
                      w[i,j]:=a[i, j];
                      e[i,j]:=a[i, j];
                      t[i,j]:=a[i, j];
                      y[i,j]:=a[i, j];
                      o[i,j]:=a[i, j];
                     end; 
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (a[i,j]:5, ' ');
                     writeln;
                   end;
 //вывод максимального и минимального значения матрицы
  max:=a[1,1];
  min:=a[1,1];
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if a[i,j]>max then begin
                                          max:=a[i,j];
                                          maxi:=i;
                                          maxj:=j;
                                         end;
                      if a[i,j]<min then begin 
                                          min:=a[i,j];
                                          mini:=i;
                                          minj:=j;
                                         end;
                     end;
                   end;
  writeln('Максимальный элемент матрицы max = ', max, ' в столбце ', maxj, ' в строке ', maxi);
  writeln('Минимальный элемент матрицы min = ', min,  ' в столбце ', minj, ' в строке ', mini);
//Выделение главной диагонали и её сумма
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if i<>j then a[i,j]:=0
                              else f:=f+a[i,j]; 
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (a[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма главной диагонали матрицы равна ', f);
  f:=0;
//Выделение побочной диагонали и её сумма
  for i:=1 to m do begin
    for j:=1 to n do begin 
                      if j+i<>n+1 then k[i,j]:=0
                                  else f:=f+k[i,j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (k[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма побочной диагонали матрицы равна ', f);
  f:=0;
 //сумма элементов по контуру 
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if (i=1) or (i=n) or (j=1) or (j=n) then q[i,j]:=0
                                                          else f:=f+q[i, j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (q[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма элементов внутри контура равна ', f);
  f:=0;
//сумма элементов внутри контура 
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if not((i=1) or (i=n) or (j=1) or (j=n)) then w[i,j]:=0
                                                          else f:=f+w[i, j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (w[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма элементов по контуру равна ', f);
  f:=0;
//сумма элементов внутри песочных часов
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if not(((i+j<=n+1) and (i<=j)) or ((i+j>=n+1) and (i>=j))) then e[i,j]:=0
                                                                                 else f:=f+e[i, j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (e[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма элементов внутри песочных часов ', f);
  f:=0;
//сумма эллементв по контору песочных часов
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if not((i=j) or (i+j=n+1)) then t[i,j]:=0
                                                 else f:=f+t[i, j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (t[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма эллементов по контору песочных часов ', f);
  f:=0;
//сумма элементов внутри ромба
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if not(((i+j>=n+1-n div 2 ) and (i+j<=n+1+n div 2 ) and (i>=j-n div 2 ) and (i<=j+n div 2 ))) then y[i,j]:=0
                                                                                                                    else f:=f+y[i, j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (y[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма эллементов внутри ромба ', f);
  f:=0;
//сумма элементов по контору ромба
  for i:=1 to m do begin
    for j:=1 to n do begin
                      if not((i + j = n + 1 - n div 2) or (i = j + n div 2) or (i + j = n + 1 + m div 2) or (i = j - m div 2)) then o[i,j]:=0
                                                                                                                               else f:=f+o[i, j];
                     end;
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m do begin
    for j:=1 to n do write (o[i,j]:5, ' ');
                     writeln;
                   end;
  writeln ('Сумма эллементов по контору ромба ', f);
  f:=0;
//магический квадрат
  writeln ('Введите размерность матрицы ');
  readln (m1,n1);
  for i:=1 to m1 do begin
    for j:=1 to n1 do begin
                      readln (x[i,j]);
                     end; 
                   end;
  writeln ('Полученный массив:');
  for i:=1 to m1 do begin
    for j:=1 to n1 do begin 
                        write (x[i,j]:5, ' ');
                     end;
                     writeln;
                    end;
  if (n1=m1) then begin
                  yes:= true;
                  i:= 1;
                  repeat
                   j:=1;
                   c:= 0;   
                   v:= 0;    
                   repeat
                    c:= c+x[i,j];
                    v:= v+x[i,j];
                    inc(j)
                   until j>n1;
                   if (c<>v) or (i>1) and (c<>l) then yes:= false;
                   l:= c;     
                   inc(i);
                  until not yes or (i>n1);
                  writeln('Эта матрица магический квадрат? - ',yes);
                end
           else writeln ('Это не квадратичная матрица ');
end.