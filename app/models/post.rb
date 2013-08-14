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



  def self.query(query, category=false, per_page=20, picture_only=false, vlog=false, opinion=false)
    vlog = vlog || nil
    opinion = opinion || nil
    Crowdblog::Post.search do
      fulltext query
      with :state, 'published'
      with :picture_only, true if picture_only
      with :vlog, vlog
      with :opinion, opinion
      with :category_name, category if category
      with(:published_at).less_than Time.now
      order_by :published_at, :desc
      paginate page: 1, per_page: per_page
    end
  end

  def self.import_posts(file)
    CSV.foreach(file.path, headers: true) do |row|
      post = row.to_hash
      unless Crowdblog::Post.find_by_title post['post_title']
        img = /\< *[img][^\>]*[src] *= *[\"\']{0,1}([^\"\'\ >]*)/.match(post['post_content'])[1]
        category = Crowdblog::Category.find_or_create_by_name post['name']
        new_post = Crowdblog::Post.new title: post['post_title'], body: post['post_content'], remote_image_url: img, category_id: category.id
        new_post.save
        new_post.regenerate_permalink
        new_post.author = User.find(3)
        new_post.publish_as_publisher
        new_post.published_at = post['post_date']
        new_post.save
      end
    end
  end

end
