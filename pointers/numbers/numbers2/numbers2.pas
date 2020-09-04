program numbers2;
type
    itemptr = ^item;
    item = record
	num: integer;
	next: itemptr;
    end;
var
    first, last: itemptr;
begin
    new(first);
    last := first;
    read(last^.num);
        
    {$I-}
    while not SeekEof do
    begin
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
        
        new(last^.next);
        last := last^.next;
        
        read(last^.num);
        last^.next := nil;
    end;
    
    {print input numbers twice}
    last := first;
    while last <> nil do
    begin
    	writeln(last^.num);
    	writeln(last^.num);
    	last := last^.next;
    end;
    
end.
