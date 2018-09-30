class Api::V1::MicropostSerializer < Api::V1::BaseSerializer
  attributes(*Micropost.attribute_names.map(&:to_sym))

  belongs_to :user, serializer: Api::V1::UserSerializer do
    generic :skip_data, true
    link :related, ->(obj,s) {s.api_v1_user_path(obj.user_id)}
  end

  def picture
    object.picture.url
  end

  collection :users do
    meta :current_page
    meta :next_page
    meta :prev_page
    meta :total_count
    meta :total_pages


    link :self, ->(obj, s){ "http://localhost:3000/api/v1/users/?page%5Bnumber%5D=1&page%5Bsize%5D=25" }
    link :next, ->(obj, s){ "http://localhost:3000/api/v1/users/?page%5Bnumber%5D=2&page%5Bsize%5D=25" }
    link :last, ->(obj, s){ "http://localhost:3000/api/v1/users/?page%5Bnumber%5D=4&page%5Bsize%5D=25" }
  end

end
