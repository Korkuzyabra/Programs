type p_elem=^elem; 
     elem= record 
      data:string; 
      next:p_elem; 
           end;
procedure reading(var stroka:string);
begin
  writeln('введите выражение');  
  readln(stroka);
end;
procedure outelement(element:string;var after_work:string );
begin
  after_work:=after_work+element;
end;
procedure prioritet(element:string;var znach:integer);
begin 
  case element of    
    '(',')':znach:=1;   
    '+','-':znach:=2;    
    '*','/':znach:=3;    
    '^':znach:=4;  
  end;
end;
procedure addtostack(var p1:p_elem;element:string);
var p:p_elem;
begin
  if p1=nil then begin 
                   new(p1);
                   p1^.next:=nil;
                   p1^.data:=element;
                 end
            else begin    
                   new(p);    
                   p^.next:=p1;   
                   p^.data:=element;   
                   p1:=p;  
                 end;
end;
procedure out_stack(var p1:p_elem;var after_work:string);
var p:p_elem;
begin
  if p1^.data<>'(' then begin   
                          after_work:=after_work+p1^.data;  
                          p:=p1;  
                          p1:=p1^.next;  
                          dispose(p);  
                        end
                   else begin    
                          p:=p1;   
                          p1:=p1^.next;    
                          dispose(p);  
                        end;
end;
procedure deleteelement(var p1:p_elem);
var p:p_elem;
begin 
  p:=p1; 
  p1:=p1^.next;  
  dispose(p);
end;
procedure allout(var p1:p_elem;var after_work:string );
begin  
  while p1<>nil do begin   
                     after_work:=after_work+p1^.data;  
                     p1:=p1^.next; 
                   end;
end;
procedure addoperandtostack(var p1:p_elem;element:string);
var p:p_elem;
begin
  if p1=nil then begin 
                   new(p1);p1^.next:=nil;
                   p1^.data:=element;
                 end
            else begin
                   new(p);
                   p^.next:=p1;
                   p^.data:=element;
                   p1:=p;
                 end;
end;
procedure izwlechenie(var p1:p_elem;var a,b:real);
var p:p_elem;
begin
  b:=strtofloat(p1^.data);
  p:=p1;
  p1:=p1^.next;
  dispose(p);
  a:=strtofloat(p1^.data);
  p:=p1;
  p1:=p1^.next;
  dispose(p);
end;
var stack:p_elem;  
    stroka:string;  
    i:integer;  
    symbol_stroki,symbol_staka:integer;
    after_work:string;
    a,b:real;
    scheitel:real;
begin
  reading(stroka);
  while i<>length(stroka) do begin
                               inc(i);
                               if stroka[i] in ['0'..'9'] then outelement(stroka[i],after_work);
                               if stroka[i] in ['(',')','+','-','*','/'] then begin
                                                                                prioritet(stroka[i],symbol_stroki);
                                                                                if stack<>nil then prioritet(stack^.data,symbol_staka) 
                                                                                              else symbol_staka:=0;
                               if (stack=nil) or (stroka[i]='(') or (symbol_stroki>symbol_staka) then addtostack(stack,stroka[i]);
                               if (symbol_stroki<=symbol_staka) and (stack^.data<>'(') then  begin
                                                                                               while (symbol_stroki<=symbol_staka) or (stack<>nil) do begin
                                                                                                                                                        out_stack(stack,after_work);
                                                                                                                                                        prioritet(stroka[i],symbol_stroki);
                                                                                                                                                        if stack<>nil then prioritet(stack^.data,symbol_staka) 
                                                                                                                                                                      else symbol_staka:=0;
                                                                                                                                                      end;
                                                                                               if (stroka[i]=')') and (stack<>nil) then begin
                                                                                                                                          while (stack^.data<>'(') and (stack<>nil) do out_stack(stack,after_work);
                                                                                                                                          if stack^.data='(' then deleteelement(stack);
                                                                                                                                        end;
                                                                                               if stroka[i]<>')' then addtostack(stack,stroka[i]);
                                                                                             end;
                                                                              end;
                             end;
  if i=length(stroka) then allout(stack,after_work);
  writeln('ОПЗ     ',after_work);
  i:=0;
  while i<>length(after_work) do begin
                                   inc(i);
                                   if after_work[i] in ['0'..'9'] then addoperandtostack(stack,after_work[i]);
                                   if after_work[i] in ['+','-','*','/'] then begin
                                                                                izwlechenie(stack,a,b);
                                                                                case after_work[i] of
                                                                                  '+':scheitel:=a+b;
                                                                                  '-':scheitel:=a-b;
                                                                                  '*':scheitel:=a*b;
                                                                                  '/':scheitel:=a/b;
                                                                                end;
                                                                                addoperandtostack(stack,floattostr(scheitel));
                                                                              end;
                                 end;
  writeln('результат работы стековой машины    ',stack^.data)
  end.