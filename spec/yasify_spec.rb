# encoding: utf-8

require 'spec_helper'

describe Yasify do

  let(:spec_dir) { Pathstring.new 'spec/data' }

  before {
    FileUtils.rm_rf spec_dir.absolute
    FileUtils.mkdir_p spec_dir.absolute
  }

  subject { described_class.new spec_dir.join('.abilities.yml').absolute }

  describe "C" do
    it "should stash valuables in a dedicated file" do
      subject.exist?.should be_false
      subject.unit.should == {}

      subject.unit =  { '' => { plop: true } }
      subject.save!

      YAML.load(File.read(subject.absolute)).should == { '' => {plop: true} }
    end
  end

  describe "R" do
    before {
      subject.save! 'bam/boom/blam' => { 'plap' => true, 'bim' => false }, 'bimbim' => { 'plap' => false }
    }

    it "should give away the valuables of the right cell" do
      subject.item('bam/boom/blam').should == { 'plap' => true, 'bim' => false }
      subject.item('bimbim').should == { 'plap' => false }
      subject['bimbim'].should == { 'plap' => false }
    end
  end

  describe "U" do
    before {
      subject.save! 'bam/boom/blam' => { 'plap' => true, 'bim' => false }, 'bimbim' => { 'plap' => false }
    }

    it "should update chunks of data with no loss elsewhere" do
      subject.save! 'bimbim' => subject.item('bimbim').merge({ 'plap' => true, 'klok' => false })

      subject.read.should == {'bam/boom/blam' => { 'plap' => true, 'bim' => false }, 'bimbim' => { 'plap' => true, 'klok' => false }}

      subject['bam/boom/blam'] = { 'plap' => false, 'bim' => false }

      subject.read.should == {'bam/boom/blam' => { 'plap' => false, 'bim' => false }, 'bimbim' => { 'plap' => true, 'klok' => false }}
    end
  end

  describe "D" do
    before {
      subject.save! 'bam/boom/blam' => { 'plap' => true, 'bim' => false }, 'bimbim' => { 'plap' => false }
    }

    it "should wipe only the current stash" do
      subject.clear! 'bimbim'

      subject.read.should == {'bam/boom/blam' => { 'plap' => true, 'bim' => false }, 'bimbim' => {}}
    end
  end

  after {
    FileUtils.rm_rf spec_dir.absolute
  }

end
