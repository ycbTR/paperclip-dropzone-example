class PhotosController < ApplicationController


def index
@photos = Photo.where(:code => params[:code])
end
  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    @photo.code = SecureRandom.hex(2)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render nothing: true
  end
end
