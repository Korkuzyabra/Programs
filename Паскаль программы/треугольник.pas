 program treugolnik;
var x1, x2, x3, y1, y2, y3, a, b, c, q, r, t, z1, z2, z3, e1, e2, e3:real;
function pl (a, b,c:real):real;
var S, p: real;
  begin
    p:=(a+b+c)/2;
    S:=sqrt(p*(p-a)*(p-b)*(p-c));
    pl:=S;
  end;
function sr (x1, x2 :real):real;
var z:real;
  begin
    z:=(x2+x1)/2;
    sr:=z;
  end;
  begin
    repeat
     writeln('Введите координаты точки А (x1;y1) ');
     readln(x1, y1);
     writeln('Введите координаты точки B (x2;y2) ');
     readln(x2, y2);
     writeln('Введите координаты точки C (x3;y3) ');
     readln(x3, y3);
     a:=sqrt(sqr(x1-x2)+sqr(y1-y2));
     b:=sqrt(sqr(x2-x3)+sqr(y2-y3));
     c:=sqrt(sqr(x3-x1)+sqr(y3-y1));
    until (a+b>c) and (a+c>b) and (c+b>a);
    z1:=sr(x3,x1);
    e1:=sr(y3,y1);
    z2:=sr(x1,x2);
    e2:=sr(y1,y2);
    z3:=sr(x2,x3);
    e3:=sr(y2,y3);
    q:=sqrt(sqr(z1-z2)+sqr(e1-e2));
    r:=sqrt(sqr(z2-z3)+sqr(e2-e3));
    t:=sqrt(sqr(z3-z1)+sqr(e3-e1));
   writeln('Площади треугольников ABC = ', pl(a,b,c), ' и LMN = ', pl(q,r,t));
   writeln('Отношение треугольника LMN к ABC треугольнику равно ', pl(q,r,t)/pl(a,b,c));
  end.