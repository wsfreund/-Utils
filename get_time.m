function out=get_time(days)
%
% Display time elapsed.
%
%   string_output=get_time(days)
%
% Input time in days
%

% - Creation Date: Thu, 05 Sep 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 


  negative = false;
  if days<0
    negative = true;
    days=abs(days);
  end

  [y, m, d, h, mn, s] = datevec(days);
  out = '';
  if(rem(s,1))
    out = [sprintf(' %03.f ms',rem(s,1)*1000) out];
  end
  if(s)>1
    out = [sprintf(' %02.f s',s) out];
  end
  if(mn)
    out = [sprintf(' %02.f min',mn) out];
  end
  if(h)
    out = [sprintf(' %02.f hour(s)',h) out];
  end
  if(d)
    out = [sprintf(' %2.f day(s)',d) out];
  end
  if(m-1>0)
    out = [sprintf(' %2.f month(s)',m-1) out];
  end
  if(y)
    out = [sprintf(' %.f year(s)',y) out];
  end
  % Remove first space:
  out = out(2:end);
  if negative
    out = [out ' to the past'];
  end
end
