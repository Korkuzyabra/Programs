type P_Elem=^Elem;
Elem=record
      data:integer;
      next:P_Elem;
     end;
var P_begin:P_Elem;
    n,k,flag:integer;
procedure createlist(num:integer; var P1:P_Elem);
var i:integer;
    p:P_Elem;
begin
  New(P1);
  i:=1;
  P1^.data:=i;
  P1^.next:=Nil;
  p:=P1;
  while i<num do begin
                   New(p^.next);
                   p^.next^.next:=Nil;
                   p:=p^.next;
                   inc(i);
                   p^.data:=i;
                 end;
end;
procedure printlist(P1:P_Elem);
var p:P_Elem;
begin
  if P1<>Nil then begin
                    write('(',P1^.data,'){',P1,'}->');
                    p:=P1;
                    while p^.next<>Nil do begin 
                                            p:=p^.next;
                                            write('(',p^.data,'){',p,'}->');
                                          end;
                    writeln(p^.next);
                  end
             else writeln('Список пустой');
end;
procedure killlist(var P1:P_Elem);
var p:p_Elem;
begin
  if P1<>Nil then begin
                    p:=P1;
                    while p^.next<>Nil do begin
                                            p:=p^.next;
                                            dispose(P1);
                                            P1:=p;
                                          end;
                    dispose(P1);
                  end
             else writeln('Список пустой');
end;
procedure killelem(dm:integer; var P1:P_Elem);
var h,p:p_elem;
    i:integer;
begin
  if P1<>Nil then begin
                    p:=P1;
                    i:=1;
                    if dm<1 then writeln('Номер удаляемого элемнта должен быть больше либо равным 1')
                            else begin
                                   if dm=1 then begin
                                                  P1:=P1^.next;
                                                  dispose(p);
                                                end
                                           else begin 
                                                  while (i<dm) and (p^.next<>Nil) do begin
                                                                                       h:=p;
                                                                                       p:=p^.next;
                                                                                       inc(i);
                                                                                     end;
                                                  if (i<>dm) and (p^.next=Nil) then writeln('Номер удаляемого элемента больше длины списка')
                                                                               else begin
                                                                                      h^.next:=p^.next;
                                                                                      dispose(p);
                                                                                    end; 
                    
                                                end;
                                 end;
                  end
             else writeln('Список пустой');   
end;
procedure insertelem(num:integer; var P1:P_Elem);
var p_new,h,p:P_Elem;
    i:integer;
begin
  if (P1=Nil) then begin 
                     New(P1);
                     p^.data:=100;
                     p^.next:=Nil;
                   end
              else begin
                     i:=1;
                     p:=P1;
                     if (num<1) then writeln('Неверно задано место вставки')
                                else begin
                                       if (num=1) then begin
                                                         New(p_new);
                                                         p_new^.next:=P1;
                                                         p_new^.data:=200;
                                                         P1:=p_new;
                                                       end
                                                  else begin
                                                         while (i<num) and (p^.next<>Nil) do begin
                                                                                               h:=p;
                                                                                               p:=p^.next;
                                                                                               inc(i);                                                                                      
                                                                                             end;
                                                         if (i=num) then begin
                                                                           New(p_new);
                                                                           h^.next:=p_new;
                                                                           p_new^.next:=p;
                                                                           p_new^.data:=300;
                                                                         end;
                                                         if (i>num) then writeln('Место вставки превышает длину списка');
                                                       end;  
                                     end; 
                   end;
end;
begin
  writeln('======МЕНЮ=====');
  writeln('1.Создать новый список');
  writeln('2.Вставить новый элемен');
  writeln('3.Удалить элемент');
  writeln('4.Удалить весь список');
  writeln('0.Завершить работу программы');
  repeat 
    write('Какое действие? ');
    read(flag);
    case flag of
      1: begin
           write('Сколько элементов должно быть в списке? ');
           read(n);
           createlist(n,P_begin);
           printlist(P_begin);
         end;
      2: begin
           if p_begin <> Nil then begin
                                    write('На какую позицию вставить новый элемент? ');
                                    read(n);
                                    insertelem(n,P_begin);
                                    printlist(P_begin) 
                                  end
                             else writeln('Список не создан. Создайте сначала список '); 
         end;
      3: begin
           if p_begin <> Nil then begin
                                    write('С какой позиции удалить элемент? ');
                                    read(n);
                                    killelem(n,P_begin);
                                    printlist(p_begin);
                                  end
                             else writeln('Список не создан. Создайте сначала список ');
         end;
      4: begin
           if p_begin <> Nil then killlist(p_begin)
                             else writeln('Список не создан. Создайте сначала список ');
         end;
    end; 
  until flag=0;
  exit;
end.