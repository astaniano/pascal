program first;
type
    itemptr = ^item;
    item = record
	data: integer;
	next: itemptr;
    end;
var
    start: itemptr;
begin
    new(start);
    start^.data := 25;
    new(start^.next);
    start^.next^.data := 36;
    new(start^.next^.next);
    start^.next^.next^.data := 49;
    start^.next^.next^.next := nil;

    writeln(start^.data);
end.
