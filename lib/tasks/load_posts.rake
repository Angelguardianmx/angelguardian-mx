namespace :posts do
  desc 'import post'
  task :import => :environment do
    file = File.open("./public/all_post_only.csv")
    Post.import_posts file
  end
end
