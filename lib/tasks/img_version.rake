namespace :img do
  desc 'recreate versions'
  task :recreate => :environment do
    Crowdblog::Post.all.each do |post|
      unless post.image.blank?
        post.image.recreate_versions!
        post.save!
      end
    end
  end
end
