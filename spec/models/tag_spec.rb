# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:taggings_count).of_type(:integer) }
  end

  describe 'Model relations' do
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:tasks) }
  end
end
