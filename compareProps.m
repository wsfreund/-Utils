function out = compareProps(in1,in2)
%
% Compare if properties from classes have the same value.
%

% - Creation Date: Wed, 02 Oct 2013 
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 

  dimSize1 = size(in1);
  dimSize2 = size(in2);

  if ~isequal(dimSize1,dimSize2) && any(dimSize1~=1) && ...
      any(dimSize2~=1)
    Output.ERROR('NILM_CEPEL:Utils:compareProps:WrongInputs',...
      'Error using ==\nMatrix dimensions must agree.');
  end

  nIn1 = prod(dimSize1);
  nIn2 = prod(dimSize2);

  out = true(1,max(nIn1,nIn2));

  if nIn1>1 && nIn2>1
    for k=1:nIn1
      curIn1 = in1(k);
      curIn2 = in2(k);
      mIn1 = metaclass(curIn1);
      mIn2 = metaclass(curIn2);
      if ~strcmp(mIn1.Name,mIn2.Name)
        out(k) = false;
        continue;
      end
      props = {mIn1.PropertyList.Name};
      nProps = numel(props);
      if ~nProps
        out(k) = true;
        continue;
      end
      out(k) = true;
      for curPropIdx = 1:nProps
        curProp = props{curPropIdx};
        switch class(curIn1.(curProp))
        case 'function_handle' 
          if ~strcmp(func2str(curIn1.(curProp)),...
              func2str(curIn2.(curProp)))
            out(k) = false;
            continue;
          end
        case 'char'
          if ~strcmp(curIn1.(curProp),curIn2.(curProp))
            out(k) = false;
            continue;
          end
        otherwise
          try
            if numel(curIn1.(curProp))~=numel(curIn2.(curProp)) ...
                || ~all(curIn1.(curProp)==curIn2.(curProp))
              out(k) = false;
              continue;
            end
          catch
            if ~isequal(curIn1.(curProp),curIn2.(curProp))
              out(k) = false;
              continue;
            end
          end
        end
      end
    end
    out = reshape(out,dimSize1);
    return
  else
    if nIn1 == 1
      % Change in2 to the in1 position:
      dimSize1 = dimSize2;
      temp = in1;
      in1 = in2;
      in2 = temp;
      nIn1 = numel(in1);
    end
    curIn2 = in2;
    for k=1:nIn1
      curIn1 = in1(k);
      mIn1 = metaclass(curIn1);
      mIn2 = metaclass(curIn2);
      if ~strcmp(mIn1.Name,mIn2.Name)
        out(k) = false;
        continue;
      end
      props = {mIn1.PropertyList.Name};
      nProps = numel(props);
      if ~nProps
        out(k) = true;
        continue;
      end
      out(k) = true;
      for curPropIdx = 1:nProps
        curProp = props{curPropIdx};
        switch class(curIn1.(curProp))
        case 'function_handle' 
          if ~strcmp(func2str(curIn1.(curProp)),...
              func2str(curIn2.(curProp)))
            out(k) = false;
            continue;
          end
        case 'char'
          if ~strcmp(curIn1.(curProp),curIn2.(curProp))
            out(k) = false;
            continue;
          end
        otherwise
          try
            if numel(curIn1.(curProp))~=numel(curIn2.(curProp)) ...
                || ~all(curIn1.(curProp)==curIn2.(curProp))
              out(k) = false;
              continue;
            end
          catch
            if ~isequal(curIn1.(curProp),curIn2.(curProp))
              out(k) = false;
              continue;
            end
          end
        end
      end
    end
    out = reshape(out,dimSize1);
    return
  end

end

