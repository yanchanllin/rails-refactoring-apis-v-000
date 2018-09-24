class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
     gits = GithubService.new
     session[:token] = gits.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
     session[:username] = gits.get_username
 
     redirect_to '/'
   end
 end