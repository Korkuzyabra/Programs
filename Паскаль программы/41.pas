program kr41;
type info=record
            marsh:integer;
            train:integer;
            sit:integer;
            date:record
                   year:2022..2023;
                   month:1..12;
                   day:1..31;
                 end;
          end;
var ticket: array [1..1000] of info;
    n,i,m:integer;
begin
  writeln('Сколько всего билетов продано?');
  readln(n);
  for i:=1 to n do
    with ticket[i] do begin
                        writeln('Введите номер маршрута');
                        readln(marsh);
                        writeln('Введите номер вагона');
                        readln(train);
                        writeln('Введите номер места');
                        readln(sit);
                        writeln('Введите год');
                        readln(date.year);
                        writeln('Введите месяц');
                        readln(date.month);
                        writeln('Введите день');
                        readln(date.day);
                       end;
  writeln(ticket.date.year);
  writeln('За какой месяц определить количество проданных  билетов?');
  readln(m);
  
                       end.
 