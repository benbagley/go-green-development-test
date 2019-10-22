class UsersController < ApplicationController
  def show
    @user = HTTParty.get('https://jsonplaceholder.typicode.com/users/' + params[:id], :headers => {'Content-Type' => 'application/json'})

    @albums = HTTParty
      .get('https://jsonplaceholder.typicode.com/albums', :headers => {'Content-Type' => 'application/json'})
      .select{|a| a['userId'] == @user['id']}
      .paginate(:page => params[:page], :per_page => 6)
  end
end
