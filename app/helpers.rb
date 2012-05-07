class NSBundleLoadingError < StandardError; end

module MainBundle

  def MainBundle.loadJSON(path)
    file = NSBundle.mainBundle.pathForResource(path, ofType:'json')
    perror = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfFile(file, options:0, error:perror)
    if !data then raise NSBundleLoadingError, perror[0] end
    json = NSJSONSerialization.JSONObjectWithData(data, options:0, error:perror)
    if !json then raise NSBundleLoadingError, perror[0] end
    return json
  end

end

# Open up a UIKit class to add some convenience methods.
class UIView

  def whenTapped(&proc)
    self.userInteractionEnabled = true
    self.addGestureRecognizer(UITapGestureRecognizer.alloc.initWithTarget(proc, action:'call'))
    @recognizers ||= {}
    @recognizers["#{proc}"] = proc
  end

end

