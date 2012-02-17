require 'tmpdir'
require 'ruble/terminal'
require 'rbconfig'

module Spec
  module Mate
    class Runner
      if RbConfig::CONFIG['target_os'] =~ /(win|w)32$/
        SPEC_BIN = "rspec"
      else  
        SPEC_BIN = %x{which rspec}.chomp
      end
      
      def run_files(stdout, options={})
        files = ENV['TM_SELECTED_FILES'].scan(/'(.*?)'/).flatten.map do |path|
          "\"" + File.expand_path(path) + "\" "
        end
        
        options.merge!({:files => files, :multiple => true})
        run(stdout, options)
      end

      def run_file(stdout, options={})
        options.merge!({:files => [single_file]})
        run(stdout, options)
      end
      
      def run_last_remembered_file(stdout, options={})
        options.merge!({:files => [last_remembered_single_file]})
        run(stdout, options)
      end

      def run_focussed(stdout, options={})
        options.merge!({:files => [single_file], :line => ENV['TM_LINE_NUMBER']})
        run(stdout, options)
      end

      def run(stdout, options)
        argv = options[:files].dup
        if options[:line]
          lines = "--line #{options[:line]}"
        elsif options[:multiple]
          Ruble::Terminal.open("#{SPEC_BIN} #{argv}", project_directory)
          return
        end
        argv += (" " + ENV['TM_RSPEC_OPTS'].split(" ")) if ENV['TM_RSPEC_OPTS']
        Ruble::Terminal.open("#{SPEC_BIN} \"#{argv}\" #{lines if lines}", project_directory) 
      end
      
      def save_as_last_remembered_file(file)
        File.open(last_remembered_file_cache, "w") do |f|
          f << file
        end
      end

      def last_remembered_file_cache
        Dir.tmpdir + "/textmate_rspec_last_remembered_file_cache.txt"
      end
      
      protected
      def single_file
        File.expand_path(ENV['TM_FILEPATH'])
      end

      def last_remembered_single_file
        file = File.read(last_remembered_file_cache).strip
        File.expand_path(file) if file.size > 0
      end
      
      def project_directory
        File.expand_path(ENV['TM_PROJECT_DIRECTORY']) rescue File.dirname(single_file)
      end
    end
  end
end
