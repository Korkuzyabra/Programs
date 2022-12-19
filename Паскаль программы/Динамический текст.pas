type Dat = Char;
     TPElem = ^TElem;
     TElem = record
              Data : Dat;
              PNext : TPElem;
             end;
procedure dob(var aPStack : TPElem; const aData : Dat);
var PElem : TPElem;
begin
  New(PElem);
  PElem^.Data := aData;
  PElem^.PNext := aPStack;
  aPStack := PElem;
end;
function pop(var aPStack : TPElem; var aData : Dat) : Boolean;
var
  PElem : TPElem;
begin
  pop := False;
  if aPStack <> nil then begin
                           PElem := aPStack;
                           aPStack := PElem^.PNext;
                           aData := PElem^.Data;
                           Dispose(PElem);
                           pop := True;
                         end;
end;
var
  F : Text;
  PS : TPElem;
  Data : Dat;
  S, b: String;
begin
  Assign(F, 's.txt');
  Reset(F);
  PS:= nil;
  writeln('Текст файла:');
  Readln(f,b);
  Writeln(b);
  repeat
    Assign(F, 's.txt');
    Reset(F);
    while not Eof(F) do begin
      Read(F, Data);
      dob(PS, Data);
    end;
    Writeln('Обратный порядок:');
    while pop(PS, Data) do Write(Data);
    Writeln;
    Readln(S);
  until S <> '';
end.