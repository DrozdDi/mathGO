RSpec.describe "hello spec" do
    describe "math" do
        it "shut be able to perfom base math" do
            expect(6 * 7).to eq(42)
        end
    end

    describe String do
        let(:string) {String.new}
        it "should be equal to an empty" do
            expect(string).to eq("")
        end
    end
end