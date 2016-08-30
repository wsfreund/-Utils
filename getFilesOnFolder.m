function [files_abs,fixedFolder] = getFilesOnFolder(inputFolder,...
  searchStr,fileExt)
%
%   Returns the absolute path from files with extension searchStr
%   onfolder, and the folder fixedPath.  Verbose to display file
%   paths.
%
% [files_abs,fixedFolder] = % getFilesOnFolder(inputFolder,...
%   searchStr)
%

% - Creation Date: Thu, 05 Sep 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com> 


narginchk(0,3)
if nargin < 3
  fileExt = '';
  if nargin < 2
    searchStr = '';
    if nargin < 1
      inputFolder = pwd;
    end
  end
end

fixedFolder = Utils.fixPath(inputFolder);

files = dir([fixedFolder searchStr]);
files = {files.name}; % Cell of file names

if ~isempty(fileExt)
  if ~strfind(fileExt,'.')
    fileExt = ['.' fileExt];
  end
  nFiles = numel(files);
  ext = cell(1,nFiles);
  for k = 1:nFiles
    [~,~,ext{k}]=fileparts(files{k});
  end
  files = files(strcmp(lower(ext),lower(fileExt)));
end

files = strcat(fixedFolder,files); % Cell of file relative path
tmp_files = cell(1,numel(files));
files_abs = cell(1,numel(files));
for k=1:numel(files)
  if isjava('awt')
    tmp_file = java.io.File([files{k}]);
    files_abs{k} = char(tmp_file.getCanonicalPath());
  else
    [path,cFile,cExt] = fileparts([files{k}]);
    if ~isempty(path)
      path = cd(cd(path));
    else
      path = pwd;
    end
    files_abs{k} = [path,filesep,cFile,cExt];
  end
end

% Print files:
filesOnFolder = numel(files_abs);
if filesOnFolder
  Output.VERBOSE(['Found %d files on folder ''%s''. They are'...
    ' the following:\n'],filesOnFolder,fixedFolder);
  for m=1:filesOnFolder
    Output.VERBOSE('\t[%d]:%s\n',m,files_abs{m});
  end
else
  if exist(fixedFolder,'dir')
    Output.DEBUG(['Found no files on folder ''%s'' with specified'...
      ' extension: %s.\n'],fixedFolder,searchStr);
  else
    Output.WARNING('NILM_CEPEL:getFilesOnFolder:FolderDontExist',...
      'Folder requested (%s) does not exists.\n',fixedFolder);
  end
end
end
