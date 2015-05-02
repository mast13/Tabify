Program Tabify (input, output);

Procedure DisplayUsage;
begin
    writeln('Invalid command...');
end;
{
If the current line has more than 2 consecutive spaces and the last space is in a 
column that is a multiple of spacesPerTab, then replace those spaces with a tab
character.
}                    
Procedure ReplaceSpacesWithTabs(inputFileName:string; outputFileName:string; spacesPerTab:integer);
var
	b: BindingType;
	consecutiveSpaces: boolean;
	i: integer;
	idx: integer;
	inFile: Text;
	lastCharacterIdx: integer;
	line: string(255);
	newWord: string(255);
	word: string(255);
	
	
begin
    writeln('ReplaceSpacesWithTabs...', inputFileName);
    Unbind (inFile);
    b := Binding (infile);	
    b.Name := inputFileName;
    bind(inFile,b);
    b := Binding (infile);
    writeln('File exists: ',b.Existing);
    if not b.Existing then
    	WriteLn ('File not found -- try again.')
    else
    	begin	
		assign(inFile, inputFileName);
		reset(inFile);
		while not(EOF(inFile)) do
			begin
			readln(inFile, line);
			idx := spacesPerTab;
			while (idx <= Length(line)) do
				begin
				word := substr(line, idx - spacesPerTab + 1, spacesPerTab);
				newWord := word;
				if (ord(word[spacesPerTab]) =  32) then
					begin
					consecutiveSpaces := false;
					i := spacesPerTab - 1;
					while (i >= 1) and (ord(word[i]) = 32) do
						begin
						i := i - 1;
						consecutiveSpaces := true;
						end;
					if consecutiveSpaces then
						begin	
						//newWord := substr(word, 1, i) + '^';	 
						newWord := substr(word, 1, i) + #9;
						end;
					end;
				idx := idx + spacesPerTab;
				write(newWord);
				end;
			idx := idx - spacesPerTab;
			word := substr(line, idx+1, Length(line) - idx); 
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

