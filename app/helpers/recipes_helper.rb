module RecipesHelper
  def displayTime(time)
    if time.nil?
      outputString = "n/a"
    else
      hours, minutes = time.divmod(60)
      outputString = hours.to_s + "h " + minutes.to_s + "min"
    end
    return outputString
  end
end
