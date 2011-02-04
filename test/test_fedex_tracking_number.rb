require 'test_helper'

class FedExTrackingNumberTest < Test::Unit::TestCase
  context "a FedEx tracking number" do
    ["986578788855", "477179081230"].each do |valid_number|
      should "return fedex express for #{valid_number}" do
        t = TrackingNumber.new(valid_number)
        assert_equal TrackingNumber::FedExExpress, t.class
        assert_equal :fedex, t.carrier
        assert t.valid?
      end

      should "detect #{valid_number} regardless of spacing" do
        should_detect_number_variants(valid_number, TrackingNumber::FedExExpress)
      end
    end

    ["9611020987654312345672"].each do |valid_number|
      should "return fedex 96 for #{valid_number}" do
        t = TrackingNumber.new(valid_number)
        assert_equal TrackingNumber::FedExGround96, t.class
        assert_equal :fedex, t.carrier
        assert t.valid?
      end

      should "detect #{valid_number} regardless of spacing" do
        should_detect_number_variants(valid_number, TrackingNumber::FedExGround96)
      end
    end

    ["000123450000000027"].each do |valid_number|
      should "return fedex sscc18 for #{valid_number}" do
        t = TrackingNumber.new(valid_number)
        assert_equal TrackingNumber::FedExGround18, t.class
        assert_equal :fedex, t.carrier
        assert t.valid?
      end

      should "detect #{valid_number} regardless of spacing" do
        should_detect_number_variants(valid_number, TrackingNumber::FedExGround18)
      end
    end

  end
end