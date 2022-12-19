program vira;
var f,f1: text;
    x,y,z,a,b: real;
begin
  assign(f,'in3.dat.txt');
  reset(f);
  read(f,x);
  writeln('Число x = ', x);
  read(f,y);
  writeln('Число y = ', y);
  read(f,z);
  writeln('Число z = ', z);
  close(f);
  if (x<>0) and (sin(z)<>0) then begin
                                  a:=(1+y)*(x+(y/(sqr(x)+4)))/(exp(-x-2)+(1/(sqr(x)+4)));
                                  b:=(1+cos(y-2))/((x*x*x*x)/(2+sqr(sin(z))));
                                  writeln('Число a = ', a);
                                  writeln('Число b = ', b);
                                  assign(f1,'out3.dat.txt');
                                  rewrite(f1);
                                  writeln(f1,a);
                                  writeln(f1,b);
                                  close(f1);
                                 end
                            else write ('Введите другие значения x и z');                               
end.