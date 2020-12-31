program numbers1;
type
    itemptr = ^item;
    item = record
	num: integer;
	next: itemptr;
    end;
var
    first, tmp: itemptr;
begin
    first := nil;
    
    {$I-} {switch off standart exception notifications}
    while not SeekEof do
    begin
        new(tmp);
        
        read(tmp^.num);
        if IOResult <> 0 then {if bad input}
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
        
        tmp^.next := first;
        first := tmp;
    end;
    
    
    {print input numbers backwards}
    while tmp <> nil do
    begin
    	writeln(tmp^.num);
    	tmp := tmp^.next;
    end;

end.

