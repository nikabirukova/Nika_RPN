# Функція для визначення пріоритету операторів
def precedence(operator)
    case operator
    when '+', '-'
      1
    when '*', '/'
      2
    else
      0
    end
  end
  

  def is_number?(char)
    char =~ /\d+/
  end
  

  def to_rpn(expression)
    result = []
    operator_stack = [] 
  
    expression.chars.each do |char|
      next if char == ' '
  
      if is_number?(char)
        result << char 
      elsif char == '('
        operator_stack << char 
      elsif char == ')'
        until operator_stack.empty? || operator_stack.last == '('
          result << operator_stack.pop
        end
        operator_stack.pop 
      else
        while !operator_stack.empty? && precedence(operator_stack.last) >= precedence(char)
          result << operator_stack.pop
        end
        operator_stack << char 
      end
    end
  
    until operator_stack.empty?
      result << operator_stack.pop
    end
  
    result.join(' ')
  end
  
  puts "Введіть математичний вираз:"
  input_expression = gets.chomp
  
  puts "RPN: #{to_rpn(input_expression)}"
  