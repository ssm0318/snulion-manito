class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to   :user

    mount_uploader :photo, PhotoUploader
end
