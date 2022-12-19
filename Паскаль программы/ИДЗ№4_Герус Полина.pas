program beskonech_summ;
var n:integer;
    e, x, sum, y:real;
begin
  write ('Введите заданную точность, где 0<e<<1, e = ');
  read (e);
  write('Введите число, большее 1, x = ');
  read (x);
  if x < 0.5 then writeln('Введите число х, большее 1 ')
             else if (e<0) or (e>1) then writeln('Введите число е, в промежутке 0<e<<1 ')
                                    else begin
                                          sum:=0;
                                          y:=1;
                                          n:=1;
                                        while abs(y)>=e do begin
                                          y:=(y*(x-1)*(n+1))/((n+2)*x);
                                          sum:=sum + y;
                                          n:=n+1;
                                        end;
                                        write('Приблеженное значение бесконечной суммы равно ', sum);
                                       end;      
end.
  