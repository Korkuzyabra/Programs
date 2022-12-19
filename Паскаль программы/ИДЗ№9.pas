type
   P_Elem = ^Elem;
   Elem = record
      data:integer;
      next:P_Elem;
      prev:P_Elem;
          end;
var n, flag: integer;
    P_begin: P_Elem;
    digit: set of integer = [0, 1, 2, 3, 4, 5];
procedure createlist(num: integer; var P1: P_Elem);
var i: integer;
    p: P_Elem;
begin
  New(P1);
  i := 1;
  P1^.data := random(101);
  P1^.next := nil;
  P1^.prev := nil;
  p := P1;
  while i < num do begin
                     New(p^.next);
                     p^.next^.next := nil;
                     p^.next^.prev := p;
                     p := p^.next;
                     inc(i);
                     p^.data := random(101);
                   end;
end;
procedure printlist(P1: P_Elem);
var p: P_Elem;
begin
  if P1 <> nil then begin
                      write('nil<-->(', P1^.data, '){', P1, '}<-->');
                      p := P1;
                      while p^.next <> nil do begin
                                                p := p^.next;
                                                write('(', p^.data, '){', p, '}<-->');
                                              end;
                      writeln(p^.next);
                    end
  else writeln('Список пустой');
end;
procedure killlist(var P1: P_Elem);
var p: p_Elem;
begin
  if P1 <> nil then begin
                      p := P1;
                      while p^.next <> nil do begin
                                                p := p^.next;
                                                dispose(P1);
                                                P1 := p;
                                              end;
                      dispose(P1);
                    end;
   writeln('Список пустой');
end;
procedure killelem(dm: integer; var P1: P_Elem);
var p: p_elem;
    i: integer;
begin
  if P1 <> nil then begin
                      p := P1;
                      i := 1;
                      if dm < 1 then writeln('Номер удаляемого элемента должен быть больше либо равным 1')
                      else begin
                             if (P1^.next = nil) and (P1^.prev = nil) then dispose(P1)
                             else if dm = 1 then begin
                                                   P1^.next^.prev := nil;
                                                   P1 := P1^.next;
                                                   dispose(p);
                                                 end
                                  else begin
                                         while (i < dm) and (p^.next <> nil) do begin
                                                                                  p := p^.next;
                                                                                  inc(i);
                                                                                end;
                             if (i <> dm) and (p^.next = nil) then writeln('Номер удаляемого элемента больше длины списка')
                             else begin 
                                    if not (p^.next = nil) then begin
                                                                  p^.next^.prev := p^.prev;
                                                                  p^.prev^.next := p^.next;
                                                                end
                                    else p^.prev^.next := nil;
                                    dispose(p);
                                  end;
                                       end;
                           end;
                    end
  else writeln('Список пустой');
end;
procedure insertelem(num: integer; var P1: P_Elem);
var p_new, p, h: P_Elem;
    i: integer;
begin
  if (P1 = nil) then begin
                       New(P1);
                       P1^.data := random(101);
                       P1^.next := nil;
                       P1^.prev := nil;
                     end
  else begin
         i := 1;
         p := P1;
         if (num < 1) then writeln('Неверно задано место вставки')
         else begin
                if (num = 1) then begin
                                    New(p_new);
                                    p_new^.next := P1;
                                    p_new^.prev := nil;
                                    p_new^.data := random(101);
                                    P1^.prev := p_new;
                                    P1 := p_new;
                                  end
                else begin
                       while (i < num) and (p <> nil) do begin
                                                           h := p;
                                                           p := p^.next;
                                                           inc(i);
                                                         end;
                       if (i = num) then if (p = nil) then begin
                                                             New(p_new);
                                                             h^.next := p_new;
                                                             p_new^.data := random(101);
                                                             p_new^.prev := h;
                                                           end
                       else begin
                              New(p_new);
                              h^.next := p_new;
                              p_new^.next := p;
                              p_new^.data := random(101);
                              p_new^.prev := h;
                              p_new^.next^.prev := p;
                            end;
                       if (i < num) then writeln('Место вставки превышает длину списка');
                     end;
              end;
       end;
end;
procedure min(n:integer; var P1: P_Elem);
var i, l, S,k: integer;
    p: P_Elem;
    A:array [1..1000] of integer;
    B:array [1..1000] of integer;
begin
  l:=n;
  l:=l+1;
  for i:=1 to n do begin
                     insertelem(l, P_begin);
                     inc(l)
                   end;
  printlist(P_begin);
  p:=P1;
  for i:=1 to (n*2) do begin
                         A[i]:=p^.data;
                         p:=p^.next;
                       end;
  write('S = {');
  for i:=1 to n do begin 
                     B[i]:=A[i]+A[i+n]; 
                     write(B[i], ' '); 
                   end;
  writeln('}');
  s:=B[1];
  for i:=1 to n do if B[i]<=s then s:=B[i];
  writeln('S = min{',s, '}');
end;
begin
    writeln('======МЕНЮ======');
    writeln('1.Создать новый список');
    writeln('2.Вставить новый элемен');
    writeln('3.Удалить элемент');
    writeln('4.Удалить весь список');
    writeln('5.Найти минимум');
    writeln('0.Завершить работу программы');
    repeat
     writeln;
     writeln('Какое действие?');
     readln(flag);
     writeln;          
     if (flag in digit) then case flag of
                              1:begin
                                  writeln('Сколько элементов должно быть в списке?');
                                  repeat
                                   read(n);
                                   if n < 2 then writeln('Число должно быть больше двух.');
                                  until (n >= 2);
                                  createlist(n, P_begin);
                                  printlist(P_begin);
                                end;
                              2:begin
                                  writeln('На какую позицию вставить новый элемент?');
                                  read(n);
                                  insertelem(n, P_begin);
                                  printlist(P_begin)
                                end;
                              3:begin
                                  writeln('Под каким номером удалить элемент?');
                                  read(n);
                                  killelem(n, P_begin);
                                  printlist(P_begin)
                                end;
                              4:killlist(P_begin);
                              5:min(n,P_begin);
                              0:begin
                                  writeln;
                                  writeln('Выход...');
                                  exit;
                                end;
                             end   
     else Writeln('Ответом должно быть число [1..5].');
    until (flag = 0);
end.