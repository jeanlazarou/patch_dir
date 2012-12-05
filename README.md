patch_dir
=========

Copy all the changed files in a "patch" a directory (with the same directory structure). Retrieve the changed files list from a text file or from the git status.

Requirement
---------

Ruby script requires ruby runtime to run (tested only with Ruby 1.9.3).

Usage
---------

    ruby generate_patch_dir.rb (git|input-file) output-dir
    
      Copy all the files read from the first agument (input-file) to
      the given output directory (output-dir). Create the same
      directory structure.
    
      Alternatively checks git status (using: git status -s) to
      to find the files to copy
    
      Examples:
         ruby ~/generate_patch_dir.rb /tmp/patch.txt ~/patch/
         ruby ~/generate_patch_dir.rb git ~/patch/
