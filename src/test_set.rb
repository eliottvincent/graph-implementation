require './node'
require './matrix_graph'

class TestSet
	nodeee = Node.new('e', false)
  	graph_matrix = MatrixGraph.new(5)
	puts graph_matrix.see
	graph_matrix.add_node(nodeee)
	puts graph_matrix.see
	graph_matrix.add_node(nodeee)
	puts graph_matrix.see
end
