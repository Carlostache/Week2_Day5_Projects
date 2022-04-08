require "passenger"

class Flight

    attr_reader :passengers, :flight_number
    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        else   
            return false
        end
    end

    def board_passenger(passenger)
        if self.full? == false && passenger.has_flight?(flight_number) == true
            @passengers << passenger
        end
    end

    def list_passengers
        passenger_names = []
        @passengers.each do |passenger|
            passenger_names << passenger.name
        end
        passenger_names
    end

    def [](index)
        return @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end