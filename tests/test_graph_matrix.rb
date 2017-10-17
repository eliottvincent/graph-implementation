require 'minitest/autorun'
require 'shoulda/context'
require_relative './../src/matrix_graph'
require_relative './../src/node'
require_relative './../src/arc'

class TestGraphMatrix < Minitest::Test




	#  ██╗███╗   ██╗██╗████████╗
	#  ██║████╗  ██║██║╚══██╔══╝
	#  ██║██╔██╗ ██║██║   ██║
	#  ██║██║╚██╗██║██║   ██║
	#  ██║██║ ╚████║██║   ██║
	#  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝


	context 'Initializing some MatrixGraph objects' do

		setup do
			@graph_matrix = MatrixGraph.new

			@size = 5
			@graph_matrix_size = MatrixGraph.new(@size)
		end


		should 'the graph is created properly' do
			assert_equal MatrixGraph, @graph_matrix.class
			assert_equal MatrixGraph, @graph_matrix_size.class
		end

		should 'is_null works properly' do
			assert_equal true, @graph_matrix.is_null
			assert_equal true, @graph_matrix_size.is_null
		end

		should 'is_empty works properly' do
			assert_equal true, @graph_matrix.is_empty
			assert_equal true, @graph_matrix_size.is_empty
		end

		should 'size works properly' do
			assert_equal 0, @graph_matrix.size
			assert_equal @size, @graph_matrix_size.size
		end

		should 'nb_nodes works properly' do
			assert_equal 0, @graph_matrix.nb_nodes
			assert_equal 0, @graph_matrix_size.nb_nodes
		end

		should 'nb_arcs works properly' do
			assert_equal 0, @graph_matrix.nb_arcs
			assert_equal 0, @graph_matrix_size.nb_arcs
		end

	end




	#  ███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗
	#  ████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝
	#  ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗
	#  ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║
	#  ██║ ╚████║╚██████╔╝██████╔╝███████╗███████║
	#  ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝


	context 'adding nodes to a MatrixGraph object' do

		setup do
			@graph_matrix = MatrixGraph.new

			@node_one = Node.new('a', false)
			@node_two = Node.new('b', false)
			@node_three = Node.new('c', false)
			@node_four = Node.new('d', false)
			@node_five = Node.new('e', false)
			@node_six = Node.new('a', false)

			@graph_matrix.add_node(@node_one)
			@graph_matrix.add_node(@node_two)
			@graph_matrix.add_node(@node_three)
			@graph_matrix.add_node(@node_four)
			@graph_matrix.add_node(@node_five)
		end

		should 'the nodes are created properly' do
			assert_equal Node, @node_one.class
			assert_equal Node, @node_two.class
			assert_equal Node, @node_three.class
			assert_equal Node, @node_four.class
			assert_equal Node, @node_five.class
			assert_equal Node, @node_six.class
		end

		should 'the node_exists method works properly' do
			assert_equal true, @graph_matrix.node_exists(@node_one)
			assert_equal true, @graph_matrix.node_exists(@node_two)
			assert_equal true, @graph_matrix.node_exists(@node_three)
			assert_equal true, @graph_matrix.node_exists(@node_four)
			assert_equal true, @graph_matrix.node_exists(@node_five)
			assert_equal false, @graph_matrix.node_exists(@node_six)
		end

		should 'the nodes are added to the graph properly' do
			assert_equal 5, @graph_matrix.nb_nodes
			refute_equal true, @graph_matrix.is_null
		end

		should 'is_null doesn\'t return true anymore' do
			refute_equal true, @graph_matrix.is_null
		end

		should 'is_null returns false because we added nodes' do
			assert_equal false, @graph_matrix.is_null
		end

		should 'size doesn\'t return 0 anymore' do
			refute_equal 0, @graph_matrix.size
		end

		should 'size now returns 5 because we added 5 nodes' do
			assert_equal 5, @graph_matrix.size
		end

		should 'nb_nodes doesn\'t return 0 anymore' do
			refute_equal 0, @graph_matrix.nb_nodes
		end

		should 'nb_nodes returns 5 because we added 5 nodes' do
			refute_equal 0, @graph_matrix.nb_nodes
		end

		should 'nb_arcs still returns 0' do
			assert_equal 0, @graph_matrix.nb_arcs
		end

	end




	#   █████╗ ██████╗  ██████╗███████╗
	#  ██╔══██╗██╔══██╗██╔════╝██╔════╝
	#  ███████║██████╔╝██║	   ███████╗
	#  ██╔══██║██╔══██╗██║	   ╚════██║
	#  ██║  ██║██║  ██║╚██████╗███████║
	#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝

	context 'adding nodes to a MatrixGraph object' do

		setup do
			@graph_matrix = MatrixGraph.new

			@node_one = Node.new('a', false)
			@node_two = Node.new('b', false)
			@node_three = Node.new('c', false)
			@node_four = Node.new('d', false)
			@node_five = Node.new('e', false)
			@node_six = Node.new('a', false)

			@graph_matrix.add_node(@node_one)
			@graph_matrix.add_node(@node_two)
			@graph_matrix.add_node(@node_three)
			@graph_matrix.add_node(@node_four)
			@graph_matrix.add_node(@node_five)

			@graph_matrix.add_arc(@node_one, @node_two)
			@graph_matrix.add_arc(@node_two, @node_two)
			@graph_matrix.add_arc(@node_four, @node_two)
			@graph_matrix.add_arc(@node_one, @node_three)
			@graph_matrix.add_arc(@node_two, @node_four)
		end

		should 'the arcs are created properly' do

		end

		should 'the arc_exists method works properly' do
			@graph_matrix.see
			assert_equal true, @graph_matrix.arc_exists(@node_one, @node_two)
			assert_equal true, @graph_matrix.arc_exists(@node_two, @node_two)
			assert_equal true, @graph_matrix.arc_exists(@node_four, @node_two)
			assert_equal true, @graph_matrix.arc_exists(@node_one, @node_three)
			assert_equal true, @graph_matrix.arc_exists(@node_two, @node_four)
			assert_equal false, @graph_matrix.arc_exists(@node_five, @node_one)
			assert_equal false, @graph_matrix.arc_exists(@node_six, @node_three)
		end

		should 'is_empty returns false because we added some arcs' do
			assert_equal false, @graph_matrix.is_empty
		end

		should 'nb_arcs returns 5 because we added 5 arcs' do
			assert_equal 5, @graph_matrix.nb_arcs
		end

	end



end
