require 'ruble'

command t(:alternate_file) do |cmd|
  cmd.key_binding = 'CONTROL+M2+ARROW_DOWN'
  cmd.scope = 'source.ruby, text.html.ruby'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate/switch_command"
 
    Spec::Mate::SwitchCommand.new.go_to_twin(ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'])
  end
end
