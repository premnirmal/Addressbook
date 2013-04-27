module EntriesHelper
  def avatar(entry,width)
    if width > 100
      cl_image_tag(entry.avatar.blank? ? 'default.jpg' : entry.avatar,
                   width: width, crop: 'fill', radius: 20)
    else
      cl_image_tag(entry.avatar.blank? ? 'default.jpg' : entry.avatar,
                   width: width, crop: 'fill')
    end
  end
end
