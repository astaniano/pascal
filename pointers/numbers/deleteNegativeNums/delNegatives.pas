program DeleteNegativeNums;
type
    itemptr = ^item;
    item = record
	num: integer;
	next: itemptr;
    end;
var
    first, last, tmp: itemptr;
    pp: ^itemptr;
begin
    new(first);
    last := first;
    read(last^.num);
     
    {get input numbers from user}   
    {$I-} 
    while not SeekEof do
    begin
        new(last^.next);
        last := last^.next;
        
        read(last^.num);
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
        
        last^.next := nil;
    end;
    
    {delete items with negative numbers}
    pp := @first;
    while pp^ <> nil do
    begin
    	if pp^^.num < 0 then
    	begin 
    	    tmp := pp^;
    	    pp^ := pp^^.next;
    	    dispose(tmp)
    	end
    	else
    	    pp := @(pp^^.next)
    end;
    
    {print positive numbers}
    last := first;
    while last <> nil do
    begin
    	writeln(last^.num);
    	last := last^.next;
    end;

end.
