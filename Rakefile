$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  app.identifier = 'org.ianp.MagicBall'
  app.name = 'Magic Ball'
  app.icons << 'icon.png'
  app.interface_orientations = [:portrait]
end

desc 'compiles interfaces/*.xib to resources/*.nib'
task :compile_interfaces do
  Dir.glob(File.join('interfaces', '*.xib')).each do |path|
    basename = File.basename path, '.xib'
    out_path = "resources/#{basename}.nib"
    puts "compiling #{path} to #{out_path}"
    command = "ibtool --compile #{out_path} #{path}"
    system command
  end
end
