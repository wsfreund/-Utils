function thePath = fixPath(thePath)
%
% Fix thePath to contain the simpliest absolute path to file:
%
%   thePath = fixPath(thePath)
%

% - Creation Date: Thu, 05 Sep 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 


if (strcmp(thePath,''))
  thePath = pwd;
end

% Fix thePath:
if thePath(end)~= filesep; thePath = [thePath filesep]; end;

if(strcmp(thePath(1:2),['.' filesep]))
  thePath = [pwd filesep thePath(3:end)];
end

home_folder_idx = strfind(thePath,'~/');

if ~isempty(home_folder_idx)
  if isunix
    userDir = char(java.lang.System.getProperty('user.home'));
    thePath(home_folder_idx:home_folder_idx+1) = [];
    thePath = [userDir filesep thePath];
  end
end

if ~isempty(strfind(thePath,'..'))
  if (strcmp(thePath(1:2),'..'))
    thePath = [pwd filesep thePath];
  end
  C = textscan(thePath,'%s','delimiter',filesep);
  C = C{1};
  indexC = strfind(C,'..');
  index = find(not(cellfun('isempty', indexC)));
  C([index index-1]) = []; % Remove .. and folders before
  thePath = cell2mat(cellfun(@(in) {[in filesep]},C'));
end

if isunix
  if ~strcmp(thePath(1),'/')
    thePath = [pwd filesep thePath];
  end
elseif ispc
  if ~regexp(thePath(1:3),'.%:\')
    thePath = [pwd filesep thePath];
  end
end

end
