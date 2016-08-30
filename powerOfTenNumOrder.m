function power=powerOfTenNumOrder(num,useSqrt10ToRaisePower)
%
% power=powerOfTenNumOrder(num,useSqrt10ToRaisePower)
%
%   Returns the power of ten order from the absolute value of the
% number num. If useSqrt10ToRaisePower set to true (default), then
% number is increased by one order if greater than sqrt(10).
%

  if nargin < 2
    useSqrt10ToRaisePower = true;
  else
    useSqrt10ToRaisePower = false;
  end

% - Creation Date: Thu, 17 Oct 2013
% - Last Modified: Tue, 02 Aug 2016
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  power = floor(log10(abs(num)));

  if useSqrt10ToRaisePower && abs(num)>10^power*sqrt(10)
    power = power + 1;
  end

end

