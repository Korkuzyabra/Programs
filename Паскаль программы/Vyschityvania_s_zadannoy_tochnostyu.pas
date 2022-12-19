program tochnost;

uses crt;

var
  e1, e, y1, y, eps, shag, x, ln, ln1: real;
  i: integer;
  phrase: string;

//Функция для считывания положительного вещественного числа от 0 до 1  
function Vvod(p: string): string;
var
  flag, errorb, errorn, errors, errorp, zero, errorschet: boolean;
  i, i1, schett(*кол-во точек*): shortInt;
  s: string;
  digits: set of '0'..'9';
begin
  digits := ['0'..'9'];
  repeat
    repeat
      begin
        flag := true;//проверка формата ответа
        errorb := false;
        errorn := false;
        errors := false;
        errorschet := false;
        errorp := true;
        zero := true;
        schett := 0;
        Write(p);
        readln(s);
        for i1 := 1 to length(s) do if (s[i1] <> '0') then zero := false;//Проверка на равенство нулю
        for i1 := 1 to length(s) do if (s[i1] = '.') then schett := schett + 1;//Проверка количества точек
        for i1 := 1 to length(s) do
        begin //Ошибки ввода вручную и вывод сообщений с указанием причины
             //если не ввели число
          if (s[i1] <> ' ') and (s[i1] <> '-') and (s[i1] <> '.') and errorp
               then 
            errorp := false;
             //если пробел внутри числа  
          if (s[i1] = ' ') and (i1 <> 1) and not errorp and not errors
               then
          begin
            writeln('Введите одно число. ');
            flag := false;
            errors := true;
          end;
             //если введён символ отличный от цифр
          if not (s[i1] in digits) and not errorb and (s[i1] <> ' ') and (s[1] <> '-') and (s[i1] <> '.')
               then 
          begin
            writeln('Число может состоять только из цифр. ');
            flag := false;
            errorb := true;
          end;
             //если ввели отрицательное число    
          if (s[1] = '-') and not errorn
               then
          begin
            writeln('Число не может быть отрицательным. ');
            flag := false;
            errorn := true;
          end;
             //Если точек больше одной
          if (schett >= 2) and not errorschet
               then
          begin
            Write('В числе может присутствовать только одна точка. ');
            flag := false;
            errorschet := true;
          end;
          
        end; 
        if not (flag) then writeln('Неверный формат числа. Пожалуйста, повторите ввод числа.');
        if errorp then writeln('Отсутствует число. Введите число. ');
      end;
    until (flag) and not errorp;
    Vvod := s;
    if not ((StrToFloat(s) > 0.0) and (StrToFloat(s) < 1.0)) then Writeln('Точность имеет значение от нуля до единицы. При этом точность сильно меньше единицы. Неверный формат числа. Пожалуйста, повторите ввод числа.');
  until (StrToFloat(s) > 0.0) and (StrToFloat(s) < 1.0);
end; 

//Функция для считывания целого положительного числа
function Vvods(p: string): string; //Функция для считывания действительного числа c файла
var
  flag, errorb, errors, errorp, zero, errort, errorschet, errorm: boolean;
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
      Write(p);
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

 //Функция для считывания вещественного числа |x|<=1 
function Vvod1(p: string): string;
var
  flag, errorb, errors, errorp, zero, errorschet: boolean;
  i, i1, schett(*кол-во точек*): shortInt;
  s: string;
  digits: set of '0'..'9';
begin
  digits := ['0'..'9'];
  repeat
    repeat
      begin
        flag := true;//проверка формата ответа
        errorb := false;
        errors := false;
        errorschet := false;
        errorp := true;
        zero := true;
        schett := 0;
        Write(p);
        readln(s);
        for i1 := 1 to length(s) do if (s[i1] <> '0') then zero := false;//Проверка на равенство нулю
        for i1 := 1 to length(s) do if (s[i1] = '.') then schett := schett + 1;//Проверка количества точек
        for i1 := 1 to length(s) do
        begin //Ошибки ввода вручную и вывод сообщений с указанием причины
             //если не ввели число
          if (s[i1] <> ' ') and (s[i1] <> '-') and (s[i1] <> '.') and errorp
               then 
            errorp := false;
             //если пробел внутри числа  
          if (s[i1] = ' ') and (i1 <> 1) and not errorp and not errors
               then
          begin
            writeln('Введите одно число. ');
            flag := false;
            errors := true;
          end;
             //если введён символ отличный от цифр
          if not (s[i1] in digits) and not errorb and (s[i1] <> ' ') and (s[1] <> '-') and (s[i1] <> '.')
               then 
          begin
            writeln('Число может состоять только из цифр. ');
            flag := false;
            errorb := true;
          end;
             //Если точек больше одной
          if (schett >= 2) and not errorschet
               then
          begin
            Write('В числе может присутствовать только одна точка. ');
            flag := false;
            errorschet := true;
          end;
          
        end; 
        if not (flag) then writeln('Неверный формат числа. Пожалуйста, повторите ввод числа.');
        if errorp then writeln('Отсутствует число. Введите число. ');
      end;
    until (flag) and not errorp;
    Vvod1 := s;
    if Abs(StrToFloat(s)) >= 1 then Writeln('Аргумент х может принимать значения, удовлетворяющие условию |х|<1. Неверный формат числа. Пожалуйста, повторите ввод числа.')
  until Abs(StrToFloat(s)) <= 1;
end;

begin
  
  phrase := 'Введите точность вычислений: ';
  eps := StrToFloat(Vvod(phrase));
  
  //Вычисление степени числа е с заданной точностью
  e1 := 0;
  e := 1;
  i := 1;
  shag := 1;
  phrase := 'Введите степень числа е. х = ';
  x := StrToInt(Vvods(phrase));
  if x = 0 then e := 1
  else
    repeat
      shag := shag * x / i;
      e1 := e;
      e := e + shag;
      i := i + 1;
      //Writeln(e,' ');
    until abs(e - e1) <= eps;
  writeln('Число е примерно равно ', e);
  
  //Вычисление выражения ln(1+x) с заданной точностью
  phrase := 'Введите значение аргумента х в выражении ln(1+x): ';
  x := StrToFloat(Vvod1(phrase));
  ln := x;
  i := 2;
  repeat
    ln1 := ln;
    shag := Power(-1, i - 1) * Power(x, i) / i;
    ln := ln + shag; 
    Inc(i);
    //Writeln(ln,' ');
  until abs(ln - ln1) <= eps;
  writeln('Выражение ln(1 + ', x, ') примерно равно ', ln);
  
  //Вычисление выражения arctg(x) с заданной точностью
  phrase := 'Введите значение аргумента х в выражении arctg(x): ';
  x := StrToFloat(Vvod1(phrase));
  y := x;
  i := 1;
  repeat
    y1 := y;
    shag := power(-1, i) * power(x, 2 * i + 1) / (2 * i + 1);
    y := y + shag;
    inc(i);
    //Writeln(y,' ');
  until abs(y - y1) <= eps;
  writeln('Выражение arctg(', x, ') примерно равно ', y);
end.       