module Api
    module V1
      class ArticleSerializer < ActiveModel::Serializer
        attributes :title, :body,  :status
      end
    end
  end