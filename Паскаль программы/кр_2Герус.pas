program kr_1;
var x, y: real;
begin
  write ('Введите координаты точки ');
  readln (x,y);
  if ((x*x+y*y)<=1) and (y>=0) and not ((x>=0) and (y>=0) and (x*x+y*y<0.3)) then write ('Точка с координатами (', x, ' , ', y, ') принадлежит области ')
                                                                             else write ('Точка с координатами (', x, ' , ', y, ') не принадлежит области ');
end.