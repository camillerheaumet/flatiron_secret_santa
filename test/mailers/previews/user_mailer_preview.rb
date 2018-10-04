# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def secret_santa_preview
      ExampleMailer.sample_email(Draw.first)
    end
end
