Program Tabify (input, output);

Function IsOnCommandLine(arg: string): integer;
var
	Counter: Integer;
	p: string(3);
	
begin
	IsOnCommandLine := -1;
    for Counter := 0 to ParamCount do
		begin
		p := substr(ParamStr(Counter),1,2);
		if  arg = p then
			IsOnCommandLine := Counter;
		end;
end;

{ 
	-x 		convert tabs to spaces
	-n=### 	number of spaces per tab (4 by default)
	
}
var
	errorCode: 		integer;
	filename:		string(20);
	offset:			integer;
	paramIndex: 	integer;
	spacesPerTab: 	integer;
	temp: 			string(20);
	
begin
	writeln(ParamCount);
	if ParamCount < 2 then
		begin
		writeln('Error: Missing arguments...');
		end
	else if ParamCount = 2 then
		begin
		writeln('Input file: ',paramStr(1));
		writeln('Output file: ',paramStr(2));
		end
	else if ParamCount = 3 then
		begin
		writeln('Optional argument: ',paramStr(1));
		writeln('Input file: ',paramStr(2));
		writeln('Output file: ',paramStr(3));
		end
	else if ParamCount = 4 then
		begin
		writeln('Optional argument: ',paramStr(1));
		writeln('Optional argument: ',paramStr(2));
		writeln('Input file: ',paramStr(3));
		writeln('Output file: ',paramStr(4));
		end;
		
	if IsOnCommandLine('-x') > 0 then
		begin
		writeln('Remove tabs');
		end;
		
	if IsOnCommandLine('-n') > 0 then
	    begin

	    { find the index of the = character }
	    paramIndex := IsOnCommandLine('-n');
	    if (paramIndex > 0) then
	    	begin
	    	temp := ParamStr(paramIndex);
	    	offset := index(temp, '=') + 1;
			Val(substr(temp, offset), spacesPerTab, errorCode);
			writeln('Spaces per tab = ', spacesPerTab);
			end;
		end;
end.

