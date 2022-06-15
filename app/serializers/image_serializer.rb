class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :credit, :image_url, :location
end
