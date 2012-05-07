class AppDelegate
  def application(application, didFinishLaunchingWithOptions:options)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = NSBundle.mainBundle.loadNibNamed('MagicBallView', owner:self, options:nil).first
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
