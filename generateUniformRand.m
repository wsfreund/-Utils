function out = generateUniformRand(nLines,nColumns,varargin)
%
% Generate nLines x nColumns uniform random number between the lower
% and upper bounderies.
%
%   generateUniformRand(nLines,nColumns,bounderies): The lower and
%   upper boundery is given in an array.
%
%   generateUniformRand(nLines,nColumns,lb,ub): The lower and upper
%   boundery is given as arguments.
%

% - Creation Date: Tue, 15 Oct 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  switch numel(varargin)
  case 1
    s = size(varargin{1});
    msk = s==2;
    if msk(2)
      lb = varargin{1}(:,1);
      ub = varargin{1}(:,2);
    else
      lb = varargin{1}(1,:);
      ub = varargin{1}(2,:);
    end
  case 2
    lb = varargin{1};
    ub = varargin{2};
  otherwise 
    Output.ERROR('Utils:generateUniformRand:WrongInputs',...
      'Could not determine lower boundery/upper boundery.');
  end


  lbScalar = isscalar(lb);
  ubScalar = isscalar(ub);

  dim = [nLines nColumns];

  if ~lbScalar && ~ubScalar
    lbRep = dim;
    lbRep(size(lb)~=1) = 1;
    lb = repmat(lb,lbRep);
    ubRep = dim;
    ubRep(size(ub)~=1) = 1;
    ub = repmat(ub,ubRep);

    out = lb + (ub-lb).*rand(nLines,nColumns);
  elseif ~lbScalar
    lbRep = dim;
    lbRep(size(lb)~=1) = 1;
    lb = repmat(lb,lbRep);
    out = lb + (ub-lb).*rand(nLines,nColumns);
  elseif ~ubScalar
    ubRep = dim;
    ubRep(size(ub)~=1) = 1;
    ub = repmat(ub,ubRep);
    out = lb + (ub-lb).*rand(nLines,nColumns);
  else
    out = lb + (ub-lb).*rand(nLines,nColumns);
  end

end

