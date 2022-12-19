program prog_1;
var str1, str2, s_:string;
procedure del (s1,s:string; var s_:string);
var i,n,j : byte;
  begin
    n := length(s);
    s_ := s;
    for j:= 1 to length(s1) do 
      for i:=1 to n do if s1[j] = s[i] then delete(s_,i,1);
  end;
begin
  writeln ('Введите строку символов не разделенные пробелами');
  readln (str1);
  While (Pos(' ',str1) <> 0) do Begin
                                  Delete(str1, Pos(' ',str1), 1);
                                End;
  writeln ('Введите вторую строку символов не разделенные пробелами');
  readln (str2);
  While (Pos(' ',str2) <> 0) do Begin
                                  Delete(str2, Pos(' ',str2), 1);
                                End;
  writeln;
  writeln('Полученная строка 1: ', str1);
  writeln('Полученная строка 2: ', str2);
  writeln;
  writeln('Полученная строка: ');
  del(str2, str1, s_);
  writeln(s_);
end.