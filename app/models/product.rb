class Product < ActiveRecord::Base
  mount_uploader :image, ProductPhotoUploader
end
