require 'ruble'

command 'Alternate File' do |cmd|
  cmd.key_binding = 'CONTROL+M2+ARROW_DOWN'
  cmd.scope = 'source.ruby, text.html.ruby'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/textmate-command-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate/switch_command"
Spec::Mate::SwitchCommand.new.go_to_twin(ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'])

RUBYEOF

${TM_RUBY:-ruby} /tmp/textmate-command-$$.rb; exit_status=$?; rm /tmp/textmate-command-$$.rb; exit $exit_status
EOF
end
