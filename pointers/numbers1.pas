program Numbers2;
type
    itemptr = ^item;
    item = record
        data: integer;
	next: itemptr;
    end;
var
    first, temp: itemptr;
    num: integer;
begin
    new(first);
    read(num);
    first^.data := num;
    new(first^.next);
    temp := first^.next;
    
    {$I-}
    while not eof do
    begin
        read(num);
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
	    halt(1);
        end;
	temp^.data := num;
	new(temp^.next);
	temp := temp^.next;
    end;

    temp^.next := nil;
    temp := first;
    
    while temp^.next <> nil do
    begin
	write(temp^.data);
	temp := temp^.next;
    end;

end.
