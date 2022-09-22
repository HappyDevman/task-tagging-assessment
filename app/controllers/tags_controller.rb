# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    authorize_action

    tags = Tag.order(taggings_count: :desc)
    render :index, status: :ok, locals: { tags: tags }
  end

  private

  def authorize_action(record = Tag)
    authorize(record, "#{action_name}?", policy_class: policy_class)
  end

  def policy_class
    TagPolicy
  end
end
