class Arc
	attr_accessor :origin, :destination, :value

	def initialize(origin, destination, value = nil)
		@origin = origin
		@destination = destination
		@value = value
	end

end
