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
			@invalid_node = nil
			@invalid_node_bis = String.new

			@graph_matrix.add_node(@node_one)
			@graph_matrix.add_node(@node_two)
			@graph_matrix.add_node(@node_three)
			@graph_matrix.add_node(@node_four)
			@graph_matrix.add_node(@node_five)
		end

		should 'the is_node_valid works properly' do
			assert_equal true, @graph_matrix.is_node_valid(@node_one)
			assert_equal true, @graph_matrix.is_node_valid(@node_two)
			assert_equal true, @graph_matrix.is_node_valid(@node_three)
			assert_equal true, @graph_matrix.is_node_valid(@node_four)
			assert_equal true, @graph_matrix.is_node_valid(@node_five)
			assert_equal true, @graph_matrix.is_node_valid(@node_six)
			assert_equal false, @graph_matrix.is_node_valid(@invalid_node)
			assert_equal false, @graph_matrix.is_node_valid(@invalid_node_bis)
		end

		should 'the node_exists method works properly' do
			assert_equal true, @graph_matrix.node_exists(@node_one)
			assert_equal true, @graph_matrix.node_exists(@node_two)
			assert_equal true, @graph_matrix.node_exists(@node_three)
			assert_equal true, @graph_matrix.node_exists(@node_four)
			assert_equal true, @graph_matrix.node_exists(@node_five)
			assert_equal false, @graph_matrix.node_exists(@node_six)
		end

		should 'the indegree method returns 0 for every node (no arcs)' do
			assert_equal 0, @graph_matrix.indegree(@node_one)
			assert_equal 0, @graph_matrix.indegree(@node_two)
			assert_equal 0, @graph_matrix.indegree(@node_three)
			assert_equal 0, @graph_matrix.indegree(@node_four)
			assert_equal 0, @graph_matrix.indegree(@node_five)
		end

		should 'the outdegree method returns 0 for every node (no arcs)' do
			assert_equal 0, @graph_matrix.outdegree(@node_one)
			assert_equal 0, @graph_matrix.outdegree(@node_two)
			assert_equal 0, @graph_matrix.outdegree(@node_three)
			assert_equal 0, @graph_matrix.outdegree(@node_four)
			assert_equal 0, @graph_matrix.outdegree(@node_five)
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
			assert_equal 5, @graph_matrix.nb_nodes
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

	context 'adding arcs to a MatrixGraph object' do

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

		should 'the arc_value method works properly bis' do
			@graph_matrix.arc_value(@node_one, @node_two, 2)
			assert_equal 2, @graph_matrix.arc_value(@node_one, @node_two)
			@graph_matrix.arc_value(@node_two, @node_two, 3)
			assert_equal 3, @graph_matrix.arc_value(@node_two, @node_two)
			@graph_matrix.arc_value(@node_four, @node_two, 4)
			assert_equal 4, @graph_matrix.arc_value(@node_four, @node_two)
			@graph_matrix.arc_value(@node_one, @node_three, 5)
			assert_equal 5, @graph_matrix.arc_value(@node_one, @node_three)
			@graph_matrix.arc_value(@node_two, @node_four, 6)
			assert_equal 6, @graph_matrix.arc_value(@node_two, @node_four)
		end

		should 'the indegree method works properly' do
			assert_equal 0, @graph_matrix.indegree(@node_one)
			assert_equal 3, @graph_matrix.indegree(@node_two)
			assert_equal 1, @graph_matrix.indegree(@node_three)
			assert_equal 1, @graph_matrix.indegree(@node_four)
			assert_equal 0, @graph_matrix.indegree(@node_five)
		end

		should 'the outdegree method works properly' do
			assert_equal 2, @graph_matrix.outdegree(@node_one)
			assert_equal 2, @graph_matrix.outdegree(@node_two)
			assert_equal 0, @graph_matrix.outdegree(@node_three)
			assert_equal 1, @graph_matrix.outdegree(@node_four)
			assert_equal 0, @graph_matrix.outdegree(@node_five)
		end

		should 'the predecessors method works properly' do
			node_one_predecessors = Hash.new
			node_two_predecessors = Hash.new
			node_three_predecessors = Hash.new
			node_four_predecessors = Hash.new
			node_five_predecessors = Hash.new

			node_two_predecessors[@node_one.name] = @node_one
			node_two_predecessors[@node_two.name] = @node_two
			node_two_predecessors[@node_four.name] = @node_four
			node_three_predecessors[@node_one.name] = @node_one
			node_four_predecessors[@node_two.name] = @node_two

			assert_equal 0, @graph_matrix.predecessors(@node_one).length
			assert_equal node_one_predecessors, @graph_matrix.predecessors(@node_one)

			assert_equal 3, @graph_matrix.predecessors(@node_two).length
			assert_equal node_two_predecessors, @graph_matrix.predecessors(@node_two)

			assert_equal 1, @graph_matrix.predecessors(@node_three).length
			assert_equal node_three_predecessors, @graph_matrix.predecessors(@node_three)

			assert_equal 1, @graph_matrix.predecessors(@node_four).length
			assert_equal node_four_predecessors, @graph_matrix.predecessors(@node_four)

			assert_equal 0, @graph_matrix.predecessors(@node_five).length
			assert_equal node_five_predecessors, @graph_matrix.predecessors(@node_five)
		end

		should 'the successors method works properly' do
			node_one_successors = Hash.new
			node_two_successors = Hash.new
			node_three_successors = Hash.new
			node_four_successors = Hash.new
			node_five_successors = Hash.new

			node_one_successors[@node_two.name] = @node_two
			node_one_successors[@node_three.name] = @node_three
			node_two_successors[@node_two.name] = @node_two
			node_two_successors[@node_four.name] = @node_four
			node_two_successors[@node_four.name] = @node_four
			node_four_successors[@node_two.name] = @node_two

			assert_equal 2, @graph_matrix.successors(@node_one).length
			assert_equal node_one_successors, @graph_matrix.successors(@node_one)

			assert_equal 2, @graph_matrix.successors(@node_two).length
			assert_equal node_two_successors, @graph_matrix.successors(@node_two)

			assert_equal 0, @graph_matrix.successors(@node_three).length
			assert_equal node_three_successors, @graph_matrix.successors(@node_three)

			assert_equal 1, @graph_matrix.successors(@node_four).length
			assert_equal node_four_successors, @graph_matrix.successors(@node_four)

			assert_equal 0, @graph_matrix.successors(@node_five).length
			assert_equal node_five_successors, @graph_matrix.successors(@node_five)
		end

		should 'the neighbors method works properly' do
			node_one_neighbors= Hash.new
			node_two_neighbors= Hash.new
			node_three_neighbors= Hash.new
			node_four_neighbors= Hash.new
			node_five_neighbors= Hash.new

			node_one_neighbors[@node_two.name] = @node_two
			node_one_neighbors[@node_three.name] = @node_three
			node_two_neighbors[@node_one.name] = @node_one
			node_two_neighbors[@node_two.name] = @node_two
			node_two_neighbors[@node_four.name] = @node_four
			node_three_neighbors[@node_one.name] = @node_one
			node_four_neighbors[@node_two.name] = @node_two

			assert_equal node_one_neighbors, @graph_matrix.neighbors(@node_one)
			assert_equal node_two_neighbors, @graph_matrix.neighbors(@node_two)
			assert_equal node_three_neighbors, @graph_matrix.neighbors(@node_three)
			assert_equal node_four_neighbors, @graph_matrix.neighbors(@node_four)
			assert_equal node_five_neighbors, @graph_matrix.neighbors(@node_five)
		end

		should 'is_empty returns false because we added some arcs' do
			assert_equal false, @graph_matrix.is_empty
		end

		should 'nb_arcs doesn\'t 0 anymore' do
			refute_equal 0, @graph_matrix.nb_arcs
		end

		should 'nb_arcs returns 5 because we added 5 arcs' do
			assert_equal 5, @graph_matrix.nb_arcs
		end

	end

end
