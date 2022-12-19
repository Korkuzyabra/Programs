program vira;
var f,f1: text;
    x,y,z,a,b: real;
begin
  assign(f,'in3.dat.txt');
  reset(f);
  read(f,x);
  writeln(x);
  read(f,y);
  writeln(y);
  read(f,z);
  writeln(z);
  close(f);
  a:=((1+y)*x+y/(sqr(x)+4))/(((exp((-x-2)*ln(y)))+1/(sqr(x)+4)));
  b:=(1+cos(y-2))/(exp((4)*ln(x))/2+sqr(sin(z)));
  writeln(a);
  writeln(b);
  assign(f1,'out3.dat.txt');
  rewrite(f1);
  writeln(f1,a);
  writeln(f1,b);
  close(f1);
end.