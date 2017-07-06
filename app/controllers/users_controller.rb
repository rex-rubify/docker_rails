class UsersController < ApplicationController
  def index
  end

  def login
    user = User.find_by_name(params[:name])
    if user.present?
      if user.password == params[:password]
        redirect_to "/notes/#{user.id}"
      else
        redirect_to '/'
      end
    else
      user.new(name: params[:name], password: params[:password])
      redirect_to "/notes/#{user.id}" if user.save
    end
  end
end
