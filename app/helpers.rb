# We want to handle errors in a nicer way, and can take advantage of Ruby's
# multiple-return values to do this.
module JSON

  def JSON.loadResource(path)
    file = NSBundle.mainBundle.pathForResource(path, ofType:'json')
    perror = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfFile(file, options:0, error:perror)
    if !data then return nil, perror[0] end
    json = NSJSONSerialization.JSONObjectWithData(data, options:0, error:perror)
    if !json then return nil, perror[0] end
    return json, nil
  end

end

# Open up a UIKit class to add some convenience methods.
class UIView

  def whenTapped(&proc)
    self.userInteractionEnabled = true
    self.addGestureRecognizer(UITapGestureRecognizer.alloc.initWithTarget(proc, action:'call'))
    @recognizers = {} unless @recognizercs
    @recognizers["#{proc}"] = proc
  end

end

