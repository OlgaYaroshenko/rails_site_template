class Partner < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true
  validates :role, presence: true
  validates :country, presence: true
  VALID_DOMAIN_REGEX = /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix
  validates :site, presence: true, format: { with: VALID_DOMAIN_REGEX }, length: {maximum: 30}


  # Avatar attached
  #has_attached_file :image, :styles => {:medium => "180x100#", :thumb => "90x50#", :large => "500x500>", :small => "50x50>", :large_m => "500x500#>", :thumb_m => "90x50>", :small_m => "90x90#"}, :default_url => "/images/:style/missing.png", :storage => :s3, :bucket => "teleport_site",
  #                  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  has_attached_file :image, :styles => {
      :medium => {:geometry => "180x100#", :processors => [:cropper, :thumbnail]},
      :thumb => {:geometry => "90x50#", :processors => [:cropper, :thumbnail]},
      :large => {:geometry => "500x500>"},
      :small => {:geometry => "50x50>", :processors => [:cropper, :thumbnail]},
      :large_m => {:geometry => "500x500#", :processors => [:cropper, :thumbnail]},
      :small_m => {:geometry => "90x90#", :processors => [:cropper, :thumbnail]},
      :thumb_m => {:geometry => "90x50>", :processors => [:cropper, :thumbnail]}
  }, :default_url => "/images/:style/missing.png", :storage => :s3, :bucket => "", :s3_protocol => :https,:s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  # Amazon s3
  def s3_credentials
    {:bucket => "", :access_key_id => "", :secret_access_key => ""}
  end

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 3.megabytes

  #Cropping
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  #attr_accessor :processing
  after_update :reprocess_avatar, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    avatar_path = (image.options[:storage] == :s3) ? image.url(style) : image.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar_path)
    #@geometry[style] ||= Paperclip::Geometry.from_file(profile_picture_path)
  end

  private

  def reprocess_avatar
    #avatar.reprocess!
    # don't crop if the user isn't updating the photo
    #   ...or if the photo is already being processed
    #return unless (cropping? && !processing)
    #self.processing = true
    #avatar.reprocess!
    #self.processing = false
  end
end
