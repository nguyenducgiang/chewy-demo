class ProductsIndex < Chewy::Index
  define_type Product do
    field :name
    field :attachment, type: "attachment", value: ->product {
      if product.attachment.present?
        Base64.encode64 open(product.attachment.path).read
      else
        ""
      end
    }
  end
end
