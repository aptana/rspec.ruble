require 'ruble'

command t(:save_example_file_and_remember) do |cmd|
  cmd.scope = 'source.ruby.rspec'
  cmd.trigger = :execution_listener, "org.eclipse.ui.file.save" # fires for save events only
  cmd.output = :none
  cmd.input = :none
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
    Spec::Mate::Runner.new.save_as_last_remembered_file ENV['TM_FILEPATH']
  end
  
end
