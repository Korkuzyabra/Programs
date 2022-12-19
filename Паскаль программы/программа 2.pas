program prog_2;
var i, j: integer;
    a: array[1..20,1..20], b: array[1..20] of real;
procedure sub1 (var L:mas);
begin
  randomize;
  for i:=1 to 20 do
    for j:=1 to 20 do a[i,j]:=random(100)+1;
  writeln ('Полученный массив ');
  for i:=1 to 20 do begin
                      for j:=1 to 20 do write(a[i,j], ' ');
                                        writeln;
                    end;
  
end.