# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::AdminUsersService do
  describe '#execute' do
    subject { Search::AdminUsersService.new(params).execute }

    before do
      create(:admin_user, name: 'admin')
      create(:admin_user, name: 'test')
      create(:admin_user, name: 'user')
      create(:admin_user, name: 'admin test')
      create(:admin_user, name: 'admin user')
      create(:admin_user, name: 'test user')
      create(:admin_user, name: 'admin test user')
    end

    let(:params) { { q: q } }

    context 'when search query is nil' do
      let(:q) { nil }

      it 'returns all admin_users' do
        expect(subject.size).to eq(7)
      end

      context 'when search partial name' do
        let(:q) { 'ad' }

        it 'returns all admin_users containing search keyword' do
          expect(subject.size).to eq(4)
        end
      end

      context 'when search full word name' do
        let(:q) { 'test' }

        it 'returns all admin_users containing search keyword' do
          expect(subject.size).to eq(4)
        end
      end
    end
  end
end
