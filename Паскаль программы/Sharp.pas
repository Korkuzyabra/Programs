Unit Sharp;
Interface
procedure Shar (r:real);
procedure SharSig (r,h:real);
procedure SharSlo (r, r1, h:real);
procedure Konus (r,h:real);
Implementation
procedure Shar;
var v:real;
begin 
  v:=(4/3)*pi*(r*r*r);
  writeln('Объём шара равен ', v);
end;
procedure SharSig;
var v:real;
begin
  v:=(pi*sqr(h))*(r-((1/3)*h));
  writeln('Объём шарового сегмента равен ', v);
end;
procedure SharSlo;
var v:real;
begin
  v:=(1/6)*pi*(h*h*h)+(1/2)*pi*(sqr(r)+sqr(r1))*(h);
  writeln('Объём шарового слоя равен ',v);
end;
procedure Konus;
var v:real;
begin
  v:=(1/3)*pi*sqr(r)*h;
  writeln('Объём конуса равен ',v);
end;
begin
  writeln('---Модуль вычисления объёма тел вращения подключен---');
end.