module EntriesHelper
  def avatar(entry,width)
    cl_image_tag(@entry.avatar.blank? ? 'default.jpg' : @entry.avatar,
                 width: width, crop: 'fill')
  end
end
