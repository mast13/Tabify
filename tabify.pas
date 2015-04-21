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
    cmdline_count:	integer;
	filename:	string(20);
	offset:	integer;
	errorCode: integer;
	spacesPerTab: integer;
	temp: string(20);
	paramIndex: integer;
	
begin
	cmdline_count := ParamCount;
    filename := ParamStr (1);
	writeln('Updating file:', filename);
	if IsOnCommandLine('-x') > 0 then
		writeln('Remove tabs');
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

