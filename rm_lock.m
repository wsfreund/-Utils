function rm_lock(lockFile)
  %disp(['Removing ', lockFile])
  delete(lockFile)
end
