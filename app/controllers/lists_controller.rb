class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    # @movies = @list.movies
    @bookmarks = @list.bookmarks
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      @list.save
      redirect_to @list, notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      redirect_to root, notice: "list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to root_url, notice: "list was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :phone_number, :address, :category, :list_image)
    end
  end
