Program Tabify (input, output);

Procedure DisplayUsage;
begin
    writeln('Invalid command...');
end;
                    
Procedure ReplaceSpacesWithTabs(inputFileName:string; outputFileName:string; spacesPerTab:integer);
var
	b: BindingType;
	count:	integer;
	currentChar:	char;
	i: integer;
	idx: integer;
	inFile: Text;
	line: string(255);
	newChar: char;
	newLine: string(255);
	previousChar:	char;
	
begin
    writeln('ReplaceSpacesWithTabs...', inputFileName);
    Unbind (inFile);
    b := Binding (infile);	
    b.Name := inputFileName;
    bind(inFile,b);
    b := Binding (infile);
    writeln('File exists: ',b.Existing);
    if not b.Existing then
    	WriteLn ('File not bound -- try again.')
    else
    	begin	
		assign(inFile, inputFileName);
		reset(inFile);
		while not(EOF(inFile)) do
			begin
			readln(inFile, line);
			count := 1;
			previousChar := line[1];
			i := 1;
			while (i <= Length(line)) do
				begin
				currentChar := line[i];
				newChar := currentChar;
				if (currentChar = previousChar) and (ord(currentChar) = 32) then
					begin
					count := count + 1;
					if (count = 4) then
						begin
						newChar := chr(65);
						count := 1;
						end;
					{ write('Consecutive spaces: ',count);}
					end
				else if ord(currentChar) > 32 then
					begin
					count := 1;
					end;
				write(newChar);
				previousChar := currentChar;
				i := i + 1;
				end;
			writeln;
			end;
		close(inFile);
    	end;
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
	ReplaceSpaces := false;
		
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
			    ReplaceSpaces := true;
			    end
			else if (pIndex = 0) then
				begin
				writeln('Input file: ',ParamStr(i));
				inputFile := ParamStr(i);
				pIndex := 1;
				end
			else if (pIndex = 1) then
				begin
				writeln('Output file: ',ParamStr(i));
				outputFile := ParamStr(i);
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

