require 'pg'

class Comment
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'comment_manager_test')
        else 
            connection = PG.connect(dbname: 'comment_manager')
        end

        result = connection.exec("SELECT * FROM bookmarks")
        result.map { |comment| comment['user'] comment['comment']}
    end
end