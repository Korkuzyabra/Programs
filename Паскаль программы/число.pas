program chislo;
  var f: text;
      a, an, p, s: real;
      k:string;
function stoka(s: string): string; 
  var
    flag,er1,er2,er3,er4,er5,er6, zero: boolean;
    i,kolt:integer;
    digits: set of '0'..'9';
begin
  digits := ['0'..'9'];
  repeat
    begin
      flag:=true;
      er1:=false;
      er2:=false;
      er3:=false;
      er4:=false;
      er5:=false;
      er6:=true;
      zero:=true;
      kolt:=0;
      for i:=1 to length(s) do if (s[i] <> '0') then zero:=false;
      for i:=1 to length(s) do if (s[i] = '.') then kolt:=kolt+1;
      for i:= 1 to length(s) do begin
                                    if (s[i] <> ' ') then er6:=false;
                                    if (s[i] = ' ') and (i <> 1) and not er6 and not er2 then begin
                                                                                                  writeln('Необходимо только одно число. ');                                              
                                                                                                  flag:= false;
                                                                                                  er2:= true;
                                                                                                end;
                                    if not (s[i] in digits) and not er1 and (s[i] <> ' ') and (s[i] <> '.') and (s[i] <> '-') then begin
                                                                                                                                     writeln('Число может состоять только из цифр. ');
                                                                                                                                     flag := false;
                                                                                                                                     er1 := true;
                                                                                                                                   end;
                                    if (s[i] = '-') and not er6 and er4 then begin
                                                                               Writeln('Минус не может стоять в середине числа.');
                                                                               flag:= false;
                                                                               er4:= true;
                                                                             end;
                                    if (s[1] = '.') and (kolt = 1) and not er3 then begin
                                                                                      Write('Отстутствует целая часть. ');
                                                                                      er3:=true;
                                                                                      flag:=false;
                                                                                    end;
                                    if (kolt = 2) and not er5 then begin
                                                                     Write('В числе может присутствовать только одна точка. ');
                                                                     flag := false;
                                                                     er5:= true;
                                                                   end;
        
                                  end; 
      if er6 then writeln('Введите число. ');
      if not flag or er6 then begin 
                                Writeln('Неверный формат. Измените файл или введите число');
                                Write('Введите число ');
                                readln(s);
                              end;
    end;       
  until flag and not er6;
  stoka:=s;
end;
begin
  assign(f,'in2.dat.txt');
  reset(f);
  read(f,k);
  close(f);
  a:=strtofloat(stoka(k));
  writeln('Дано действительное число ',a);
  an:=a*a;
  p:=an*an*a;
  s:=p*p*an*an*an*a;
  writeln('a^2 = ', an);
  writeln('a^5 = ', p);
  writeln('a^17 = ', s);
end.