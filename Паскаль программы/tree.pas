type tree=^pnode; 
     pnode=record  
      data:string; 
      pred,left,right:tree; 
            end;
procedure create_empty(var p1:tree);
begin  
 new(p1);
end;
procedure addleft(var p1:tree);
var p:tree;
begin  
  new(p);  
  p1^.left:=p; 
  p^.pred:=p1;  
  p1:=p;
end;
procedure addright(var p1:tree;element:string);
var p:tree;
begin  
  p1^.data:=element;  
  new(p);  
  p^.pred:=p1; 
  p1^.right:=p;  
  p1:=p;
end;
procedure back(var p1:tree;element:string);
begin  
  p1^.data:=element; 
  p1:=p1^.pred;
end;
procedure back2(var p1:tree);
begin  
  p1:=p1^.pred;
end;
procedure preorder(p1:tree);
begin  
  if p1<>nil then begin    
                    write(p1^.data);   
                    preorder(p1^.left);   
                    preorder(p1^.right);  
                  end;
end;
procedure postorder(p1:tree);
begin  
  if p1<>nil then begin    
                    postorder(p1^.left);   
                    postorder(p1^.right);   
                    write(p1^.data); 
                  end;
end;
procedure symmorder(p1:tree);
begin  
  if p1<>nil then begin    
                    symmorder(p1^.left);   
                    write(p1^.data);    
                    symmorder(p1^.right);  
                  end;
end;
var  node:tree;  
     stroka:string;  
     i:integer;
begin
  writeln('введите выражение');  
  readln(stroka);  
  create_empty(node);
  while i<>length(stroka) do begin
                               inc(i);
                               if stroka[i]='(' then addleft(node);
                               if stroka[i] in ['+','-','/','*'] then addright(node, stroka[i]);
                               if stroka[i] in ['0'..'9'] then back(node,stroka[i]);
                               if (stroka[i] =')')and(i<>length(stroka)) then back2(node);
                             end;
  writeln('прямой ход');  
  preorder(node); 
  writeln;  
  writeln('обратный ход'); 
  postorder(node);
  writeln;  
  writeln('симметричный ход'); 
  symmorder(node);
end.