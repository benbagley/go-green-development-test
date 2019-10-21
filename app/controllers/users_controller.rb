class UsersController < ApplicationController
  def show
    @user = HTTParty
      .get('https://jsonplaceholder.typicode.com/users/' + params[:id], :headers => {'Content-Type' => 'application/json'})
  end
end
