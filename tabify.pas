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

Function GetNumberOfOptionalParams: integer;
var
    counter: Integer;

begin
    counter := 0;
	if IsOnCommandLine('-x') > 0 then
		counter := counter + 1;
	if IsOnCommandLine('-n') > 0 then
		counter := counter + 1;

    GetNumberOfOptionalParams := counter;
end;

Procedure DisplayUsage;
begin
    writeln('Invalid command...');
end;

{ 
	-x 		convert tabs to spaces
	-n=### 	number of spaces per tab (4 by default)
	
}

var
	i:	integer;
	optionalParams:			integer;
	pIndex:	integer;
	
begin
	pIndex := 0;	
	if (ParamCount < 2) or (ParamCount > 4) then
		begin
		DisplayUsage;
		end
	else
		begin
    	for i := 1 to ParamCount do
			begin
			if (ParamStr(i) = '-x') then
			    begin
			    writeln('Replace tabs with spaces...');
			    end
			else if (ParamStr(i) = '-n') then
			    begin
			    writeln('Spaces per tab...');
			    end
			else if (pIndex = 0) then
				begin
				writeln('Input file: ',ParamStr(i));
				pIndex := 1;
				end
			else if (pIndex = 1) then
				begin
				writeln('Output file: ',ParamStr(i));
				end;
			end;
		end;
				
	if IsOnCommandLine('-n') > 0 then
	    begin

	    { find the index of the = character 
	    paramIndex := IsOnCommandLine('-n');
	    if (paramIndex > 0) then
	    	begin
	    	temp := ParamStr(paramIndex);
	    	offset := index(temp, '=') + 1;
			Val(substr(temp, offset), spacesPerTab, errorCode);
			writeln('Spaces per tab = ', spacesPerTab);
			end; }
		end;
end.

