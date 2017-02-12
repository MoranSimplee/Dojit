describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
          expect(v = Vote.new(value: 1).valid?).to eq(true)
          expect(v = Vote.new(value: -1).valid?).to eq(true)
          expect(v = Vote.new(value: 2).valid?).to eq(false)
      end
    end
  end
end