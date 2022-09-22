# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'Model relations' do
    it { is_expected.to belong_to(:tag) }
    it { is_expected.to belong_to(:taggable) }
  end
end
