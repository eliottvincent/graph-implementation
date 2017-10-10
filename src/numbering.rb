class Numbering
	attr_accessor :counter, :HSI, :nodes

  	def initialize
		counter = -1
	  	# HSI = Hash.new
	  	nodes = Set.new
	end

	def size()
		nodes.length
	end

  	def add_element(node)
		unless HSI.has_key? :node
			counter += 1
			HSI.node = size
			nodes.push(node)
			true
		end
	  	false
	end

  	def number(node)
		HSI.node
	end

  	def element_at(i)
		nodes[i]
	end

end
