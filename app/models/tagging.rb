# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :tag, counter_cache: true
  belongs_to :taggable, polymorphic: true

  validates :taggable_type, presence: true
  validates :taggable_type, inclusion: { in: %w[Task] }

  accepts_nested_attributes_for :tag
end
