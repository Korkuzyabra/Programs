program policarp;
var i,n, k, f, max, min, g, h, r, j: integer;
  p:array [1..9] of integer; 
begin
  read(n);
  for i:=1 to n do read(p[i]);
  max:=0;
  for i:=1 to n do if max<p[i] then begin 
                                      max:=p[i];
                                      k:=i;
                                    end;
  min:=max;
  for i:=1 to n do if min>p[i] then begin 
                                      min:=p[i];
                                      f:=i;
                                    end;
  writeln(max, ' ', k);
  writeln(min, ' ', f);
  g:=0; h:=0;
  for i:=1 to n do if p[i]=max then g:=g+1;
  for j:=n downto 1 do if p[j]=min then h:=h+1;
  r:=g+h;
  writeln(r);
end.