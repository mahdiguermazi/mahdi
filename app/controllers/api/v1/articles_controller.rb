module Api
    module V1
        class ArticlesController<Basecontroller

                def index
                    articles = Article.all
                    render json: {
                        data: ActiveModelSerializers::SerializableResource.new(articles,
                                                                               each_serializer: Api::V1::ArticleSerializer),
                        message: ['Article list fetched successfully'],
                        status: 200,
                        type: 'Success'
                      }
                end
                def show
                    article = Article.find(params[:id]) 
                    render json: {
                        data: ActiveModelSerializers::SerializableResource.new(article,
                                                                               serializer: Api::V1::ArticleSerializer),
                        message: ['Article fetched successfully'],
                        status: 200,
                        type: 'Success'
                      }
                end
                def create
                    article = Article.new(article_params)
                    if article.save
                        render json: {
                            data: ActiveModelSerializers::SerializableResource.new(article,
                                                                                   serializer: Api::V1::ArticleSerializer),
                            message: ['Article fetched successfully'],
                            status: 200,
                            type: 'Success'
                          }
                    else
                    render json: article.errors, status: :unprocessable_entity
                    end
                end
                def update
                    article = Article.find(params[:id])
                    if article.update(article_params    )
                        render json: {
                            data: ActiveModelSerializers::SerializableResource.new(article,
                                                                                serializer: Api::V1::ArticleSerializer),
                            message: ['Article fetched successfully'],
                            status: 200,
                            type: 'Success'
                        }
                    end
                end
                def destroy
                    article = Article.find(params[:id])
                    article.destroy
                    head :no_content
                end

                private
                def article_params
                    params.require(:article).permit(:title, :body, :status)
                end
        end
    end
end