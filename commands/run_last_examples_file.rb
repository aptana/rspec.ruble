require 'ruble'

command t(:run_last_examples_file) do |cmd|
  cmd.key_binding = 'OPTION+COMMAND+R'
  cmd.scope = 'source.ruby'
  cmd.output = :show_as_html
  cmd.input = :none, :document
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
   
    Spec::Mate::Runner.new.run_last_remembered_file STDOUT
  end
end
