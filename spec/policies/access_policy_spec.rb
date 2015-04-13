# class AccessPolicy
#   attr_reader :item, :requestor

#   def initialize(item, requestor)
#     @item, @requestor = item, requestor
#   end

#   def can_manage?
#     item.user == requestor
#   end

#   def can_read?
#     item.published? || can_manage?
#   end
# end
require 'rails_helper'

describe AccessPolicy do
  let(:item) { double('item') }
  let(:requestor) { create(:user) }
  let(:another_user) { create(:user) }

  def can_manage?
    AccessPolicy.new(item, requestor).can_manage?
  end

  describe '.can_manage?' do
    subject { can_manage? }

    context 'when requestor is author' do
      before { allow(item).to receive(:user).and_return(requestor) }

      it { is_expected.to eq true }
    end

    context 'when requestor is not author' do
      before { allow(item).to receive(:user).and_return(another_user) }

      it { is_expected.to eq false }
    end
  end

  describe '.can_read?' do
    def can_read?
      item.published? || can_manage?
    end

    subject { can_read? }

    context 'when requestor is author' do
      before do
        allow(item).to receive(:user).and_return(requestor)
        allow(item).to receive(:published?).and_return(true)
      end

      it { is_expected.to eq true }
    end

    context 'when item is published' do
      before do
        allow(item).to receive(:user).and_return(another_user)
        allow(item).to receive(:published?).and_return(true)
      end

      it { is_expected.to eq true }
    end

    context 'when item is not published and requestor is not author' do
      before do
        allow(item).to receive(:user).and_return(another_user)
        allow(item).to receive(:published?).and_return(false)
      end

      it { is_expected.to eq false }
    end
  end
end
