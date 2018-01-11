describe Kernel do
  describe '#yield_self' do
    let(:object) { Object.new }

    specify { expect(object.yield_self { self }).to eq self }
    specify { expect(object.yield_self {|x| break x }).to eq object }
    specify { expect(object.yield_self).instance_of? Enumerator }
    specify { expect(object.yield_self.size).to eq 1 }
    specify { expect('my string'.yield_self {|s| s.upcase }).to eq 'MY STRING' }
    specify { expect(3.next.yield_self {|x| x**x }.to_s).to eq '256' }
  end
end
