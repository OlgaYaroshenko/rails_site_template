class UserMailer < ActionMailer::Base
  default from: "proalab.com@gmail.com"

  def send_newsletters(newsletter)
    @newsletter = newsletter
    @blog_title = Blog.where(id: @newsletter.blog_id).take.title
    @blog_content = Blog.where(id: @newsletter.blog_id).take.content
    if @newsletter.language == "RU"
      mail(bcc: @newsletter.to,
           subject: @newsletter.subject,
           template_path: 'user_mailer',
           template_name: 'send_newsletters')
    else
      mail(bcc: @newsletter.to,
           subject: @newsletter.subject,
           template_path: 'user_mailer',
           template_name: 'send_newsletters')
    end
  end
end
