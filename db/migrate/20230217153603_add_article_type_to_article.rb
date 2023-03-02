class AddArticleTypeToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :article_type, :string
  end
end
