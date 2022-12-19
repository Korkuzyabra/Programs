program rectangle;
var a, b, c, d: real;
begin
  write('a = '); 
  readln(a);
  write('b = '); 
  readln(b);
  write('c = '); 
  readln(c);
  write('d = '); 
  readln(d);
  if (a>0) and (b>0) and (c>0) and (d>0) then begin
                                                if ((a<=c) and (b<=d)) or ((a<=d) and (b<=c)) then writeln('Yes')
                                                                                              else writeln('No'); 
                                              end
                                         else writeln('Введите положительное число '); 
end.