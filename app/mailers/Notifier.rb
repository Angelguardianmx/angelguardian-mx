class Notifier < ActionMailer::Base
  add_template_helper(ApplicationHelper)

  default from: 'hbustillos@radiolevy.com'

  def post_finished(post)
    @post = post
    mail(subject: "A new blog post from #{@post.author_name} has been marked as finished", to: 'editores@radiolevy.com')
  end

  def post_reviewed(post)
    @post = post
    mail(subject: "A new blog post from #{@post.author_name} has been marked as reviewed", to: 'editores@radiolevy.com')
  end
end
