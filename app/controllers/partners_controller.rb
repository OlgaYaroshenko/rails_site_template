class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :check_if_user_access, only: [:create, :update, :destroy, :edit, :new]

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.mobile { render mobile: @partners }
      # format json for android app
      format.json { render json: @partners }
      format.xml { render xml: @partners }
    end
  end

  def index_view
        if params[:country]
          @partners = Partner.paginate(page: params[:page])
          @stores = Partner.where(role: "Store", visible: true, country: params[:country]).paginate(page: params[:page])
          @delivery_companies = Partner.where(role: "Delivery company", visible: true, country: params[:country]).paginate(page: params[:page])
          @partners_r = Partner.where(role: "Partner", visible: true, country: params[:country]).paginate(page: params[:page])
          @companies = Partner.where(role: "Company", visible: true, country: params[:country]).paginate(page: params[:page])
        else
          @partners = Partner.paginate(page: params[:page])
          @stores = Partner.where(role: "Store", visible: true).paginate(page: params[:page])
          @delivery_companies = Partner.where(role: "Delivery company", visible: true).paginate(page: params[:page])
          @partners_r = Partner.where(role: "Partner", visible: true).paginate(page: params[:page])
          @companies = Partner.where(role: "Company", visible: true).paginate(page: params[:page])
        end
    if I18n.locale == :ru || I18n.locale == :ua

    else

    end
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'Partner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @partner }
      else
        format.html { render action: 'new' }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        if params[:partner][:image].blank?
          if @partner.crop_y == "0"
          else
            if(!@partner.crop_x.blank? && !@partner.crop_y.blank? &&
                !@partner.crop_w.blank? &&  !@partner.crop_h.blank?)
              @partner.image.reprocess!
            end
          end
        end
        format.html { redirect_to @partner, notice: 'Partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to partners_url }
      format.json { head :no_content }
    end
  end

  def check_if_user_access
    if current_user && current_user.admin?
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:partner).permit(:name, :site, :visible, :role, :country, :image)
    end
end
