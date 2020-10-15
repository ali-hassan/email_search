class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @emails = []
    unless(params[:first_name].blank? && params[:last_name].blank? && params[:url].blank?)
      first_name = params[:first_name]
      last_name = params[:last_name]
      url = params[:url]
      @emails = [
      "#{first_name}.#{last_name}@#{params[:url]}",
      "#{first_name}@#{params[:url]}",
      "#{first_name}@#{params[:url]}",
      "#{first_name}.#{last_name}@#{params[:url]}",
      "#{first_name[0.1]}.#{last_name}@#{params[:url]}",
      "#{first_name[0.1]}#{last_name[0.1]}@#{params[:url]}"]
    end
    @emails.each do |email|
      is_found = User.search(email)
      if is_found
        @user = User.create email: email, first_name: first_name, last_name: last_name, url: url
      end
      @user.present? && return
    end
    @user.present? && @users << @user
  end
end
