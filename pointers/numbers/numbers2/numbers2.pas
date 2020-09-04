program numbers2;
type
    itemptr = ^item;
    item = record
	num: integer;
	next: itemptr;
    end;
var
    first, tmp, last: itemptr;
begin
    new(tmp);
    read(tmp^.num);
    first := tmp;
        
    {$I-}
    while not SeekEof do
    begin
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
                
        new(last);
        read(last^.num);
        tmp^.next := last;
        
        tmp := last;
    end;
    
    {print input numbers twice}
    tmp := first;
    while true do
    begin
    	writeln(tmp^.num);
    	writeln(tmp^.num);
    	if tmp^.next = nil then
    	    break;
    	tmp := tmp^.next;
    end;
    
end.

