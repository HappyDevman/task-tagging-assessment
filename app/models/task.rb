# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :taggings

  validates :title, presence: true
end
