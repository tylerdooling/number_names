require 'number_names/core_ext'

describe NumberNames::NameParser do 
  it "should parse single digit numbers" do
    1.to_name.should == "one"
  end

  it "should parse 2 digit numbers" do
    10.to_name.should == "ten"
    25.to_name.should == "twenty five"
  end

  it "should parse 3 digit numbers" do
    100.to_name.should == "one hundred"
    256.to_name.should == "two hundred and fifty six"
  end

  it "should parse 4 digit numbers" do
    1000.to_name.should == "one thousand"
    6256.to_name.should == "six thousand two hundred and fifty six"
  end

  it "should parse 5 digit numbers" do
    10000.to_name.should == "ten thousand"
    76256.to_name.should == "seventy six thousand two hundred and fifty six"
  end

  it "should parse 5 digit numbers" do
    10000.to_name.should == "ten thousand"
    76256.to_name.should == "seventy six thousand two hundred and fifty six"
  end

  it "should parse big numbers" do
    1073741823.to_name.should == "one billion seventy three million seven hundred and forty one thousand eight hundred and twenty three"
  end

end
