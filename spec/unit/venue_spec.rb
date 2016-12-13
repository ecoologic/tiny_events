require 'spec_helper'

RSpec.describe Venue do
  describe '#valid?' do
    subject { described_class.new(latitude: '234') }
    context "when there's only one geolocation value" do
      it { is_expected.to be_invalid }
    end
  end
end
