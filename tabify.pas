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
const  
	OPTIONS : array [0..2] of String[3] = ('-x', '-n');  

var
	i:	integer;
	optionalParams:			integer;
	
begin
	optionalParams := GetNumberOfOptionalParams();
	if ((ParamCount - optionalParams) < 2) or (ParamCount > 4) then
		begin
		DisplayUsage;
		end
	else
		begin
		writeln('Input file: ',paramStr(1));
		writeln('Output file: ',paramStr(2));
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

