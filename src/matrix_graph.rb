class MatrixGraph < Graph
	attr_accessor :matrix, :numbering

	def initialize(size)
		@numbering = Numbering.new
		@matrix = Matrix.empty(size, size)
	end

	def size
		matrix.row_size()
	end

	def add_node(node)
		if numbering.add_element(s)
			n = size
			matrix.set
		end
	end

	def arc_exists(origin_node, end_node)
		puts 'TODO: implement Graph.arcExists(' + origin_node + ', ' + end_node + ')'
	end

	def add_arc(origin_node, end_node, value)
		puts 'TODO: implement Graph.addArc(' + origin_node + ', ' + end_node + ', ' + value + ')'
	end

	def remove_arc(origin_node, end_node)
		puts 'TODO: implement Graph.removeArc(' + origin_node + ', ' + end_node + ')'
	end

	def arc_value(origin_node, end_node)
		puts 'TODO: implement Graph.arcValue(' + origin_node + ', ' + end_node + ')'
	end
end
