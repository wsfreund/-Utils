function out = expandCell(in)
%
% Expand cell inputs into a great continuous array with its contents.
% 
% If outputs are not concatenable, it will return a cell array with
% as far as it could expand the cell values.
%

% - Creation Date: Thu, 05 Sep 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  out = in;
  while true
    try
      out = [out{:}];
      if ~iscell(out) || isequal([out{:}],out)   
        break;
      end
    catch 
      break;
    end
  end
end
