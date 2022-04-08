
class Item

    def valid_date?(date_str)
        if date_str[(0..3)].to_i >3000 || date_str[(0..3)].to_i < 0
            return false
        elsif date_str[(5..6)].to_i > 12 || date_str[(5..6)].to_i < 1
            return false
        elsif date_str[(8..9)].to_i > 31 || date_str[(8..9)].to_i < 1
            return false
        end
        true
    end

    attr_reader :title, :deadline, :item, :description
    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if self.valid_date?(deadline) == false
            raise "deadline is not properly formatted"
        end
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        if self.valid_date?(new_deadline) == false
            raise "deadline is not properly formatted"
        else 
            @deadline = new_deadline
        end
    end

    def description=(new_description)
        @description = new_description
    end

end
