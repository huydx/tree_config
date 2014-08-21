require 'spec_helper'

describe TreeConfig do
  it "should load common setting file" do
    config = TreeConfig.load(setting_folder("empty"))
    config.size.should == 0
  end

  it "should not load fixnum key in yml" do
    expect { TreeConfig.load(setting_folder("onefile_num")) }.to raise_error(TreeConfig::KeyIsFixNum)
  end

  it "should load one file" do
    config = TreeConfig.load(setting_folder("onefile"))
    config.test.size.should == 2
    config.test.A.size.should == 2
    config.test.A.a1.should == "bar"
    config.test.A.a2.should == "baz"
    config.test.B.a3.a4.should == "foo"
  end

  it "should load two file" do
    config = TreeConfig.load(setting_folder("twofile"))
    config.size.should == 2
    config.test1.A.a1.should == "bar"
    config.test2.A.a1.should == "bar"
  end

  it "should load nested folder" do
    config = TreeConfig.load(setting_folder("nest1"))
    config.size.should == 1
    config.A1.test.A.a1.should == "bar"
  end

  it "should load complex nested folder" do
    config = TreeConfig.load(setting_folder("nest2"))
    config.size.should == 2
    config.B.size.should == 0
    config.A.size.should == 2
    config.A.test.A.a1.should == "bar"
    config.A.C.test.A.a1.should == "bar"
  end
end
