Program Tabify (input, output);

Procedure DisplayUsage;
begin
    writeln('Invalid command...');
end;

Procedure ReplaceSpacesWithTabs(inputFile:string; outputFile:string; spacesPerTab:integer);
begin
    writeln('RepplaceSpacesWithTabs...');
end;

Procedure ReplaceTabsWithSpaces(inputFile:string; outputFile:string; spacesPerTab:integer);
begin
    writeln('RepplaceSpacesWithTabs...');
end;

{ 
	-x 		convert tabs to spaces
	-n=### 	number of spaces per tab (4 by default)
	
}
var
    errorPosition: integer;
	i:	integer;
	inputFile:	string(100);
	pIndex: integer;
	offset: integer;
	outputFile: string(100);
	ReplaceSpaces: boolean;
	spacesPerTab: integer;
	
begin
	pIndex := 0;
	spacesPerTab := 4;
	inputFile := "";
	outputFile := "";
		
	if (ParamCount < 2) or (ParamCount > 4) then
		begin
		DisplayUsage;
		end
	else
		begin
    	for i := 1 to ParamCount do
			begin
			if (substr(ParamStr(i),1,2) = '-n') then
			    begin
			    writeln('Spaces per tab...');
	    	    offset := index(ParamStr(i), '=') + 1;
			    Val(substr(ParamStr(i), offset), spacesPerTab, errorPosition);
			    writeln('Spaces per tab = ', spacesPerTab);
			    end
			else if (substr(ParamStr(i),1,2) = '-x') then
			    begin
			    writeln('Replace tabs with spaces...');
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

	if (ReplaceSpaces) then
		begin
		ReplaceSpacesWithTabs(inputFile, outputFile, spacesPerTab);
		end
	else
		begin
		ReplaceTabsWithSpaces(inputFile, outputFile, spacesPerTab);
		end;				
end.

