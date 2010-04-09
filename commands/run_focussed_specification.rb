require 'ruble'
require 'ruble/terminal'
require 'ruble/ui'
require 'ruble/editor'

command 'Run Single Example' do |cmd|
  cmd.key_binding = 'M1+M2+R'
  cmd.scope = 'source.ruby.rspec'
  cmd.output = :show_as_html
  cmd.input = :selection, :line
  cmd.invoke do |context| 

    line = start_line = ENV["TM_CARET_LINE_NUMBER"].to_i - 1

    if context.input =~ /^[\s]*it[\s]+["']/
      example_name = context.input.scan(/^\s*it\s+["'].*["']/).first.scan(/["'].*["']/).first
      Ruble::Terminal.open("spec #{ENV["TM_FILENAME"]} -e #{example_name}", ENV["TM_DIRECTORY"] )
    elsif Ruble::Editor.active.styled_text.line_count.to_i == 1
      Ruble::UI.alert(:info, '', "There are no examples to run.")
    else
      while (Ruble::Editor.active.styled_text.line(line).to_s =~ /^[\s]*it[\s]+["']/).nil?
        
        if line <= start_line
          line -= 1
        else
          line += 1
        end

        if line < 0
          line = start_line + 1
          break if Ruble::Editor.active.styled_text.line_count.to_i <= start_line + 1
        elsif line > Ruble::Editor.active.styled_text.line_count.to_i - 1
          break
        end        
      end
      
      if line >= Ruble::Editor.active.styled_text.line_count.to_i - 1
        Ruble::UI.alert(:info, '', "There are no examples to run")
      else
        example_name = Ruble::Editor.active.styled_text.line(line).scan(/^\s*it\s+["'].*["']/).first.scan(/["'].*["']/).first
        Ruble::Terminal.open("spec #{ENV["TM_FILENAME"]} -e #{example_name}", ENV["TM_DIRECTORY"] )
      end
    end
  end  
end
