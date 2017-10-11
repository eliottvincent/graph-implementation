require './graph'
require './indexing'

class MatrixGraph < Graph
	attr_accessor :matrix, :indexing

	def initialize(size = nil)
		@indexing = Indexing.new						# indexing represents
		if size.nil?
			size = 0
		end
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
		if indexing.add_element(node)
			arcs = Set.new
			#TODO: increment the matrix's size only if the matrix has too much nodes compared to its basic size
			if indexing.size > size
				matrix.increment_size
			end
			self.see
		else
			raise ArgumentError, "The node has already been added to the graph"
		end
	end

	def node_exist_private(node)
		true
	end


	#   █████╗ ██████╗  ██████╗
	#  ██╔══██╗██╔══██╗██╔════╝
	#  ███████║██████╔╝██║
	#  ██╔══██║██╔══██╗██║
	#  ██║  ██║██║  ██║╚██████╗
	#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

	# OK
	def add_arc(origin, destination, value = nil)
		if node_exist_private(origin) && node_exist_private(destination)

			oi = indexing.index(origin)
			di = indexing.index(destination)
			matrix[oi, di] = value.nil? ? 1 : value
			see
		end
	end

	# NOT TESTED
	def add_arc_private(origin_index, destination_index, value)
		origin_node = indexing.element_at(origin_index)
		destination_node = indexing.element_at(destination_index)
		add_node(origin_node)
		add_node(destination_node)

		matrix[origin_index, destination_index] = value
	end

	# OK
	def remove_arc(origin, destination)
		oi = indexing.index(origin)
		di = indexing.index(destination)
		matrix[oi, di] = 0
		see
	end

	# OK
	def arc_exists(origin, destination)
		oi = indexing.index(origin)
		di = indexing.index(destination)
		matrix[oi, di] != 0	# check if the matrix contains a value at (oi, di) coordinates, different from 0, and returns true if so. return false if nil
	end

	# OK
	def arc_exists_private(origin_index, destination_index)
		p 'cheking if arc exist between ' + indexing.element_at(origin_index).name + ' and ' + indexing.element_at(destination_index).name
		matrix[origin_index, destination_index] != 0
	end

	# OK
	def arc_value(origin, destination)
		oi = indexing.index(origin)
		di = indexing.index(destination)
		matrix[oi, di]
	end

	# OK
	def edit_arc_value(origin, destination, value)
		if arc_exists(origin, destination)	# allowing to edit only if there is an arc
			oi = indexing.index(origin)
			di = indexing.index(destination)
			matrix[oi, di] = value
		end
	end

	# OK
	def neighbors(node)
		neighbors = Set.new
		ni = indexing.index(node)

		(0..size - 1).each {|i|
			if arc_exists_private(ni, i)
				puts 'yes'
				neighbors.add(indexing.element_at(i))
			end
		}
		(0..size - 1).each {|j|
			if arc_exists_private(j, ni)
				puts 'yes'
				neighbors.add(indexing.element_at(j))
			end
		}
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
		(0..n).each {|i|
			g.add_node(indexing.element_at(i))
		}
		(0..n).each {|i|
			(0..n).each {|j|
				if arc_exists_private(i, j)
					g.add_arc_private(i, j, arc_value(i, j))
				end
			}
		}
		g
	end

	def see
		puts matrix.dump(@indexing.nodes.empty? ? nil : @indexing.nodes)
	end

	private :arc_exists_private, :add_arc_private, :node_exist_private
end




# overriding the Matrix class defining the Matrix object in Ruby 2.4.2
#
class Matrix

	# there is no method to pretty print a matrix
	#
	def dump(elements = nil)
		# p self
		str = ""
		space = " "
		double_space = space + space
		(0...self.row_size).each {|i|
			if i == 0
				str << double_space << double_space

				# if elements has been specified, we output its content
				unless elements.nil?
					elements.each {|element|
						str << element[1].name.to_s << space
					}
				end
				str << "\n" << "\n"
			end

			if !elements.nil? && !elements.values[i].nil?
				str << elements.values[i].name.to_s << double_space
			else
				str << double_space << space
			end

			for j in 0...self.column_size
				str << space << self[i, j].to_s
			end
			str << "\n"
		}
		str << "\n"
	end

	# the Matrix class is immutable, however I want to be able to write:
	#   m[i,j] = v
	#
	def []=(i, j, v)
		@rows[i][j] = v
	end

	# the Matrix class doesn't let developers resize a matrix
	#
	def increment_size
		incremented_size = row_count + 1

		@rows = Array.new(incremented_size){Array.new(incremented_size, 0)}
		@row_count = incremented_size
		@column_count = incremented_size
	end
end
