#!/usr/bin/env ruby

require 'json'
require 'yaml'
require 'pry'
require 'colorize'


TERMS = { "Puppet Master" => "Puppet Server",
          "master" => 'main',
          "Master" => 'Main',
          "MASTER" => "MAIN",
          "Blacklist" => "Blocklist",
          "blacklist" => "blocklist",
          "BLACKLIST" => "BLOCKLIST",
          "whitelist" => "allowlist",
          "Whitelist" => "Allowlist",
          "WHITELIST" => "ALLOWLIST",
          "Slave" => "Agent",
          "slave" => "agent",
          "SLAVE" => "AGENT",
         }

def files_need_changes(string_name)
  list_of_all_filenames= Dir.glob("**/**/*")
  list_of_all_filenames << '.github/workflows/release.yml'
  list_of_all_filenames << '.github/workflows/weekly.yml'


   for file_name in list_of_all_filenames

     if File.file?(file_name)
       if File.readlines(file_name).grep(/#{string_name}/).size > 0;
         key_val = TERMS[string_name]
         text = File.read(file_name) unless file_name=='replace_main_with_main.rb'
         new_contents = text.to_s.gsub(string_name, key_val)
         File.open(file_name, "w") {|file| file.puts new_contents } unless file_name=='update_terminology.rb'
       end
     end
   end
 end

for i in TERMS.keys
  files_need_changes(i)
end

puts "Finished"
