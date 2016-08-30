function out = cmd_questdlg(question,defaultValue)
%
% Create question dialog on command window.
%

% - Creation Date: Tue, 01 Oct 2013 
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 


  out=input(question,'s');
  if nargin>1 &&isempty(out)
    out=defaultValue;
  end

end

