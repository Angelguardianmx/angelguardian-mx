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



  def self.query(query, category=false, per_page=20, picture_only=false, vlog=false)
    vlog = vlog || nil
    Crowdblog::Post.search do
      fulltext query
      with :state, 'published'
      with :picture_only, true if picture_only
      with :vlog, vlog
      with :category_name, category if category
      with(:published_at).less_than Time.now
      order_by :published_at, :desc
      paginate page: 1, per_page: per_page
    end
  end

end
