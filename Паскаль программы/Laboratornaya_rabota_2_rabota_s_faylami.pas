program Tri_v_odnom;

uses crt;

var
  h, time, a, x, y, phrase: string;
  phile, phile2, phile3: text;
  hch, x1, y1: real;

const
  Accuracity = 6; //Число знаков после запятой при выводе времени падения камня

//---------------------------------------------------------------------------------------------------

function Vvod_text(s: string): string; //Функция для считывания действительного числа c файла
var
  flag, errorb, errors, errorp, zero, errort, errorschet, errorm: boolean;
  i, i1, schett(*кол-во точек*): shortInt;
  answer: string;
  digits: set of '0'..'9';
begin
  digits := ['0'..'9'];
  repeat
    begin
      flag := true;//проверка формата ответа
      errorb := false;
      errors := false;
      errort := false;
      errorm := false;
      errorschet := false;
      errorp := true;
      zero := true;
      schett := 0;
      for i1 := 1 to length(s) do if (s[i1] <> '0') then zero := false;//Проверка на равенство нулю
      for i1 := 1 to length(s) do if (s[i1] = '.') then schett := schett + 1;//Проверка количества точек
      for i1 := 1 to length(s) do
      begin //Ошибки ввода вручную и вывод сообщений с указанием причины
             //если не ввели число
        if (s[i1] <> ' ')
               then 
          errorp := false;
             //если пробел внутри числа  
        if (s[i1] = ' ') and (i1 <> 1) and not errorp and not errors
               then
        begin
          writeln('Необходимо только одно число. ');
          flag := false;
          errors := true;
        end;
             //если введён символ отличный от цифр
        if not (s[i1] in digits) and not errorb and (s[i1] <> ' ') and (s[i1] <> '.') and (s[i1] <> '-')
               then 
        begin
          writeln('Число может состоять только из цифр. ');
          flag := false;
          errorb := true;
        end;
        //Если минус в середине числа
        if (s[i1] = '-') and not errorp and errorm
        then
        begin
          Writeln('Минус не может стоять в середине числа.');
          flag := false;
          errorm := true;
        end;
             //Если нет целой части
        if (s[1] = '.') and (schett = 1) and (not errort)
               then
        begin
          Write('Отстутствует целая часть. ');
          errort := true;
          flag := false;
        end;
             //Если точек больше одной
        if (schett = 2) and not errorschet
               then
        begin
          Write('В числе может присутствовать только одна точка. ');
          flag := false;
          errorschet := true;
        end;
        
      end; 
      if errorp then writeln('Введите число. ');
      if not (flag) or errorp then
      begin
          //В случае ошшибки нужно ввести ответ заново
        repeat //Чтение ответа с проверкой на правильный формат ответа
          begin
            Writeln('Неверный формат ответа. Как хотите ввести ответ?');
            Writeln('1. Изменю в файле.');
            Writeln('2. Введу вручную.');
            readln(answer);//чтение ответа
            if (answer <> '1') and (answer <> '2') 
              then
              writeln('Ошибка! Неверный формат ответа. Ответьте на вопрос, нажав клавишу 1 или 2.');  
          end;
        until (answer = '1') or (answer = '2'); 
        
        case (StrToInt(answer)) of
          1: halt(0);//закрытие программы
          2:
            begin
              Write('Введите число = ');
              readln(s);
            end;
        end;
      end;
      
    end;       
  until (flag) and not errorp;
  Vvod_text := s;
end;

//---------------------------------------------------------------------------------------------------

function Vvod(p: string): string; //Функция для считывания положительного вещественного числа
var
  flag, errorb, errorn, errors, errorp, zero, errort, errorschet: boolean;
  i, i1, schett(*кол-во точек*): shortInt;
  s: string;
  digits: set of '0'..'9';
begin
  digits := ['0'..'9'];
  repeat
    begin
      flag := true;//проверка формата ответа
      errorb := false;
      errorn := false;
      errors := false;
      errort := false;
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
        if (s[i1] <> ' ')
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
             //Если нет целой части
        if (s[1] = '.') and (schett = 1) and (not errort)
               then
        begin
          Write('Отстутствует целая часть. ');
          errort := true;
          flag := false;
        end;
             //Если точек больше одной
        if (schett = 2) and not errorschet
               then
        begin
          Write('В числе может присутствовать только одна точка. ');
          flag := false;
          errorschet := true;
        end;
        
      end; 
      if not (flag) then writeln('Неверный формат числа. Пожалуйста, повторите ввод числа.');
      if errorp then writeln('Введите число. ');
    end;
  until (flag) and not errorp;
  Vvod := s;
end;

//---------------------------------------------------------------------------------------------------

begin
  (*Первая задача. Определить время падения камня на поверхность земли с высоты h.*)
  phrase := 'Введите высоту (метры),с которой падает камень: ';
  hch := StrToFloat(Vvod(phrase));
  Writeln('Время падения камня на поверхность земли с высоты ', hch, ' равна ', sqrt(9.81 * hch / 2):0:Accuracity, ' секунд(-ы)');
  (*Вторая задача. Дано действительное число а. Не пользуясь никакими другими арифметическими операциями,
  кроме умножения, получить a^4 за две операции.*)
  assign(phile, 'in2.txt');
  reset(phile);
  readln(phile, a);
  Writeln('a = ', a);
  a := vvod_text(a);
  close(phile);
  Rewrite(phile);
  writeln(phile, a);
  close(phile);
  a := FloatToStr(StrToFloat(a) * StrToFloat(a));
  a := FloatToStr(StrToFloat(a) * StrToFloat(a));
  Writeln('а^4 = ', a);
  (*Третья задача. Даны действительные числа x, y. Не пользуясь никакими опперациями, кроме умножения,сложения
   и вычитания, вычислить 3x^2*y^2-2xy^2-7x^2*y-4y^2+15xy+2x^2-3x+10y+6. Разрешается использовать не более
   восьми умножений и восьми сложений и вычитаний.*)
  assign(phile2, 'in3.txt');
  assign(phile3, 'out3.txt');
  reset(phile2);
  readln(phile2, x);
  read(phile2, y);
  Writeln('3x^2*y^2-2xy^2-7x^2*y-4y^2+15xy+2x^2-3x+10y+6');
  Writeln('x = ', x);
  x := vvod_text(x);
  Writeln('y = ', y);
  y := vvod_text(y);
  close(phile2);
  Rewrite(phile2);
  Writeln(phile2, x);
  Write(phile2, y);
  close(phile2);
  x1 := strtofloat(x);
  y1 := strtofloat(y);
  //Writeln('Ответ решением без упрощения:', 3 * x1 * x1 * y1 * y1 - 2 * x1 * y1 * y1 - 7 * x1 * x1 * y1 - 4 * y1 * y1 + 15 * x1 * y1 + 2 * x1 * x1 - 3 * x1 + 10 * y1 + 6);
  Writeln('Ответ с упрощением: ', y1 * (x1 * (x1 * (3 * y1 - 7) - 2 * y1 + 15) - (4 * y1 - 10)) + x1 * (2 * x1 - 3) + 6);
  Rewrite(phile3);
  Writeln(phile3, y1 * (x1 * (x1 * (3 * y1 - 7) - 2 * y1 + 15) - (4 * y1 - 10)) + x1 * (2 * x1 - 3) + 6);
  Close(phile3);
end.