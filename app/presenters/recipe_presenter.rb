require 'delegate'
class RecipePresenter < SimpleDelegator

  def model
    __getobj__
  end

  def time
    if model.preparation_time.nil?
      outputString = "n/a"
    else
      hours, minutes = model.preparation_time.divmod(60)
      outputString = hours.to_s + "h " + minutes.to_s + "min"
    end
    return outputString
  end

  def servings
    if model.servings.nil?
      'n/a'
    else
      "#{model.servings} servings"
    end
  end
end
