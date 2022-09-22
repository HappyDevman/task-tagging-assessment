# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before do
    allow(TaskPolicy).to receive(:new).and_return(task_policy)
  end

  let(:task_policy) do
    instance_double(TaskPolicy, index?: true, show?: true, create?: true, update?: true, destroy?: true)
  end
  let(:task) { create(:task) }

  let(:task_params) do
    {
      title: Faker::Lorem.sentence(word_count: 5)
    }
  end

  describe 'GET #index' do
    before do
      get :index, format: :json
    end

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template(:index) }
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: task.id }, format: :json
    end

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template(:show) }
  end

  describe 'POST #create' do
    before do
      post :create, params: { task: task_params }, format: :json
    end

    it { is_expected.to respond_with(:found) }
    it { is_expected.to redirect_to(tasks_path) }
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: task.id, task: task_params }, format: :json
    end

    it { is_expected.to respond_with(:found) }
    it { is_expected.to redirect_to(task_path(task)) }
  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy, params: { id: task.id }, format: :json
    end

    it { is_expected.to respond_with(:found) }
    it { is_expected.to redirect_to(tasks_path) }
  end
end
