program idz7;
const //Разделители слов.
      D = ['.', ',', ':', ';', '!', '?', '-', ' ', '(', ')'];
      //Максимальное количество слов в тексте.
      M = 20;
var Arr : array[1..M] of String;
    S, sWord : String;
    i, j, Pos1, Len, LenA : Integer;
    IsExch : Boolean;
begin
  repeat
    Writeln('Введите текст:');
    Readln(S);
    //Извлекаем слова и добавляем их в массив.
    Len := Length(S);
    Pos1 := 0;
    j := 0;
    for i := 1 to Len do begin
                          //Пропускаем разделители.
                          if S[i] in D then Continue;
                          //Отслеживаем начало слова.
                          if (i = 1) or (S[i - 1] in D) then Pos1 := i;
                          //Отслеживаем конец слова.
                          if (i = Len) or (S[i + 1] in D) then begin
                          //Добавляем слово в массив.
                          Inc(j);
                          Arr[j] := Copy(S, Pos1, i - Pos1 + 1);
                        end;
    end;
    LenA := j;
    //Сортируем массив слов по возрастанию - т. е. в порядке возрастания. Метод сортировки - пузырьковая сортировка.
    for i := LenA - 1 downto 1 do begin
                                    repeat
                                    IsExch := False;
                                    for j := 1 to i do begin
                                                        if Arr[j] > Arr[j + 1] then begin
                                                                                      SWord := Arr[j];
                                                                                      Arr[j] := Arr[j + 1];
                                                                                      Arr[j + 1] := sWord;
                                                                                     end;
                                                       end;
                                    until not IsExch;
                                  end;
 
    //Распечатываем результат.
    Writeln('Перечень слов в алфавитном порядке:');
    for i := 1 to LenA do begin
                            if i > 1 then Writeln(Arr[i]);
                          end;
    Writeln;
    Writeln('Повторить - Enter. Выход - любой символ + Enter.');
    Readln(S);
  until S <> '';
end.