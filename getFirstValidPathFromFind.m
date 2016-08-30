function  data_place = getFirstValidPathFromFind(...
  search_string,search_base)
%
% data_place = getFirstValidPathFromFind(search_string,search_base)
% 
%   Get the first valid place from a find result on 'search_base',
% searching for string 'search_string'.
%

% - Creation Date: Wed, 06 Aug 2014
% - Last Modified: Wed, 06 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  if  nargin < 2 || isempty(search_base)
    search_base = '~';
  end

  [result,data_place]=system(['find ' search_base ...
    ' -name "' search_string '" -print -quit']);

  if result
    Output.ERROR('NILM_CEPEL:Utils:getFirstValidPathFromFind',...
      ['Could not determing path for ' data_place ' on'...
      ' local disk']);
  end

  data_place = strsplit(data_place,'\n');

  if iscell(data_place)
    % Find from all data_place, the correct one:
    for k=1:numel(data_place)
      if isempty(strfind(data_place{k},'Permission denied'))
        data_place = data_place{k};
        break;
      end
    end
  end

end

