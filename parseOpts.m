function opts = parseOpts(varargin)
%
% Return options parsed as a struct.
%

% - Creation Date: Tue, 01 Oct 2013 
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  if numel(varargin)>1
    cellVars = find(cellfun(@iscell,varargin));
    nCellVars = numel(cellVars);
    for curCellIdx = 1:nCellVars
      varargin(cellVars(curCellIdx)) = {varargin(...
        cellVars(curCellIdx))};
    end
    opts = struct(varargin{:});
  elseif numel(varargin) && isa(varargin{1},'struct')
    opts = varargin{1};
  elseif ~numel(varargin)
    opts = struct;
  else
    Output.ERROR('NILM_CEPEL:Utils:parseOpts:WrongInputs',...
      'Input must be specified as a pair of values or a struct');
  end

end

