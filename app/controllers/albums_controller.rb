require 'will_paginate/array'

class AlbumsController < ApplicationController
  def index
    @albums = HTTParty.get('https://jsonplaceholder.typicode.com/albums', :headers => {'Content-Type' => 'application/json'}).paginate(:page => params[:page], :per_page => 10)
    @user = HTTParty.get('https://jsonplaceholder.typicode.com/users', :headers => {'Content-Type' => 'application/json'})

    @albums.each do |album|
      user = @users.first {|u| u if u.id == album.userId }
      album.merge!({ name: user.name, email: user.email })  if user.present?
    end
  end

  def show
    @album = HTTParty
      .get('https://jsonplaceholder.typicode.com/albums/' + params[:id], :headers => {'Content-Type' => 'application/json'})

    @albumPhotos = HTTParty
      .get('https://jsonplaceholder.typicode.com/photos?album=' + params[:id], :headers => {'Content-Type' => 'application/json'})
      .paginate(:page => params[:page], :per_page => 10)

    @user = HTTParty
      .get('https://jsonplaceholder.typicode.com/users/' + params[:id], :headers => {'Content-Type' => 'application/json'})
  end
end
