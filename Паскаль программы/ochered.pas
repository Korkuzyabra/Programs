type p_elem=^elem;
     elem=record 
      data:string;
      next:p_elem;
          end;
var p_begin:p_elem;
    flag:integer;
    i,L:integer;
procedure add1 (var p1:p_elem;var L:integer);
var name:string;
begin
  new(p1);
  p1^.next:=nil;
  p1^.data:=intTostr(L);
  writeln('человек добавлен');
end;
procedure add2 (var p1:p_elem;var L:integer);
var p,g:p_elem;
    name:string;
begin
  if p1=nil then begin 
                   add1(p1,L);
                 end
  else begin
         p:=p1;
         while p^.next<>nil do begin
                                 p:=p^.next;
                               end;
         new(p^.next);
         p^.next^.next:=nil;
         p^.next^.data:=intTostr(L);
         p:=p^.next;
         writeln('человек добавлен');
       end;
  
end;
procedure printlist(p1:p_elem);
var g:p_elem;
begin
  if p1<>nil then begin
                    while p1<>nil do begin
                                       write(p1^.data,'<--');
                                       p1:=p1^.next;
                                     end;
                    writeln('nil');
                  end
  else writeln('очередь пуста!');
end;
procedure deleteelem(var p1:p_elem);
var p:p_elem;
begin
  if p1=nil then writeln('никого в очереде нет!')
  else begin
         p:=p1;
         p1:=p^.next;
         dispose(p);
         writeln('человек ушёл');
  end;
end;
begin
  repeat
    flag:=random(1,2);
    case flag of
    1:begin 
        inc(L); 
        add2(p_begin,L);
        printlist(p_begin);
      end;
    2:begin
        deleteelem(p_begin);
        printlist(p_begin);
      end;
    end;
    inc(i);
  until i=10;
  printlist(p_begin);
end.