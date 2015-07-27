class Product < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  update_index "products#product", :self

  class << self
    def search keyword
      fields = %w[name attachment]
      ProductsIndex.query multi_match: {query: keyword, fields: fields}
    end
  end
end
