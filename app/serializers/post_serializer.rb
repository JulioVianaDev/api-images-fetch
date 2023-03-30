class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title
end
