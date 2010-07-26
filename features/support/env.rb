cuk_dir_name = File.dirname(__FILE__)
lib_path = File.join(cuk_dir_name, "/../../lib")

$LOAD_PATH << lib_path unless $LOAD_PATH.include?(lib_path)

require 'gol'