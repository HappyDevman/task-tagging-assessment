# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy, counter_cache: true
  has_many :tasks, through: :taggings, source: :taggable, source_type: 'Task'

  validates :name, presence: true
  validates :name, uniqueness: true
end
