function varargout = dealArray(in)
%
% Transform an input array into multiple scalar output
%

% - Creation Date: Thu, 17 Oct 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

nIn = numel(in);
if mod(nargout,nIn)
  error('Utils:dealArray:narginNargoutMismatch',...
    ['The number of outputs should match a multiple '...
    ' from the number of elements on the input array.']);
end
varargout = cell(1,nargout);
nTimes = nargout/nIn;
for k = 1:nTimes
  for m = 1:nIn
    varargout{(k-1)*nIn+m} = in(m);
  end
end

end

