program konch_sum;
var ht, h, et, e, ln, lnt, ep, n, x: real;
    i: integer;
begin
  repeat
   write('Введите заданную точность 0<e<<1, e= ');
   read(e);
  until (e>0) and (e<1);
// число е
  et:= 0;
  e:= 1;
  i:= 1;
  n:= 1;
  write ('Введите x = ');
  read (x);
  if x = 0 then e:= 1
           else repeat
                  n:= n * (x / i);
                  et:= e;
                  e:= e + n;
                  i:= i + 1;
                until abs(e - et) <= ep;
  writeln('Число е = ', e);
 //ln(1+x) 
  write ('Введите x = ');
  read (x);
  ln := x;
  i := 2;
  repeat
    lnt:=ln;
    n:= Power(-1, i - 1) * Power(x, i) / i;
    ln:=ln + n; 
    i:=i+1;
  until abs(ln - lnt) <= ep;
  writeln('ln(1 + ', x, ')  = ', ln);
 //arctg(x) 
  write ('Введите x = ');
  read (x);
  h:= x;
  i:= 1;
  repeat
    ht:= h;
    n:= power(-1, i) * power(x, 2 * i + 1) / (2 * i + 1);
    h:= h+n;
    i:=i+1;
  until abs(h - ht) <= ep;
  writeln('arctg(', x, ') равно ', h);
end. 