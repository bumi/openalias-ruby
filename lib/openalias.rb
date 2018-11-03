require 'thermite/fiddle'
require 'ostruct'

class Openalias
  VERSION = "0.1.0"
  class CryptoAddress < OpenStruct;

    def method_missing(method_name, *args, &block)
      if symbol = method_name[/(.*)\?\z/, 1]
        self.cryptocurrency.to_s.downcase === symbol.to_s.downcase
      else
        super
      end
    end
  end

  toplevel_dir = File.dirname(File.dirname(__FILE__))
  Thermite::Fiddle.load_module('init_openalias_rust',
    cargo_project_path: toplevel_dir,
    ruby_project_path: toplevel_dir)

end
