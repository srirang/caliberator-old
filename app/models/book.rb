class Book < ActiveRecord::Base
  has_many :datum, :foreign_key => "book"
  has_one :comment, :foreign_key => "book"
  has_and_belongs_to_many :authors, :join_table => "books_authors_link", :foreign_key => "book", :association_foreign_key => "author"


  @@basepath = "#{Rails.root}/public/Calibre Library"

  def get_filepath
    return "#{get_filedirectory}/#{get_filename}"
  end

  def get_image_path
    return "#{get_filedirectory}/#{get_image_name}"
  end

  def get_filedirectory
    return "#{get_basepath}/#{path}"
  end

  def get_basepath
    return @@basepath
  end

  def get_filename
    return "#{datum[0].name}.#{get_extension}"
  end

  def get_extension
    return "#{datum[0].format}"
  end

  def get_image_name
    if has_cover?
      return "cover.jpg"
    end
  end

  def get_summary
    if (comment == nil)
      ""
    else
      comment.text
    end
      
  end

  def get_title
    title
  end

  def get_author
    author_sort
  end

  def get_thumbnail
    if has_cover
      "#{get_filedirectory}/cover.jpeg"
    else
      ""
    end
  end

end
