namespace :post do
  desc 'generate shor urls'
  task :shor_urls => :environment do
    Crowdblog::Post.all.each do |post|
      unless post.published_at.blank?
        post.generate_short_url
        post.save!
      end
    end
  end
end

