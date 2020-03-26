{Из последовательности символов, записанной в текстовом файле, построить бинарное дерево поиска. Распечатать все листья дерева}

program NumTree;

type
  Elem = char;
  BTree = ^Uz;
  Uz = record
    data: Elem;
    left, right: BTree;
  end;

procedure AddElem(var root: BTree; el: Elem);//добавление элемента в дерево
begin
  if root=nil then
    begin
      new(root);
      root^.data:=el;
      root^.left:=nil;
      root^.right:=nil;
    end
  else
    begin
      if el>root^.data then
      AddElem(root^.right,el)
    else
      if el<root^.data then
      AddElem(root^.left,el);
    end;
end;

procedure CreatTree(var BinT: BTree; DF: TextFile);//запись элементов в дерево
var n: Elem;
begin
  while not Eof(DF) do
    begin
      Readln(DF, n);
      AddElem(BinT,n);
    end;
end;

Procedure PrintTree(root:BTree; h: integer);//печать дерева
begin
  if root=nil then exit;
  PrintTree(Root^.right, h+1);
  for var i := 1 to h do
    write(#9);
    writeln(Root^.data);
    PrintTree(Root^.left, h+1);
end;


var
  BinTreeF: BTree;
  Fl: TextFile;
  h: integer;
begin
  BinTreeF:=nil;
  h:=0;
  Assign(Fl, 'data.txt'); //связывает файловую переменную с файлом на диске
  Reset(Fl); //открытие текстового файла для чтения
  CreatTree(BinTreeF, Fl);
  writeln('Дерево: ');
  PrintTree(BinTreeF,h);
end.
