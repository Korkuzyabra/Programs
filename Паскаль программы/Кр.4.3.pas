type P_Elem=^Elem;
Elem=record
      data:char;
      next:P_Elem;
     end;
var t:P_Elem;
    s:string;
procedure createlist(num:integer; var P1:P_Elem);
var i:integer;
    p:P_Elem;
    smb:char;
begin
  New(P1);
  i:=1;
  writeln('Введите символ');
  readln(smb);
  P1^.data:=smb;
  P1^.next:=Nil;
  p:=P1;
  while i<num do begin
                   New(p^.next);
                   p^.next^.next:=Nil;
                   p:=p^.next;
                   inc(i);
                   writeln('Введите символ');
                   readln(smb);
                   p^.data:=smb;
                 end;
end;
procedure printlist(P1:P_Elem);
var p:P_Elem;
begin
  if P1<>Nil then begin
                    write(P1^.data, '->');
                    p:=P1;
                    while p^.next<>Nil do begin 
                                            p:=p^.next;
                                            write(p^.data,'->');
                                          end;
                    writeln(p^.next);
                  end
             else writeln('Список пустой');
end;
procedure search(num:integer;P1:P_Elem);
var p:P_Elem;
    a,i:integer;
begin
  a:=1;
  i:=1;
  p:=P1^.next;
  while i<num do begin
                  if p^.data=p1^.data then a:=a+1;
                  p:=p^.next;
                  i:=i+1;
  end;
  writeln(a);
end;
begin
  createlist(5,t);
  printlist(t);
  search(5,t);
end.