{Модуль содержит набор инструментов для соыершения арифметических операций над 
рациональными дробями.
procedure Sokr(a,b:integer) - процедура сокращения рациональной дроби с числителем a
и знаменателем b
procedure Slozh(a,b,m,n:integer - процедура сложения двух рациональных дробей с
числителеми a и m и знаменателеми b и n
procedure Raz(a,b,m,n:integer) - процедура вычетания двух рациональных дробей с
числителеми a и m и знаменателеми b и n
procedure Proiz(a,b,m,n:integer) - процедура перемножения двух рациональных дробей с
числителеми a и m и знаменателеми b и n
procedure Delen(a,b,m,n:integer) - процедура деления двух рациональных дробей с
числителеми a и m и знаменателеми b и n}
Unit DrRa;
Interface
procedure Sokr(a,b:integer);
procedure Slozh(a,b,m,n:integer);
procedure Raz(a,b,m,n:integer);
procedure Proiz(a,b,m,n:integer);
procedure Delen(a,b,m,n:integer);
Implementation
procedure Sokr;
var c,d,e:integer;
begin
  e:=a;
  d:=b;
  while a<>b do if a>b then a:=a-b
                       else b:=b-a;
  c:=a;
  e:=e div c;
  d:=d div c;
  writeln (e,'/',d );
end;
procedure Slozh;
var c,d,e:integer;
begin
  a:=(a*n)+(b*m);
  b:=b*n;
  e:=a;
  d:=b;
while a<>b do if a>b then a:=a-b
                     else b:=b-a;
  c:=a;
  e:=e div c;
  d:=d div c;
  writeln (e,'/',d );
end;
procedure Raz;
var c,d,e:integer;
begin
  a:=(a*n)-(b*m);
  b:=b*n;
  e:=a;
  d:=b;
while a<>b do if a>b then a:=a-b
                     else b:=b-a;
  c:=a;
  e:=e div c;
  d:=d div c;
  writeln (e,'/',d );
end;
procedure Proiz;
var c,d,e:integer;
begin;
  a:=a*m;
  b:=b*n;
  e:=a;
  d:=b;
while a<>b do if a>b then a:=a-b
                     else b:=b-a;
  c:=a;
  e:=e div c;
  d:=d div c;
  writeln (e,'/',d );
end;
procedure Delen;
var c,d,e:integer;
begin;
  a:=a*n;
  b:=b*m;
  e:=a;
  d:=b;
while a<>b do if a>b then a:=a-b
                     else b:=b-a;
  c:=a;
  e:=e div c;
  d:=d div c;
  writeln (e,'/',d );
end;
begin;
  writeln('Модуль работы с дробями подключен');
end.
