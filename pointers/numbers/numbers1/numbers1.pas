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
    
    {$I-}
    while not SeekEof do
    begin
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
                
        new(tmp);
        read(tmp^.num);
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

