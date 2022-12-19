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
procedure outelement(element:string);
begin
  write(element,' ');
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
procedure out_stack(var p1:p_elem);
var p:p_elem;
begin
  if p1^.data<>'(' then begin 
                          write(p1^.data);
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
procedure allout(var p1:p_elem);
begin
  while p1<>nil do begin 
                     write(p1^.data,' ');
                     p1:=p1^.next;
                   end;
end;
var stack:p_elem;
    stroka:string;
    i:integer;
    symbol_stroki,symbol_staka:integer;
begin
  reading(stroka);
  while i<>length(stroka) do begin
                               inc(i);
                               if stroka[i] in ['0'..'9'] then outelement(stroka[i]);
                               if stroka[i] in ['(',')','+','-','*','/'] then begin
                                                                                prioritet(stroka[i],symbol_stroki);
                                                                                if stack<>nil then prioritet(stack^.data,symbol_staka) 
                                                                                              else symbol_staka:=0;
                                                                                if (stack=nil) or (stroka[i]='(') or (symbol_stroki>symbol_staka) then addtostack(stack,stroka[i]);
                                                                                if (symbol_stroki<=symbol_staka) and (stack^.data<>'(') then  begin
                                                                                                                                                while (symbol_stroki<=symbol_staka) or (stack<>nil) do begin
                                                                                                                                                                                                         out_stack(stack);
                                                                                                                                                                                                         prioritet(stroka[i],symbol_stroki);
                                                                                                                                                                                                         if stack<>nil then prioritet(stack^.data,symbol_staka) 
                                                                                                                                                                                                                        else symbol_staka:=0;
                                                                                                                                                                                                       end;
        
                                                                                                                                                if (stroka[i]=')') and (stack<>nil) then begin
                                                                                                                                                                                           while (stack^.data<>'(') and (stack<>nil) do out_stack(stack);
                                                                                                                                                                                           if stack^.data='(' then deleteelement(stack);
                                                                                                                                                                                         end;
        
                                                                                                                                                if stroka[i]<>')' then addtostack(stack,stroka[i]);
                                                                                                                                              end;
      
                                                                              end;
                             end;
  
  if i=length(stroka) then allout(stack);
end.