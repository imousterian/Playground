class Stack

    attr_accessor :first

    def initialize
        @first = Node.new
        @len = 0
    end

    def push(item)
        oldfirst = @first
        @first = Node.new
        @first.item = item
        @first.next = oldfirst
        @len += 1
    end

    def peek
        return @first.item
    end

    def pop
        item = @first.item
        @first = @first.next
        @len -= 1
        item
    end

    def empty?
        return @len == 0
    end

    def len
        return @len
    end

    class Node
        attr_accessor :item, :next

        def initialize
            @item = nil
            @next = nil
        end
    end
end

def calculate(str)

    values = Stack.new
    operators = Stack.new

    str.split(" ").each do |i|
        if i == '('
            # just skip
        elsif i == '+'
            operators.push(i)
        elsif i == '-'
            operators.push(i)
        elsif i == '*'
            operators.push(i)
        elsif i == '/'
            operators.push(i)
        elsif i == 'sqrt'
            operators.push(i)
        elsif i == ')'
            operator = operators.pop
            value = values.pop
            if operator == '+'
                value = values.pop + value
            elsif operator == '-'
                value = values.pop - value
            elsif operator == '*'
                value = values.pop * value
            elsif operator == '/'
                value = values.pop / value
            elsif operator == 'sqrt'
                value = Math.sqrt(value)
            end
            values.push(value)
        else
            values.push(i.to_f)
        end
    end
    values.pop
end

str = "( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )"
puts calculate(str)
str2 = "( ( 1 + sqrt ( 5.0 ) ) / 2.0 )"
puts calculate(str2)
