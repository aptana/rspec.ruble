require 'ruble'

command 'Run Examples in selected files/directories' do |cmd|
  cmd.key_binding = 'OPTION+COMMAND+r'
  cmd.scope = 'source.ruby.rspec'
  cmd.output = :show_as_html
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/textmate-command-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
Spec::Mate::Runner.new.run_files STDOUT

RUBYEOF

${TM_RUBY:-ruby} /tmp/textmate-command-$$.rb; exit_status=$?; rm /tmp/textmate-command-$$.rb; exit $exit_status

EOF
end
