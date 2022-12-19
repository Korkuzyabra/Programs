program kub;
  var h,s,v:real;
      a:string;
function Chislo(k: string):string;
  var er1,er2,er3,er4,er5,er6,flag,zero:boolean;
      j,kolt:integer;
      s:string;
 digits: set of '0'..'9';
begin
  digits := ['0'..'9'];
  repeat
    begin
      flag:= true;
      er1:= false;
      er2:= false;
      er3:= false;
      er4:= false;
      er5:= false;
      er6:= true;
      zero:= true;
      kolt:= 0;
      Write(k);
      readln(s);
      for j:= 1 to length(s) do if (s[j] <> '0') then zero:=false;
      for j:= 1 to length(s) do if (s[j] = '.') then kolt:=kolt + 1;
      for j:= 1 to length(s) do begin
                                  if (s[j] <> ' ') then er6:= false;
                                  if (s[1]='0') and (kolt=0) and not er4 and not er5 then begin
                                                                                            Write('Число не может начинаться с нуля ');
                                                                                            flag:=false;
                                                                                            er5:=true;
                                                                                          end;
                                  if (s[1] = '.') and (kolt = 1) and (not er4)then begin
                                                                                    Write('Нет целой части');
                                                                                    er4 := true;
                                                                                    flag := false;
                                                                                   end;                                                        
                                  if (s[j] = ' ') and (j <> 1) and not er6 and not er3 then begin
                                                                                              writeln('Введите одно число ');
                                                                                              flag := false;
                                                                                              er3:= true;
                                                                                              end;
                                  if not (s[j] in digits) and not er1 and (s[j] <> ' ') and (s[1] <> '-') and (s[j] <> '.')then begin
                                                                                                                                  writeln('Число должно состоять из цифр ');
                                                                                                                                  flag := false;
                                                                                                                                  er1 := true;
                                                                                                                                end;    
                                  if (s[1] = '-') and not er2 then begin
                                                                    writeln('Число не может быть отрицательным ');
                                                                    flag := false;
                                                                    er2 := true;
                                                                   end;
                                  if (kolt = 2) and not er5 then begin
                                                                  Write('В числе может быть только одна точка ');
                                                                  flag := false;
                                                                  er5 := true;
                                                                 end;
                                end; 
                                if not (flag) then writeln('Неверный формат числа ');
                                if er6 then writeln('Введите число. ');
         end;
       until (flag) and not er6;
  chislo:= s;
end;
begin
  write('Введите длину ребра куба ');
  h:= StrToFloat(chislo(a));
  v:=exp(3*ln(h));
  s:=4*sqr(h);
  writeln('Объём куба равен ', v);
  writeln('Площадь боковой поверхности куба ', s);
end.