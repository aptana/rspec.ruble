require 'ruble'

command t(:run_examples_in_selected_files) do |cmd|
  cmd.key_binding = 'OPTION+COMMAND+R'
  cmd.scope = 'source.ruby.rspec'
  cmd.output = :show_as_html
  cmd.input = :none
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
   
    Spec::Mate::Runner.new.run_files STDOUT
  end
end
