require 'spec_config'

def mock_cell(name, alive_return)
  m = mock(name)
  m.should_receive(:alive?).and_return(alive_return)
  m
end

def alive(name)
  mock_cell(name, true)
end

def dead(name)
  mock_cell(name, false)
end

def set(*neighbors)
  neighbors.reduce([]){|arr, n| arr << (n ? alive("a#{arr.size}") : dead("d#{arr.size}"))}
end

describe GOL::Rule1 do
  it "should not be satisfied if there are fewer than 2 live neighbors when called w/out any cells" do
    GOL::Rule1.evaluate.should be_false
  end
  
  it "should not be satisfied if there are fewer than 2 live neighbors when called w <2 neighbors" do
    GOL::Rule1.evaluate(["foo"]).should be_false
  end
  
  it "should not be satisfied if there are fewer than 2 live neighbors when called w 1 dead and 1 live neighbor" do
    GOL::Rule1.evaluate(set(true, false)).should be_false
  end
  
  it "should be satisfied if there are 2 live neighbors when called w 2 live neighbors" do
    GOL::Rule1.evaluate(set(true, true)).should be_true
  end
end

describe GOL::Rule2 do
  it "should be satisfied if there are no live neighbors" do
    GOL::Rule2.evaluate.should be_true
  end
  
  it "should be satisfied if there is 1 live neighbor" do
    GOL::Rule2.evaluate(["foo"]).should be_true
  end
  
  it "should be satisfied if there are 3 live neighbors" do
    GOL::Rule2.evaluate(['foo', 'bar', 'baz']).should be_true
  end
  
  it "should be satisfied if there are 3 live neighbors and 1 dead neighbor" do
    GOL::Rule2.evaluate(set(true, true, true, false)).should be_true
  end
  
  it "should not be satisfied if there are 4 live neighbors" do
    GOL::Rule2.evaluate(set(true, true, true, true)).should be_false
  end
end