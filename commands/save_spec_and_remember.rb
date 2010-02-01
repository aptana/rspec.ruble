require 'ruble'

command 'Save Example file and remember' do |cmd|
  cmd.key_binding = 'M1+S'
  cmd.scope = 'source.ruby.rspec'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/textmate-command-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
# Remembers the last _spec.rb file so that 'Run last spec' command 
# can be activated from any Ruby source file

Spec::Mate::Runner.new.save_as_last_remembered_file ENV['TM_FILEPATH']

RUBYEOF

${TM_RUBY:-ruby} /tmp/textmate-command-$$.rb; exit_status=$?; rm /tmp/textmate-command-$$.rb; exit $exit_status


EOF
end
