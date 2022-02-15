class AdminController < ApplicationController
  before_action :can_access?

  # display accounts list
  def accounts
    @accounts = Account.where(admin: false)
  end

  # function that prevent unregistered users to access admin panel
  def can_access?
    @show_sidebar = true
    unless current_account.admin?
      redirect_to root_url, flash: {danger: "You do not have access to view this page"} and return
    end
  end
end