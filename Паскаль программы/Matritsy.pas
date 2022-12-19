program Matritc;

uses crt;

const
  razmer = 11;
  a = razmer;
  b = razmer;
  maxrange = 100;

var
  Matrix, Matrix1: array[1..a, 1..b] of integer;//Для работы с одним и тем же массивом, чтобы не потерять данные, вводим второй, которому и будем впоследствии присваивать значения первого
  i, j, maxi, mini, maxj, minj: integer;
  max, min, sum: integer;
  answer: string;

//Функция для считывания значений в массив целых чисел вручную
function Vvods(i, j: integer): string;
var
  flag, errorb, errors, errorp, zero, errorm: boolean;
  digits: set of '0'..'9';
  i1: integer;
  s: string;
begin
  digits := ['0'..'9'];
  repeat
    begin
      flag := true;//проверка формата ответа
      errorb := false;
      errors := false;
      errorm := false;
      errorp := true;
      zero := true;
      Write('Введите значение элемента, находящегося на позиции ', i, ' и ', j, ': ');
      Readln(s);
      for i1 := 1 to length(s) do if (s[i1] <> '0') then zero := false;//Проверка на равенство нулю           
      for i1 := 1 to length(s) do
      begin //Ошибки ввода вручную и вывод сообщений с указанием причины
            //если не ввели число
        if (s[i1] <> ' ') and (s[i1] <> '-') and errorp
               then 
          errorp := false;
            //если пробел внутри числа  
        if (s[i1] = ' ') and (not errorp) and (not errors)
               then
        begin
          writeln('Необходимо только одно число. Каждое число вводится на отдельной строке. ');
          flag := false;
          errors := true;
        end;
             //если введён символ отличный от цифр
        if not (s[i1] in digits) and (not errorb) and (s[i1] <> ' ') and (s[i1] <> '-')
               then 
        begin
          writeln('Число может состоять только из цифр. ');
          flag := false;
          errorb := true;
        end;
          //Если минус в середине числа
        if (s[i1] = '-') and not errorm and not errorp
          then
        begin
          Writeln('Минус не может стоять в середине числа.');
          flag := false;
          errorm := true;
        end;
        
      end; 
      if errorp then writeln('Отсутствует число. Введите число. ');
      if not (flag) or errorp then
        Writeln('Неверный формат ответа. Повторите ввод ответа.');
      
    end;       
  until (flag) and not errorp;
  Vvods := s;
end;

begin
  
  repeat
    Writeln('Как хотите вводить массив: ');
    Writeln('1. Автоматически;');
    writeln('2. Вручную.');
    readln(answer);
    if (answer <> '1') and (answer <> '2')
      then 
      Writeln('Неверный формат ответа. Введите число 1 или 2.');
  until (answer = '1') or (answer = '2');
  
  (*Автоматический ввод массива и попутное нахождение минимального и максимального элемента. 
  Так как у нас имеется ограничение, то этим значениям можно задать значения, уходящие за это ограничение*)
  min := maxrange + 1;
  max := -maxrange - 1;
  if answer = '1' then
    for i := 1 to a do
      for j := 1 to b do
      begin
        Matrix[i, j] := random(2 * maxrange + 1) - maxrange;
        if Matrix[i, j] < min
        then 
        begin
          mini := i;
          minj := j;
          min := Matrix[i, j];
        end;
        if Matrix[i, j] > max
        then 
        begin
          maxi := i;
          maxj := j;
          max := Matrix[i, j];
        end;
      end
  
  (*Ручной ввод массива. Здесь значение элемента не имеет ограничений, поэтому максимальному 
  и минимальному элементу присваиваем значение первого элемента внутри цикла для экономии времени*)
  else
    for i := 1 to a do
      for j := 1 to b do
      begin
        Matrix[i, j] := StrToInt(Vvods(i, j));
        if (i = 1) and (j = 1) then
        begin
          mini := i;
          minj := j;
          min := Matrix[i, j];
          maxi := i;
          maxj := j;
          max := Matrix[i, j];
        end;
        if Matrix[i, j] < min
        then 
        begin
          mini := i;
          minj := j;
          min := Matrix[i, j];
        end;
        if Matrix[i, j] > max
        then 
        begin
          maxi := i;
          maxj := j;
          max := Matrix[i, j];
        end;
      end;
  Writeln('Массив:');
  for i := 1 to a do
    for j := 1 to b do
      if j = b then writeln(Matrix[i, j]:5) else
        Write(Matrix[i, j]:5);
  Writeln('Максимальный элемент массива: ', max, '[', maxi, ',', maxj, ']');
  Writeln('Минимальный элемент массива: ', min, '[', mini, ',', minj, ']');
  
  
  //Замена ненужных элементов на нули и одновременный ввывод массива с суммой нужных элементов
  
  //Вывод суммы элементов по контуру ромба
  matrix1 := matrix;
  sum := 0;
  Writeln('Контур ромба.');
  for i := 1 to a do
    for j := 1 to b do
    begin
      if (i + j = razmer + 1 - razmer div 2) or
         (i = j + razmer div 2) or
         (i + j = razmer + 1 + razmer div 2) or
         (i = j - razmer div 2)
        then
        sum := sum + Matrix1[i, j]
      else Matrix1[i, j] := 0;
      if j = b then writeln(Matrix1[i, j]:5) else
        Write(Matrix1[i, j]:5);
    end;
  Writeln('Сумма данных элементов равна: ', sum);
  writeln('');
  
    //Вывод суммы элементов по площади ромба
  matrix1 := matrix;
  sum := 0;
  Writeln('Фигура ромб.');
  for i := 1 to a do
    for j := 1 to b do
    begin
      if (i + j >= razmer + 1 - razmer div 2) and
         (i <= j + razmer div 2) and
         (i + j <= razmer + 1 + razmer div 2) and
         (i >= j - razmer div 2)
        then
        sum := sum + Matrix1[i, j]
      else Matrix1[i, j] := 0;
      if j = b then writeln(Matrix1[i, j]:5) else
        Write(Matrix1[i, j]:5);
    end;
  Writeln('Сумма данных чисел равна: ', sum);
  writeln('');
  
   //Вывод контура песочных часов
  matrix1 := matrix;
  sum := 0;
  Writeln('Контур песочных часов.');
  for i := 1 to a do
    for j := 1 to b do
    begin
      if (i = 1) or 
         (i = razmer) or
         (i = j) or
         (i + j = razmer + 1)
        then
        sum := sum + Matrix1[i, j]
      else Matrix1[i, j] := 0;
      if j = b then writeln(Matrix1[i, j]:5) else
        Write(Matrix1[i, j]:5);
    end;
  Writeln('Сумма данных чисел равна: ', sum); 
  writeln('');
  
   //Вывод контура песочных часов
  matrix1 := matrix;
  sum := 0;
  Writeln('Фигура песочных часов.');
  for i := 1 to a do
    for j := 1 to b do
    begin
      if ((i >= 1)  and (i <= j) and (i + j <= razmer + 1)) or
         ((i >= j) and (i <= razmer) and (i + j >= razmer + 1))
        then
        sum := sum + Matrix1[i, j]
      else Matrix1[i, j] := 0;
      if j = b then writeln(Matrix1[i, j]:5) else
        Write(Matrix1[i, j]:5);
    end;
  Writeln('Сумма данных чисел равна: ', sum);
end.