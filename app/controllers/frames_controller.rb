class FramesController < ApplicationController
  before_action :set_frame, only: %i[ show update destroy ]

  # GET /frames
  def index
    @frames = Frame.all

    render json: @frames
  end

  # GET /frames/1
  def show
    render json: @frame.as_json(include: :images).merge(
      images: @frame.images.map do |image|
        url_for(image)
      end
    )
  end

  # POST /frames
  def create
    @frame = Frame.new(frame_params.except(:images))
    images = params[:frame][:images]

    if images
      images.each do |image|
        @frame.images.attach(image)
      end
    end

    if @frame.save
      render json: @frame, status: :created, location: @frame
    else
      render json: @frame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frames/1
  def update
    # images = params[:frame][:images]

    if @frame.update(frame_params)
      render json: @frame
    else
      render json: @frame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frames/1
  def destroy
    @frame.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frame
      @frame = Frame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def frame_params
      params.require(:frame).permit(images: [])
    end
end
