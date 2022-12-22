require "monty_hall_imitation"

RSpec.describe MontyHallImitation do
    it "check events ratio by choice changing result" do
        model = MontyHallImitation.new
        iter_num = 1000
        with_change = model.events_ratio(iter_num, true)
        without_change = model.events_ratio(iter_num, false)

        expect(with_change).to be > without_change
        expect((with_change + without_change).round(1)).to be 1.0
    end
end