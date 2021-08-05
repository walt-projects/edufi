require 'rails_helper'

describe StudentTransferService do
  let(:new_school) { create(:school) }


  describe 'successful .call' do
    let(:enrollment) { create(:enrollment, end_date: 1.days.ago ) }
    it 'expects the tranfer to succeed' do

      expect(described_class.call(enrollment.student, new_school)).to be_success

    end

  end

  describe 'failing .call' do
    let(:enrollment) { create(:enrollment) }
    it 'expects the transfer to fail' do

      expect(described_class.call(enrollment.student, new_school)).to be_failure

    end

  end
end