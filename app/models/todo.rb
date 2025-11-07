class Todo < ApplicationRecord
  belongs_to :user

  validates :description,
            presence: true,
            length: { minimum: 1, maximum: 1000 }

  validates :due_date,
            allow_blank: true,
            inclusion: {
              in: proc { |todo| (Date.today - 100.years)..(Date.today + 100.years) },
              message: "must be a reasonable date"
            },
            if: -> { due_date.present? && due_date.respond_to?(:to_date) }

  # Sanitize description before validation
  before_validation :sanitize_description

  private

  def sanitize_description
    self.description = description.strip if description.present?
  end
end
