require 'ruble'

command 'Run Examples' do |cmd|
  cmd.key_binding = 'M1+R'
  cmd.scope = 'source.ruby.rspec'
  cmd.output = :show_as_html
  cmd.input = :document, :document
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/textmate-command-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
Spec::Mate::Runner.new.run_file STDOUT

RUBYEOF

${TM_RUBY:-ruby} /tmp/textmate-command-$$.rb; exit_status=$?; rm /tmp/textmate-command-$$.rb; exit $exit_status
EOF
end
