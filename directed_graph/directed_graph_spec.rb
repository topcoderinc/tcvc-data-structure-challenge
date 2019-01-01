require "./directed_graph"

describe DirectedGraph do

	#First, accessor methods on an empty graph (to set a good base)
	describe "empty graph" do
		blank = DirectedGraph.new()

		describe ".vertices" do
			context "given an empty graph" do
				it "returns an empty hash" do
					expect(blank.vertices().length()).to eql(0)
				end
			end
		end

		describe ".size" do
			context "given empty graph" do
				it "size should be 0" do
					expect(blank.size()).to eql(0)
				end
			end
		end
	end

	#mutator methods first:
	describe ".add_vertex!" do
		context "given an empty graph" do
			it "adds exactly one vertex" do
				g = DirectedGraph.new()

				expect(g.add_vertex!("Water")).to eql(true)
				expect(g.size).to eql(1)
				expect(g.has_vertex?("Water")).to eql(true)
			end
		end

		context "graph with different element in it" do
			it "adds the element" do
				g = DirectedGraph.new()
				g.add_vertex!("Water")

				expect(g.add_vertex!("Fire")).to eql(true)
				expect(g.size).to eql(2)
				expect(g.has_vertex?("Fire")).to eql(true)
				expect(g.has_vertex?("Water")).to eql(true)
			end
		end

		context "given a graph with the same element in it" do
			it "doesn't add the element" do
				g = DirectedGraph.new()
				g.add_vertex!("Water")

				expect(g.add_vertex!("Water")).to eql(false)
				expect(g.size).to eql(1)
			end
		end
	end

	describe ".add_edge!" do
		context "given vertices not in the graph" do
			it "throw an error" do
				expect{DirectedGraph.new().add_edge!("Grass", "Electric", 3)}.to raise_error(ArgumentError)
			end
		end

		context "given vertices without an edge between them" do
			it "creates an edge pointing from one to the other" do
				g = DirectedGraph.new()
				g.add_vertex!("Dragon")
				g.add_vertex!("Fairy")

				expect(g.add_edge!("Dragon", "Fairy", 2)).to eql(true)
				expect(g.has_edge?("Dragon", "Fairy")).to eql(true)
				expect(g.weight("Dragon", "Fairy")).to eql(2)

				expect(g.has_edge?("Fairy", "Dragon")).to eql(false)
			end
		end

		context "given vertices with an edge already between them" do
			it "updates the edge weight" do
				g = DirectedGraph.new()
				g.add_vertex!("Dragon")
				g.add_vertex!("Fairy")
				g.add_edge!("Dragon", "Fairy", 0)

				expect(g.add_edge!("Dragon", "Fairy", 2)).to eql(false)
				expect(g.has_edge?("Dragon", "Fairy")).to eql(true)
				expect(g.weight("Dragon", "Fairy")).to eql(2)

				expect(g.has_edge?("Fairy", "Dragon")).to eql(false)
			end
		end

		context "given a graph trying to make a self-loop" do
			it "throws an error" do
				g = DirectedGraph.new()
				g.add_vertex!("Dragon")

				expect{g.add_edge!("Dragon", "Dragon", 2)}.to raise_error(ArgumentError)
			end
		end
	end

	describe ".remove_edge!" do
		context "given vertices not in the graph" do
			it "throw an error" do
				expect{DirectedGraph.new().remove_edge!("Grass", "Electric")}.to raise_error(ArgumentError)
			end
		end

		context "given an edge not in graph" do
			it "throw an error" do
				g = DirectedGraph.new()
				g.add_vertex!("Grass")
				g.add_vertex!("Electric")

				expect{DirectedGraph.new().remove_edge!("Grass", "Electric", 3)}.to raise_error(ArgumentError)
			end
		end

		context "given an edge in the graph" do
			it "removes the edge between both vertices" do
				g = DirectedGraph.new()
				g.add_vertex!("Fighting")
				g.add_vertex!("Steel")
				g.add_edge!("Fighting", "Steel", 2)

				expect(g.remove_edge!("Fighting", "Steel")).to eql(2)
				expect(g.has_edge?("Fighting", "Steel")).to eql(false)
			end
		end

		context "given a 2-way edge in graph" do
			it "only removes one way" do
				g = DirectedGraph.new()
				g = DirectedGraph.new()
				g.add_vertex!("Fighting")
				g.add_vertex!("Steel")
				g.add_edge!("Fighting", "Steel", 2)
				g.add_edge!("Steel", "Fighting", 1)

				expect(g.remove_edge!("Fighting", "Steel")).to eql(2)
				expect(g.has_edge?("Fighting", "Steel")).to eql(false)
				expect(g.weight("Steel", "Fighting")).to eql(1)
			end
		end
	end

	describe ".remove_vertex!" do
		context "given a graph with no vertices" do
			it "throws an error" do
				expect{DirectedGraph.new().remove_vertex!("Dark")}.to raise_error(ArgumentError)
			end
		end

		context "given a graph with that isolated vertex" do
			it "removes that vertex" do
				g = DirectedGraph.new()
				g.add_vertex!("Fire")

				expect(g.remove_vertex!("Fire")).to eql({})
				expect(g.has_vertex?("Fire")).to eql(false)
			end
		end

		context "given a graph with an out vertex" do
			it "removes that vertex and its connections" do
				g = DirectedGraph.new()
				g.add_vertex!("Fire")
				g.add_vertex!("Grass")
				g.add_edge!("Fire", "Grass", 2)

				expect(g.remove_vertex!("Fire")).to eql({"Grass" => 2})
				expect(g.has_vertex?("Fire")).to eql(false)
				expect(g.in_degree("Grass")).to eql(0)
			end
		end

		context "given a graph with an in vertex" do
			it "removes that vertex and its connections" do
				g = DirectedGraph.new()
				g.add_vertex!("Fire")
				g.add_vertex!("Water")
				g.add_edge!("Water", "Fire", 2)

				expect(g.remove_vertex!("Fire")).to eql({})
				expect(g.has_vertex?("Fire")).to eql(false)
				expect(g.out_degree("Water")).to eql(0)
			end
		end
	end

	describe ".out_degree" do
		context "vertex not in graph" do
			it "throws an error" do
				expect{DirectedGraph.new().out_degree("Dark")}.to raise_error(ArgumentError)
			end
		end

		context "point to some vertexes" do
			it "has proper out-degree" do
				g = DirectedGraph.new()
				g.add_vertex!("Psychic")
				g.add_vertex!("Normal")
				g.add_vertex!("Ghost")
				g.add_edge!("Ghost", "Psychic", 2)
				g.add_edge!("Ghost", "Normal", 0)

				expect(g.out_degree("Ghost")).to eql(2)
			end
		end

		context "add, remove, add, vertices" do
			it "has out_degree of 1" do
				g = DirectedGraph.new()
				g.add_vertex!("Bug")
				g.add_vertex!("Grass")
				g.add_edge!("Bug", "Grass", 2)
				g.remove_edge!("Bug", "Grass")
				g.add_vertex!("Fire")
				g.add_edge!("Bug", "Fire", 0.5)

				expect(g.out_degree("Bug")).to eql(1)
			end
		end
	end

	describe ".in_degree" do
		context "vertex not in graph" do
			it "throws an error" do
				expect{DirectedGraph.new().in_degree("Dark")}.to raise_error(ArgumentError)
			end
		end

		context "point to some vertexes" do
			it "has proper in-degree" do
				g = DirectedGraph.new()
				g.add_vertex!("Psychic")
				g.add_vertex!("Normal")
				g.add_vertex!("Ghost")
				g.add_edge!("Psychic", "Ghost", 1)
				g.add_edge!("Normal", "Ghost", 0)

				expect(g.in_degree("Ghost")).to eql(2)
			end
		end

		context "add, remove, add, vertices" do
			it "has in_degree of 1" do
				g = DirectedGraph.new()
				g.add_vertex!("Rock")
				g.add_vertex!("Water")
				g.add_vertex!("Grass")
				g.add_edge!("Water", "Rock", 2)
				g.remove_edge!("Water", "Rock")
				g.add_edge!("Grass", "Rock", 2)

				expect(g.in_degree("Rock")).to eql(1)
			end
		end
	end

	describe ".out_neighbors" do
		context "vertex not in graph" do
			it "throws error" do
				expect{DirectedGraph.new().out_neighbors("Dark")}.to raise_error(ArgumentError)
			end
		end

		context "no neighbors" do
			it "returns empty array" do
				g = DirectedGraph.new
				g.add_vertex!("Steel")
				expect(g.out_neighbors("Steel")).to eql([])
			end
		end

		context "two out neighbors" do
			it "returns an array of both neighbors" do
				g = DirectedGraph.new
				g.add_vertex!("Steel")
				g.add_vertex!("Rock")
				g.add_vertex!("Ice")
				g.add_edge!("Steel", "Ice", 2)
				g.add_edge!("Steel", "Rock", 2)

				out_n = g.out_neighbors("Steel")
				expect(out_n.include?("Ice")).to eql(true)
				expect(out_n.include?("Rock")).to eql(true)
				expect(out_n.length).to eql(2)
			end
		end

		context "to in neighbors" do
			it "returns empty array" do
				g = DirectedGraph.new()
				g.add_vertex!("Psychic")
				g.add_vertex!("Normal")
				g.add_vertex!("Ghost")
				g.add_edge!("Psychic", "Ghost", 1)
				g.add_edge!("Normal", "Ghost", 0)

				expect(g.out_neighbors("Ghost")).to eql([])
			end
		end
	end

	describe ".in_neighbors" do
		context "vertex not in graph" do
			it "throws error" do
				expect{DirectedGraph.new().in_neighbors("Dark")}.to raise_error(ArgumentError)
			end
		end

		context "no neighbors" do
			it "returns empty array" do
				g = DirectedGraph.new
				g.add_vertex!("Steel")
				expect(g.in_neighbors("Steel")).to eql([])
			end
		end

		context "two out neighbors" do
			it "returns an empty array " do
				g = DirectedGraph.new
				g.add_vertex!("Steel")
				g.add_vertex!("Rock")
				g.add_vertex!("Ice")
				g.add_edge!("Steel", "Ice", 2)
				g.add_edge!("Steel", "Rock", 2)

				expect(g.in_neighbors("Steel")).to eql([])
			end
		end

		context "two in neighbors" do
			it "returns array of neighbors" do
				g = DirectedGraph.new()
				g.add_vertex!("Psychic")
				g.add_vertex!("Normal")
				g.add_vertex!("Ghost")
				g.add_edge!("Psychic", "Ghost", 1)
				g.add_edge!("Normal", "Ghost", 0)

				in_n = g.in_neighbors("Ghost")
				expect(in_n.include?("Normal")).to eql(true)
				expect(in_n.include?("Psychic")).to eql(true)
				expect(in_n.length).to eql(2)			
			end
		end
	end
end
