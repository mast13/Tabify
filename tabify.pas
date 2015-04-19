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
	SpacesPerTab: integer;
	
begin
	cmdline_count := ParamCount;
    filename := ParamStr (1);
	writeln('Updating file:', filename);
	if IsOnCommandLine('-x') > 0 then
		writeln('Remove tabs');
	if IsOnCommandLine('-n') > 0 then
	    begin
	    { find the index of the = character }
	    offset := index(ParamStr(IsOnCommandLine('-n')), '=');
	    writeln(substr(ParamStr(IsOnCommandLine('-n')), offset);
		writeln('Spaces per tab = ');
		end;
end.

