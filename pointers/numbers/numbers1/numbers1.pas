program numbers1;
type
    itemptr = ^item;
    item = record
	num: integer;
	next: itemptr;
    end;
var
    tmp, current: itemptr;
begin
    new(tmp);
    read(tmp^.num);
    tmp^.next := nil;
    
    {$I-}
    while not eof do
    begin
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
                
        new(current);
        read(current^.num);
        current^.next := tmp;
    
        tmp := current;
    end;
    
    {print input numbers backwards}
    while true do
    begin
    	writeln(current^.num);
    	if current^.next = nil then
    	    break;
    	current := current^.next;
    end;

end.

