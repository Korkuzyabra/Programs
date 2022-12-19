(*Найти число N, при котором выражение sqrt(6+sqrt(6....+sqrt(6))..)) приближается к числу 3 с заданной погрешностью.*)
Program Tochnost;
uses crt;

var eps, sum: real;
    N: integer;
    phrase:string;
    
 //Функция для считывания положительного вещественного числа от 0 до 1  
function Vvod(p: string): string;
var
  flag, errorb, errorn, errors, errorp, zero, errort, errorschet: boolean;
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
    
begin
  phrase:='Введите точность вычислений: ';
  eps:=StrToFloat(Vvod(phrase));
  sum:=0;
  N:=0;
  repeat
  sum:=sqrt(sum+6);
  N:= N + 1;
  until abs(3-sum) < eps;
  Writeln('Число N = ',N);
  Writeln('При этом значение выражения равно ',sum);
end.