require 'ruble'
require 'ruble/terminal'

command 'Run Examples' do |cmd|
  cmd.key_binding = 'M1+R'
  cmd.scope = 'source.ruby.rspec'
  cmd.input = :document, :document
  cmd.invoke {|context| Ruble::Terminal.open("spec #{ENV["TM_FILENAME"]}", ENV["TM_DIRECTORY"]) }
end
