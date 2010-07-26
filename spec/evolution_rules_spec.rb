require 'spec_config'

describe GOL::Rule1 do
  it "should know there are fewer than 2 live neighbors when called w/out any cells" do
    GOL::Rule1.evaluate().should be_false
  end
  
  it "should know there are fewer than 2 live neighbors when called w <2 neighbors" do
    GOL::Rule1.evaluate(["foo"]).should be_false
  end
  
  def dead(name)
    mock_cell(name, false)
  end
  
  def mock_cell(name, alive_return)
    m = mock(name)
    m.should_receive(:alive?).and_return(alive_return)
    m
  end
  
  def alive(name)
    mock_cell(name, true)
  end
  
  it "should know there are fewer than 2 live neighbors when called w 1 dead and 1 live neighbor" do
    cell1 = alive('c1')
    cell2 = dead('c2')
    GOL::Rule1.evaluate([cell1, cell2]).should be_false
  end
  
  it "should know there are 2 live neighbors when called w 2 live neighbors" do
    cell1 = alive('c1')
    cell2 = alive('c2')
    GOL::Rule1.evaluate([cell1, cell2]).should be_true
  end
end