Program z1;
var s: string;
procedure szh(var s: string);
var s1, s2: string;
    i, j: integer;
begin
  s1:='';
  i:=1;
  while i<Length(s) do begin
                        j:=0;
                        while ((j+i)<Length(s))and(s[i]=s[j+i]) do inc(j);
                        if j>1 then begin
                                      Str(j,s2);
                                      s1:=s1+s[i]+'('+s2+')';
                                      inc(i,j-1);
                                    end 
                               else s1:=s1+s[i];
  inc(i);
                       end;
  if s[length(s)] <> s[length(s) - 1] then s1:= s1 + s[length(s)];
  s:=s1;
end;
begin
  write('Введите строку: ');
  read(s);
  szh(s);
  write('Сжатая строка: ', s);
end.