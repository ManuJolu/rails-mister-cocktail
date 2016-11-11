module ApplicationHelper

  def image_path_with_default(cocktail)
    if cocktail.photo?
      cl_image_path(cocktail.photo.path, height: 350, crop: :fill)
    else
      image_path("logo.png")
    end
  end

end
