namespace :post do
  desc 'generate short urls'
  task :short_urls => :environment do
    Crowdblog::Post.all.each do |post|
      unless post.published_at.nil? || post.id.nil? || post.short_url || post.permalink.nil?
        post.generate_short_url
        post.save!
      end
    end
  end
end

