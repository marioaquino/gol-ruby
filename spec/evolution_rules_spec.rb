require 'spec_config'

describe GOL::GridWalker do
  it "should know a 1x1 grid has no neighbors" do
    grid = Object.new
    grid.should_receive(:rows).and_return(1)
    grid.should_receive(:columns).and_return(1)
    grid.extend(GOL::GridWalker)
    
    def grid.foo
      neighbors_of(0, 0)
    end
    
    grid.foo.should be_empty
  end
  
  context "in a 3x3 grid" do
    before(:each) do
      @grid = Object.new
      @grid.should_receive(:rows).and_return(3)
      @grid.should_receive(:columns).and_return(3)
      @grid.extend(GOL::GridWalker)
    end
    
    def neighbor_sets(x, y)
      def @grid.foo(x, y)
        neighbors_of(x, y)
      end
      @grid.foo(x, y)
    end
    
    it "should know all the neighbors of the center cell" do
      neighbor_sets(1, 1).should == [[0, 0], [0, 1], [0, 2], 
                                     [1, 0],         [1, 2], 
                                     [2, 0], [2, 1], [2, 2]]
    end
    
    it "should know all the neighbors of the bottom-right cell" do
      neighbor_sets(2, 2).should == [[1, 1], [1, 2], 
                                     [2, 1]]
    end
    
    it "should know all the neighbors of the top-left cell" do
      neighbor_sets(0, 0).should == [        [0, 1], 
                                     [1, 0], [1, 1]]
    end
  end
end