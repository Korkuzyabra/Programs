Program лаб4првием;
var
  x,y,a:real;
  n:integer;
  eps:real;
  begin
    Writeln('Введите показатель степени Exp(x)=');
    Read(x);
    Writeln('Введите точность Eps=');
    Read(eps);
    y:=1;
    n:=0;
    a:=1;
    repeat
      n:=n+1;
      a:=a*x/n;
      y:=y+a;
    until abs(a) < eps;
    Writeln('Результат y=',y);
    Writeln('Exp(x)=',exp(x));
    Writeln('Погрешность=',abs(y-exp(x)));
  end.