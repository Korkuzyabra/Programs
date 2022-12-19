type mas=array [1..1000] of real;
     person=record
              surname:string;
              name:string;
              old:string;
              height:string;
              grade:string;
            end; 
var student:array [1..1000]of person;
    a,b,c:mas;
    d:array[1..1000]of integer;
    t,r,f:text;
    Name_file:string;
    i,n,maxi,flg:integer;
    mino,minh,ming,maxo,maxh,maxg:real;
    
procedure provFile(g:text);
label l;
var F_name:string;
begin
  repeat
    l:
    writeln('Введите имя файла в формате: Имя.txt ');
    readln(F_name);
    if FileExists(F_name) then begin
                                 Name_file:=F_name;
                                 repeat
                                   Assign(g, Name_file);
                                   reset(g);
                                   if (eof(g)) then begin 
                                                      writeln('Файл пустой! Повторите попытку '); 
                                                      goto l; 
                                                    end;
                                 until(not eof(g));  
                               end
    else writeln('Файл с таким именем не найден. Повторите попытку ');
  until Name_file=F_name; 
end;
procedure provStr (g:text; var flg:integer);
var k:Integer;
    s:string;
begin
  k:=0;
  While not Eof(g) do begin
                        ReadLn(g,s);
                        Inc(k);
                      end;
  if k mod 5<>0 then begin
                       flg:=1;
                       writeln('Неверное количество данных');
                     end;
end;
procedure chtenie(g:text; var flg:integer);
const buk=['а'..'я','А'..'Я','Ё','ё'];
      chi=['0'..'9'];
      zn=['.',','];
var k,h,err,b,l:integer;
    a:real;
begin;
  h:=0;
  flg:=0;
  i:=1;
  while not eof(g) do
    with student[i] do begin 
                         readln(g,surname);
                         if surname='' then begin
                                              writeln('Отсутствует фамилия ',i,'-ого человека');
                                              flg:=1;
                                            end
                                    else begin
                                           for k:=1 to length(surname) do if surname[k]=' ' then delete(surname,k,1);
                                           if surname[1]=' ' then delete(surname,1,1);
                                           for k:=1 to length(surname)do if surname[k] not in buk then h:=1;
                                           if h<>0 then begin 
                                                          writeln('Ошибка в фамилии ',i,'-ого человека'); 
                                                          flg:=1; 
                                                        end;
                                           h:=0;
                                         end;
                         readln(g,name);
                         if name='' then begin
                                           writeln('Отсутствует имя ',i,'-ого человека');
                                           flg:=1;
                                         end
                                    else begin
                                           for k:=1 to length(name) do if name[k]=' ' then delete(name,k,1);
                                           if name[1]=' ' then delete(name,1,1);
                                           for k:=1 to length(name)do if name[k] not in buk then h:=1;
                                           if h<>0 then begin 
                                                          writeln('Ошибка в имени ',i,'-ого человека'); 
                                                          flg:=1; 
                                                        end;
                                           h:=0;
                                         end;
                         readln(g,old);
                         if old='' then begin
                                          writeln('Отсутствует возраст ',i,'-ого человека');
                                          flg:=1; 
                                         end
                                    else begin
                                           for k:=1 to length(old) do if old[k]=' ' then delete(old,k,1);
                                           if old[1]=' ' then delete(old,1,1);
                                           for k:=1 to length(old)do if old[k] not in chi then h:=1;
                                           val(old,l,err);
                                           if not((l>=10) and (l<=20)) then h:=1;
                                           if h<>0 then begin 
                                                          writeln('Ошибка в возрасте ',i,'-ого человека'); 
                                                          flg:=1; 
                                                        end;
                                           h:=0;
                                         end;
                         readln(g,height);
                         if height='' then begin
                                             writeln('Отсутствует рост ',i,'-ого человека');
                                             flg:=1; 
                                         end
                                    else begin
                                           for k:=1 to length(height) do if height[k]=' ' then delete(height,k,1);
                                           if height[1]=' ' then delete(old,1,1);
                                           for k:=1 to length(height)do if height[k] not in chi then h:=1;
                                           val(height,b,err);
                                           if not((b>=100) and (b<=250)) then h:=1;
                                           if h<>0 then begin 
                                                          writeln('Ошибка в росте ',i,'-ого человека'); 
                                                          flg:=1; 
                                                        end;
                                           h:=0;
                                         end;
                         readln(g,grade);
                         if grade='' then begin
                                            writeln('Отсутствует оценка ',i,'-ого человека');
                                            flg:=1; 
                                         end
                                    else begin
                                           for k:=1 to length(grade) do if grade[k]=' ' then delete(grade,k,1);
                                           if grade[1]=' ' then delete(grade,1,1);
                                           for k:=1 to length(grade)do if grade[k] not in chi+zn then h:=1;
                                           val(grade,a,err);
                                           if not ((a>=0) and (a<=5)) then h:=1;
                                           if h<>0 then begin 
                                                          writeln('Ошибка в оценке ',i,'-ого человека'); 
                                                          flg:=1; 
                                                        end;
                                           h:=0;
                                         end;
                         i:=i+1;
                       end;
