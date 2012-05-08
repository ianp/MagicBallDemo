class MagicViewController < UIViewController

  def viewDidLoad
    @magicBall = MagicBall.new
    @label = view.subviews[0]

    view.image = UIImage.imageNamed('background.png')
    view.whenTapped do
      UIView.animateWithDuration(0.75,
        animations:lambda {
          @label.alpha = 0
          @label.transform = createTransform(:out)
        },
        completion:lambda { |finished|
          @label.text = @magicBall.answer
          @label.transform = createTransform(:in)
          UIView.animateWithDuration(0.75,
            animations:lambda {
              @label.alpha = 1
              @label.transform = CGAffineTransformIdentity
            })
        })
    end
  end

private

  def createTransform(dir)
    r = Math::PI
    t = -view.bounds.size.width
    if dir == :out then r = -r; t = -t end
    CGAffineTransformTranslate(
      CGAffineTransformRotate(
        CGAffineTransformMakeScale(0.1, 0.1), r), t, 0)
  end

end

