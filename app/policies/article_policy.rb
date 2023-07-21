class ArticlePolicy < ApplicationPolicy

    def update?
        user.id == article.user.id
    end

end