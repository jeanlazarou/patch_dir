require 'stringio'
require 'fileutils'

def fail msg
  
  $stderr.puts msg
  $stderr.puts 
  
  $stderr.puts "Usage: ruby #{File.basename($0)} (git|input-file) output-dir"
  $stderr.puts 
  $stderr.puts "  Copy all the files read from the first agument (input-file) to"
  $stderr.puts "  the given output directory (output-dir). Create the same"
  $stderr.puts "  directory structure."
  $stderr.puts 
  $stderr.puts "  Alternatively checks git status (using: git status -s) to"
  $stderr.puts "  to find the files to copy"
  $stderr.puts 
  $stderr.puts "  Examples:"
  $stderr.puts "     ruby ~/generate_patch_dir.rb /tmp/patch.txt ~/patch/"
  $stderr.puts "     ruby ~/generate_patch_dir.rb git ~/patch/"
  
  exit 1
  
end

fail 'Too much arguments' if ARGV.size > 2
fail 'Missing arguments' if ARGV.size < 2
fail "Invalid output dir #{ARGV[1]}" unless File.directory?(ARGV[1])

if ARGV[0] == 'git'
  
  res = `git status -s`
  
  list = ''
  
  res.each_line {|line| list << line[3..-1] }
  
  input = StringIO.new(list)
  
else
  
  fail "Invalid input file #{ARGV[0]}" unless File.file?(ARGV[0])
  
  input = open(ARGV[0])
  
end

input.each do |line|
  
  src = line.chomp
  
  dest = File.join(ARGV[1], src)
  
  puts "copy #{src} to #{dest}"

  FileUtils.makedirs File.dirname(dest)
  FileUtils.copy src, dest
  
end