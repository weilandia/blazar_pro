class Rfq < ApplicationRecord
  has_many_attached :attachments
  has_one_attached :raw_email
end