end;
procedure srednee(var q,w,e:mas);
var n:integer;
    srdo,srdh,srdg,sro,srh,srg:real;
begin
  srdo:=0; srdh:=0; srdg:=0;
  for n:=1 to i-1 do
    with student[n] do begin
                         srdo:=srdo+StrToInt(old);
                         srdh:=srdh+StrToInt(height);
                         srdg:=srdg+StrToFLoat(grade);
                       end;
  srdo:=srdo/(i-1);
  srdh:=srdh/(i-1);
  srdg:=srdg/(i-1);
  for n:=1 to i-1 do
    with student[n] do begin
                         sro:=abs(srdo-StrToInt(old));
                         q[n]:=sro;
                         srh:=abs(srdh-StrToInt(height));
                         w[n]:=srh;
                         srg:=abs(srdg-StrToFLoat(grade));
                         e[n]:=srg;
                       end;
end;

begin
  provFile(t);
  Assign(t, Name_file);
  reset(t);
  provStr(t,flg);
  if flg<>0 then exit;
  close(t);
  Assign(t, Name_file);
  reset(t);
  chtenie(t, flg);
  if flg<>0 then exit;
  close(t);
  srednee(a,b,c);
  maxo:=0; maxh:=0; maxg:=0;
  for n:=1 to i-1 do begin
                       if maxo<a[n] then maxo:=a[n];
                       if maxh<b[n] then maxh:=b[n];
                       if maxg<c[n] then maxg:=c[n];
                     end;
  for n:=1 to i-1 do
    with student[n] do begin
                         if a[n]=maxo then d[n]:=d[n]+1;
                         if b[n]=maxh then d[n]:=d[n]+1;
                         if c[n]=maxg then d[n]:=d[n]+1;
                       end;
  maxi:=0;
  for n:=1 to i-1 do if maxi<d[n] then maxi:=d[n];
  for n:=1 to i-1 do
    with student[n] do if d[n]=maxi then writeln('Самый уникальный в классе ', surname,' ',name);
  Assign(f,'Результат.txt');
  rewrite(f);
  for n:=1 to i-1 do
    with student[n] do if d[n]=maxi then writeln(f,'Самый уникальный в классе ', surname,' ',name);
  close(f);
  Assign(r, 'Пример2.txt');
  rewrite(r);
  for n:=1 to i-1 do
    with student[n] do if ((a[n]=maxo) or (b[n]=maxh) or (c[n]=maxg)) then begin 
                                                                             writeln(r,surname);
                                                                             writeln(r,name);
                                                                             writeln(r,old);
                                                                             writeln(r,height);
                                                                             writeln(r,grade);
                                                                           end;
  close(r);
  Assign(r, 'Пример2.txt');
  reset(r);
  chtenie(r,flg);
  close(r);
  srednee (a,b,c);
  mino:=a[1]; minh:=b[1]; ming:=c[1];
  for n:=1 to i-1 do begin
                       if mino>a[n] then mino:=a[n];
                       if minh>b[n] then minh:=b[n];
                       if ming>c[n] then ming:=c[n];
                     end;
  for n:=1 to i-1 do
    with student[n] do begin
                         if a[n]=mino then d[n]:=d[n]+1;
                         if b[n]=minh then d[n]:=d[n]+1;
                         if c[n]=ming then d[n]:=d[n]+1;
                       end;
  maxi:=0;
  for n:=1 to i-1 do if maxi<d[n] then maxi:=d[n];
  for n:=1 to i-1 do
    with student[n] do if d[n]=maxi then writeln('Самый средний среди самых уникальных в классе ', surname,' ',name);
  Assign(f,'Результат.txt');
  append(f);
  for n:=1 to i-1 do
    with student[n] do if d[n]=maxi then writeln(f,'Самый средний среди самых уникальных в классе ', surname,' ',name);
  close(f);
  writeln;
  writeln('Смотрите результаты в файле "Результат" ');
end.
                     
                   