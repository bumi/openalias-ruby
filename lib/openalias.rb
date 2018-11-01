require 'thermite/fiddle'
require 'ostruct'

class Openalias
  VERSION = "0.1.0"
  class CryptoAddress < OpenStruct; end

  toplevel_dir = File.dirname(File.dirname(__FILE__))
  Thermite::Fiddle.load_module('init_openalias_rust',
    cargo_project_path: toplevel_dir,
    ruby_project_path: toplevel_dir)

end
