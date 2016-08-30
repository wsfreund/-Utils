function [str,changed] = getUnique(str,fType,pattern)
%
% [str,changed] = getUnique(str,fType,pattern)
%
%   ------------------- Inputs --------------------
%
% -> str (string): the string to get unique label.
%
% -> fType <'file'> (string): the type of the string to find unique
% label.
%
% -> pattern <''> (string): the pattern to add to the unique
% generation name.
%

% - Creation Date: Tue, 08 Oct 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  if nargin < 3
    pattern = '';
    if nargin < 2
      fType = 'file';
    end
  end

  if ~isempty(pattern) && pattern(1) ~= '_'
    pattern = ['_' pattern];
  end

  changed = false;

  if isempty(str)
    Output.WARNING('Utils:getUnique:EmptyPattern',...
      'The input pattern is empty.');
    return
  end

  if str(end) == filesep
    str = str(1:end-1);
  end

  addToIndex = numel(pattern);

  while(true)
    if exist(str,fType)
      changed = true;
      extSize = 0;
      if strcmp(fType,'file')
        [path,tmpFile,ext] = fileparts(str);
        str = [path filesep tmpFile];
        extSize = numel(ext);
      end
      idx=regexp(str,[pattern '\d+\>']);
      % Change it so that the next str will have the number increased by
      % one.
      if (idx)
        strnumber = str(idx+addToIndex:end);
        number = str2double(strnumber);
        str = [str(1:idx+addToIndex-1) num2str(number+1)];
      else % If str ends with no number, add _Run%d
        str = [str pattern '2'];
      end
      if strcmp(fType,'file')
        str = [str ext];
      end
    else
      break
    end
  end

end

