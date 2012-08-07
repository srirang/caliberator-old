class Author < ActiveRecord::Base
  has_and_belongs_to_many :books, :join_table => "books_authors_link", :foreign_key => "author", :association_foreign_key => "book"
end
