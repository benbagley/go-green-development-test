require 'will_paginate/array'

class AlbumsController < ApplicationController
  def index
    @albums = HTTParty.get('https://jsonplaceholder.typicode.com/albums', :headers => {'Content-Type' => 'application/json'}).paginate(:page => params[:page], :per_page => 10)
    @albumPhotos = HTTParty.get('https://jsonplaceholder.typicode.com/photos?albums/', :headers => {'Content-Type' => 'application/json'})
    @users = HTTParty.get('https://jsonplaceholder.typicode.com/users', :headers => {'Content-Type' => 'application/json'})
  end

  def show
    @album = HTTParty.get('https://jsonplaceholder.typicode.com/albums/' + params[:id], :headers => {'Content-Type' => 'application/json'})
    @albumPhotos = HTTParty.get('https://jsonplaceholder.typicode.com/photos?album=' + params[:id], :headers => {'Content-Type' => 'application/json'}).paginate(:page => params[:page], :per_page => 10)
    @user = HTTParty.get('https://jsonplaceholder.typicode.com/users/' + params[:id], :headers => {'Content-Type' => 'application/json'})
  end
end
