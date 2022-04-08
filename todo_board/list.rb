require "byebug"
require_relative "./item.rb"

class List

    attr_reader :label
    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = "")
        return true if @items << Item.new(title, deadline, description)
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index >= 0 && self.size > index
            return true
        else 
            return false
        end
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) == true && self.valid_index?(index_2) == true
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else 
            return false
        end
    end

    def [](index)
        if @items[index] == @items.any?
            return @items[index]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts @label
        @items.each_with_index do |item, index|
            puts index.to_s + "  " + item.title + "   " + item.deadline
        end
    end

    def print_full_item(index)
        if self.valid_index?(index) == true
            puts @items[index].title + "   " + @items[index].deadline + "   " + @items[index].description
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        if index == 0 || self.valid_index?(index) == false
            return false
        else
            while amount > 0
            @items[index - 1], @items[index] = @items[index], @items[index - 1]
            index = index - 1
            return true
            end
        end
    end

    def down(index, amount = 1)
        if index == self.size - 1 || self.valid_index?(index) == false
            return false
        else
            while amount > 0
            @items[index], @items[index + 1] = @items[index + 1], @items[index]
            index = index + 1
            return true
            end
        end
    end


end