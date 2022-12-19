program kr2_1;
var x, y: real;
begin
  write ('Введите координаты точки ');
  readln (x,y);
  if ((x>=-4) and (x<=0) and ((y<=2+(x/2)) and (y>=-2-(x/2))) or (x>=0) and (y*y+sqr(x+1.5)<=6.25))then write ('Точка с координатами (', x, ' , ', y, ') принадлежит области ')
                                                                                                   else write ('Точка с координатами (', x, ' , ', y, ') не принадлежит области ');
end.