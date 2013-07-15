class Post < Crowdblog::Post
  belongs_to :author, :class_name => "User"
  belongs_to :publisher, :class_name => "User"

  def self.grouped_for_archive
    published_and_ordered.group_by {|p| p.published_at.year }.
        inject({}) { |mem, value| mem[value[0]] = value[1].
            group_by {|p| p.published_at.strftime("%B")}; mem }
  end

  def dropbox_name
    "#{id}-#{permalink}.md"
  end

  searchable do
    text :title, :body
    string :state
    time :published_at
    string :category_name do
      category.name if category
    end
  end

  def self.query(query, category=false, per_page=20)
    Post.search do
      fulltext query
      with :state, 'published'
      with :category_name, category if category
      with(:published_at).less_than Time.now
      order_by :published_at, :desc
      paginate page: 1, per_page: per_page
    end
  end

end
