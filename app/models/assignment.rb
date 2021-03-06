# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  date       :date
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  face_id    :integer
#  company_id :integer
#
# Indexes
#
#  index_assignments_on_company_id  (company_id)
#  index_assignments_on_face_id     (face_id)
#
# Foreign Keys
#
#  fk_rails_4f552fec74  (face_id => faces.id)
#  fk_rails_9e2526b1f7  (company_id => companies.id)
#

class Assignment < ApplicationRecord
  belongs_to :company
  belongs_to :face

  validates :company, length: { minimum: 1 }, allow_nil: true
  validates :face, length: { minimum: 1 }, allow_nil: true

  scope :director_in, -> { where(position: 0) }
  scope :founder_in,  -> { where(position: 1) }

  has_paper_trail

  enum position: [:director, :founder]
end