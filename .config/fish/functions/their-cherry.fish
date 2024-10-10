function their-cherry --wraps='git cherry-pick -x --strategy=recursive -X theirs' --description 'alias their-cherry=git cherry-pick -x --strategy=recursive -X theirs'
  git cherry-pick -x --strategy=recursive -X theirs $argv
        
end
