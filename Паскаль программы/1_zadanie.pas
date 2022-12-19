program prog_1;
procedure STROKA();
var slovar: array[1..30] of string;
    s, s0: string;
    count, k, j, i: integer;
    error: boolean;
begin
    j := 0;
    writeln('Введите предложение:');
    readln(s);
    writeln('Длину какого слова вы хотите узнать?');
    readln(K);
    s0 := '';
    count := 0;
    error := True;
    for i := 1 to Length(s) do begin
                                   if (s[i] in ['A'..'Z']) or (s[i] in ['a'..'z']) then s0 := s0 + s[i];
                                   if (i = length(s)) or not ((s[i] in ['A'..'Z']) or (s[i] in ['a'..'z'])) then begin 
                                                                                                                     if s[i - 1] <> ' ' then begin
                                                                                                                                                 j += 1;
                                                                                                                                                 slovar[j] := s0;
                                                                                                                                                 count := count + 1;
                                                                                                                                                 s0 := '';
                                                                                                                                             end;
                                                                                                                 end;
                               end;
    if count > 30 then writeln('В вашем предложении слишком много слов')
                  else begin
                           for i := 1 to count do begin
                                                      if length(slovar[i]) > 20 then error := False
        end;
        if error = True then
            writeln('Длина ', k, '-го слова = ', length(slovar[k]))
        else
            writeln('Есть слово,в котором слишком много букв');
    end;
    
end;

begin

    STROKA();

end.