require './graph'
require './numbering'

class MatrixGraph < Graph
	attr_accessor :matrix, :numbering

	def initialize(size)
		@numbering = Numbering.new			# numbering represents
		@matrix = Matrix.zero(size)			# matrix represents the adjacency matrix of the graph
	end

	def size
		matrix.row_size
	end

	#  ███╗   ██╗ ██████╗ ██████╗ ███████╗
	#  ████╗  ██║██╔═══██╗██╔══██╗██╔════╝
	#  ██╔██╗ ██║██║   ██║██║  ██║█████╗
	#  ██║╚██╗██║██║   ██║██║  ██║██╔══╝
	#  ██║ ╚████║╚██████╔╝██████╔╝███████╗
	#  ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝

	def add_node(node)
		if numbering.add_element(node)
			arcs = Set.new
			matrix.increase_size
		end
	end

	def node_exist_private(node)

	end


	#   █████╗ ██████╗  ██████╗
	#  ██╔══██╗██╔══██╗██╔════╝
	#  ███████║██████╔╝██║
	#  ██╔══██║██╔══██╗██║
	#  ██║  ██║██║  ██║╚██████╗
	#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

	def arc_exists(origin, destination)
		oi = numbering.number(origin)
		di = numbering.number(destination)
		matrix[oi, di] == 0	# check if the matrix contains a value at (si, di) coordinates, and returns true if so. return false if nil
	end

	def arc_exists_private(origin_index, destination_index)
		matrix[origin_index, destination_index] == 0	# check if the matrix contains a value at (si, di) coordinates, and returns true if so. return false if nil
	end

	def add_arc(origin, destination, value)
		if (node)
			add_node(origin)
			add_node(destination)
			oi = numbering.number(origin)
			di = numbering.number(destination)
			matrix[oi, di] = value
		end
	end

	def add_arc_private(origin_index, destination_index, value)
		origin_node = numbering.element_at(origin_index)
		destination_node = numbering.element_at(destination_index)
		add_node(origin_node)
		add_node(destination_node)

		matrix[origin_index, destination_index] = value
	end

	def remove_arc(origin, destination)
		oi = numbering.number(origin)
		di = numbering.number(destination)
		matrix[oi, di] = 0
	end

	def arc_value(origin, destination)
		oi = numbering.number(origin)
		di = numbering.number(destination)
		matrix[oi, di]
	end

	def edit_value(origin, destination, value)
		if arc_exists(origin, destination)	# allowing to edit only if there is an arc
			oi = numbering.number(origin)
			di = numbering.number(destination)
			matrix[oi, di] = value
		end
	end

	def neighbors(node)
		neighbors = Set.new
		ni = numbering.number(node)
		for i in 0..size
			if arc_exists_private(ni, i)
				neighbors.add(matrix[ni, i])
			end
		end
		neighbors
	end



	#  ██╗   ██╗████████╗██╗██╗     ███████╗
	#  ██║   ██║╚══██╔══╝██║██║     ██╔════╝
	#  ██║   ██║   ██║   ██║██║     ███████╗
	#  ██║   ██║   ██║   ██║██║     ╚════██║
	#  ╚██████╔╝   ██║   ██║███████╗███████║
	#   ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝

	def copy
		n = size
		g = MatrixGraph.new(n)
		for i in 0..n
			g.add_node(numbering.element_at(i))
		end
		for i in 0..n
			for j in 0..n
				if arc_exists_private(i, j)
					g.add_arc_private(i, j, arc_value(i, j))
				end
			end
		end
		g
	end

	def see
		puts matrix.dump
	end

	private :arc_exists_private, :add_arc_private, :node_exist_private
end




# overriding the Matrix class defining the Matrix object in Ruby 2.4.2
#
class Matrix

	# there is no method to pretty print a matrix
	#
	def dump(first_line = "")
		p self

		str = ""
		space = " "
		if first_line != ""
			str << first_line << "\n"
		end
		for i in 0...self.row_size
			if i == 0
				str << space << space << space << space
				(1..row_size).each {|n| str << n.to_s << space}
				str << "\n" << "\n"
			end
			str << (i + 1).to_s << space << space
			for j in 0...self.column_size
				str << space << self[i,j].to_s
			end
			str << "\n"
		end
		str
	end

	# the Matrix class is immutable, however I want to be able to write:
	#   m[i,j] = v
	#
	def []=(i, j, v)
		@rows[i][j] = v
	end

	# the Matrix class doesn't let developers resize a matrix
	#
	def increase_size
		new_size = row_count + 1

		@rows = Array.new(new_size){Array.new(new_size, 0)}
		@row_count = new_size
		@column_count = new_size
	end
end
