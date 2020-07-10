program OlympiadCounter;
const
  MaxAmountOfSchool = 67;
  MaxStudentsPerSchool = 100;
type
  CountersArray = array [1..MaxAmountOfSchool] of integer;
var
  RegisteredStudsPerSchool: CountersArray;
  i, inputSchoolNum, schoolNum: integer;
begin
  for i := 1 to MaxAmountOfSchool do
    RegisteredStudsPerSchool[i] := 0;
  {$I-}
  while not eof do
  begin
    readln(inputSchoolNum);
    if IOResult <> 0 then
    begin
      writeln('Incorect data');
      halt(1)
    end;
    schoolNum := inputSchoolNum div MaxStudentsPerSchool;
    if (schoolNum < 1) or (schoolNum > MaxAmountOfSchool) then
    begin
      writeln('Illegal school id: ', schoolNum, ' [', inputSchoolNum, ']');
      halt(1)
    end;
    RegisteredStudsPerSchool[schoolNum] := RegisteredStudsPerSchool[schoolNum] + 1;
  end;
  schoolNum := 1;
  for i := 1 to MaxAmountOfSchool do
    if RegisteredStudsPerSchool[i] > RegisteredStudsPerSchool[schoolNum] then
      schoolNum := i;
   for i := 1 to MaxAmountOfSchool do
    if RegisteredStudsPerSchool[i] = RegisteredStudsPerSchool[schoolNum] then
      writeln(i);
end.
