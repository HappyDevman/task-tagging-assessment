# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  before do
    allow(TagPolicy).to receive(:new).and_return(tag_policy)
  end

  let(:tag_policy) do
    instance_double(TagPolicy, index?: true)
  end
  let(:tag) { create(:tag) }

  describe 'GET #index' do
    before do
      get :index, format: :json
    end

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template(:index) }
  end
end
