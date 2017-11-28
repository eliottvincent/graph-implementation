class Node
	attr_accessor :name, :marked

	def initialize(name, marked = nil)
		@name = name
		@marked = marked.nil? ? false : marked
	end
end
