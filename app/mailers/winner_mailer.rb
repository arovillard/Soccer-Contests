class WinnerMailer < ActionMailer::Base

  # def winner_email(user, game, raffle_number)
  #   @user = user
  #   @game = game
  #   @raffle_number = raffle_number
  #   mail(from: "from@example.com", to: user.email, subject: 'Your guess was right!!')
  # end

  def winner_email_template (user, game, raffle_number)
    @user = user
    @game = game
    @raffle_number = raffle_number
    mail(from: "apostaryapostar@gmail.com", to: user.email, subject: "Felicitaciones! Usted Acerto!")
  end
end
