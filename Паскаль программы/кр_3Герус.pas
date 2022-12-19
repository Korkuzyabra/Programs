program kr_3;
var x, esp, sum, slag: real;
    n: integer;
begin
Write('Введите заданную точность ');
read (esp);
Write('Введите значение аргумента х ');
read (x);
if abs(x)>1 then begin
  n:=1;
  slag:=1; //первое слагаемое при n=0
  sum:=slag;
  repeat
    slag:= exp((-1)*(ln(x)))* exp(n*(ln(x)));
    sum:=sum+slag;
    n:=n+1;
  until esp<=sum;
write('Сумма равна ', sum);
end
else write ('Введите другой x');
end.