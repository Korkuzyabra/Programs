type mas = array [1..100] of integer;
var d: real;
    n, l, i, sr, r, j, max, k, s, c, b: integer;
    a:mas;
begin
  read(n,l);
  for i:=1 to n do begin
                    read(a[i]);
                   end;
  sr := 0;
  for i := 1 to n - 1 do
      for j := 1 to n - i do begin
                               sr := sr+ 1;
                               if a[j] > a[j + 1] then begin
                                                         r := a[j];
                                                         a[j] := a[j + 1];
                                                         a[j + 1] := r;              
                                                       end;
                             end;
  for i:=1 to n do begin
                    write (a[i]);
  end;
  max:=0;
  k:=0;
  for i:=1 to n-1 do begin
                      k:=a[i+1]-a[i];
                      if k>max then max:=k;
                     end;
  writeln;
  s:=a[1];
  b:=(l-a[n]);
  if ((a[1]=0) and (a[n]=l)) then d:=max/2;
  if ((s<>0) and (b<>l)) then begin if (s>b) then c:=s
                                             else c:=b;
                                    if ((max/2)<c) then d:=c
                                               else d:=max/2;
                              end
                         else begin if (b>(max/2)) then d:=b
                                               else d:=max/2;
                                    if (s>(max/2)) then d:=s
                                               else d:=max/2;
                              end;                                           
  write(d);
end.                                                       
                                                                           