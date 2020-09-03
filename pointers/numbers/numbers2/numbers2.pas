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
    new(first);
    read(first^.num);
    new(tmp);
    first^.next := tmp;

    {I-}
    while true do
    begin
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
        
        read(tmp^.num);
        
        if eof then
        begin
            tmp^.next := nil;
            break;
        end;
        
        new(last);
        tmp^.next := last;
        tmp := last;
    end;
    
    {print input numbers twice}
    writeln(first^.num);
    writeln(first^.num);
    tmp := first^.next;
    while true do
    begin
    	writeln(tmp^.num);
    	writeln(tmp^.num);
    	if tmp^.next = nil then
    	    break;
    	tmp := tmp^.next;
    end;

end.

