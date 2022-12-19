Program Schitalka;
Type Children = ^Child;
     Child = record
               Name : string;
               Next : Children;
             end;
Var Circle, p, Temp : Children;
    k, i, j, NumName : integer;
    text : string;
Function NumSlov(Var S : string) : integer;
Var i, d, len: integer;
Begin
  d := 0;
  len:=length(S);
  for i:=1 to len do if s[i]=' ' then d:=d+1;
  if len>0 then d:=d+1;              
  NumSlov := d;
End;
Procedure AddName(Var Old, Young : Children);
Begin
  Young^.Next := Old^.Next;
  Old^.Next := Young;
End;
Begin
  new(Circle);
  Circle^.Next := Circle;
  writeln('Считалка');
  writeln('Введите текст считалки ');
  readln(text);
  k := Numslov(text);
  writeln('Сколько человек в кругу?');
  readln(NumName);
  temp := Circle;
  for i:= 1 to NumName do begin
                            write('Введите ',i,'-е имя:');
                            if i = 1 then readln(Circle^.name)
                            else begin
                                   new(p);
                                   readln(p^.name);
                                   AddName(temp, p);
                                   temp:=p;
                                 end;
                          end;
  temp := Circle;
  for i := 1 to NumName-1 do begin
                               for j := 1 to k-1 do begin
                                                      p := temp;
                                                      temp := temp^.next;
                                                    end;
                               writeln(temp^.name, '- вышел');
                               p^.next:= temp^.Next;
                               dispose (temp);
                               temp:=p^.Next;
                             end;
  writeln(temp^.name, '- остался');
  dispose (temp);
end.