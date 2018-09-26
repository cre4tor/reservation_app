class FpsController < ApplicationController
  before_action :set_fp, only: [:show, :edit, :update, :destroy]

  # GET /fps
  # GET /fps.json
  def index
    @fps = Fp.all
  end

  # GET /fps/1
  # GET /fps/1.json
  def show
  end

  # GET /fps/new
  def new
    @fp = Fp.new
  end

  # GET /fps/1/edit
  def edit
  end

  # POST /fps
  # POST /fps.json
  def create
    @fp = Fp.new(fp_params)

    respond_to do |format|
      if @fp.save
        format.html { redirect_to @fp, notice: 'Fp was successfully created.' }
        format.json { render :show, status: :created, location: @fp }
      else
        format.html { render :new }
        format.json { render json: @fp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fps/1
  # PATCH/PUT /fps/1.json
  def update
    respond_to do |format|
      if @fp.update(fp_params)
        format.html { redirect_to @fp, notice: 'Fp was successfully updated.' }
        format.json { render :show, status: :ok, location: @fp }
      else
        format.html { render :edit }
        format.json { render json: @fp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fps/1
  # DELETE /fps/1.json
  def destroy
    @fp.destroy
    respond_to do |format|
      format.html { redirect_to fps_url, notice: 'Fp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fp
      @fp = Fp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fp_params
      params.require(:fp).permit(:first_name, :last_name, :user_id, :account_id)
    end
end
