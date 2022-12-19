type info=record
            surname:string[20];
            name:string[20];
            year:integer;
          end;
var book:array [1..1000] of info;
    t:text;
    i,n,j:integer;
    x:info;
begin
  Assign(t, 'Книги.txt');
  reset(t);
  i:=1;
  while not eof(t) do
    with book[i] do begin
                         readln(t,surname);
                         readln(t,name);
                         readln(t,year);
                         i:=i+1;
                       end; 
  close(t);
  for n:=1 to i-2 do
    for j:=n+1 to i-1 do if((book[n].surname>book[j].surname)or(book[n].surname=book[j].surname))then begin
                                                                                                        x:=book[n];
                                                                                                        book[n]:=book[j];
                                                                                                        book[j]:=x;
                                                                                                      end;
  for n:=1 to i-1 do
    with book[n] do begin
                      writeln(surname);
                      writeln(name);
                      writeln(year);
                      writeln;
                    end;
end.