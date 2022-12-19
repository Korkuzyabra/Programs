program sortirovks;
const n = 10;
type mas = array [1..n] of integer;
var t:mas;
procedure vbr(a: mas);
var c, min, per, sr: integer;
begin
  sr:= 0;
  per := 0;
  for var i := 1 to (n - 1) do begin
                                 min:= i;
                                 for var j:= (i + 1) to n do
                                 begin
                                   sr:=sr+1;
                                   if a[j] < a[min] then min:= j;
                                 end;
                                 c := a[i];
                                 a[i]:= a[min];
                                 a[min] := c;
                                 per:= per+ 1;
                               end; 
    writeln;
    writeln('       Сортировка методом прямого выбора       ');
    writeln('Отсортированный массив:');
    writeln(a);
    writeln('Число перестановок: ', per);
    writeln('Число сравнений: ', sr);
end;
procedure vcluch (a:mas);
var i, j, m, l, r, x, per, sr: integer;
begin
  per:= 0;
  sr:= 0;
  writeln;
  for i := 1 to n do begin
                       x := a[i];
                       l:= 1;
                       r:= i;
                       while l < r do begin
                                        m := (l + r) div 2;
                                        sr:= sr + 1;
                                        if a[m] < x then l := m + 1
                                                      else r := m;
            
                                      end;
                       for j := i downto r + 1 do begin
                                                    a[j] := a[j - 1];
                                                    per:= per + 1;
                                                  end;
                       a[r] := x;
                     end;
  writeln;
  writeln('        Сортировка методом двойного включения        ');
  writeln('Отсортированный массив:');
  writeln(a);
  writeln('Число перестановок: ', per);
  writeln('Число сравнений: ', sr);
end;
procedure puz(a: mas);
var i, j, r, per, sr: integer;
begin
  sr := 0;
  per:= 0;
  for i := 1 to n - 1 do
      for j := 1 to n - i do begin
                               sr := sr+ 1;
                               if a[j] > a[j + 1] then begin
                                                         r := a[j];
                                                         a[j] := a[j + 1];
                                                         a[j + 1] := r;
                                                         per:= per + 1;               
                                                       end;
                             end;
  writeln;
  writeln('        Сортировка методом пузырька       ');
  writeln('Отсортированный массив:');
  writeln(a);
  writeln('Число перестановок: ', per);
  writeln('Число сравнений: ', sr);
end;
begin
  randomize;
  for var i:= 1 to n do t[i] := Random(10);
  writeln('Исходный массив:');
  writeln(t);
  vbr(t);
  vcluch(t);
  puz(t);
end.