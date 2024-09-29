module TaskDecorator
  def show_name
    self.user.email.split('@').first
  end
end
