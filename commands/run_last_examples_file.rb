require 'ruble'

command 'Run Last Examples file' do |cmd|
  cmd.key_binding = 'OPTION+COMMAND+r'
  cmd.scope = 'source.ruby'
  cmd.output = :show_as_html
  cmd.input = :none, :document
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/textmate-command-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
Spec::Mate::Runner.new.run_last_remembered_file STDOUT

RUBYEOF

${TM_RUBY:-ruby} /tmp/textmate-command-$$.rb; exit_status=$?; rm /tmp/textmate-command-$$.rb; exit $exit_status
EOF
end
