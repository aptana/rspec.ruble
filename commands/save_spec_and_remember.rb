require 'ruble'

command 'Save Example file and remember' do |cmd|
  cmd.key_binding = 'M1+S'
  cmd.scope = 'source.ruby.rspec'
  cmd.output = :none
  cmd.input = :none
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
    
    Spec::Mate::Runner.new.save_as_last_remembered_file ENV['TM_FILEPATH']
  end
  
end
