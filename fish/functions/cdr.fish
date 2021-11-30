function cdr -d "cd to the top level directory of the Git repository"
  cd (git rev-parse --show-toplevel)
end
