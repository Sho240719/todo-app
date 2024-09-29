module BoardDecorator
  def show_name
    self.user.email.split('@').first
  end

  def display_updated_at
    I18n.l(self.updated_at, format: :default)
  end
end