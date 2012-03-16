require 'ruble'

command t(:run_examples) do |cmd|
  cmd.key_binding = 'M1+R'
  cmd.scope = 'source.ruby.rspec'
  cmd.input = :document, :document
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/lib/spec/mate"
   
    Spec::Mate::Runner.new.run_file STDOUT
  end
end
