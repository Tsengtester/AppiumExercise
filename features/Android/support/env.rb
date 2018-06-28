# #ruby frameworks to require
# require 'rspec/expectations'
# require 'appium_lib'
# require 'cucumber/ast'
# require 'rubygems'
 
# # Create a custom World class so we don't pollute `Object` with Appium methods
# class AppiumWorld
# end
 
# #creating an array from the data in the YML file
# # appLoginDetails = YAML.load_file("features/support/appLoginDetails.yml")
 
# #this environment variable to choose which device we would do our automated tests on
# case ENV['DEVICE_NAME']
#   when 'Android'
#   caps = Appium.load_appium_txt file: File.expand_path("../appium.txt", __FILE__), verbose: true
# end
 
# #this environment variable to choose the orientation that iOS device would be in for the automated tests.
# case ENV['DEVICE_ORIENTATION']
#   when 'portrait'
#   caps[:caps].merge!(orientation:"PORTRAIT")
#   when 'landscape'
#   caps[:caps].merge!(orientation:"LANDSCAPE")
# end

# #Display caps to make sure we are working wth the right ones
# puts caps

# $driver = Appium::Driver.new(caps)
# Appium.promote_appium_methods AppiumWorld

# World do
#   AppiumWorld.new
# end

require 'rubygems'
require 'selenium-cucumber'
require 'json'

# If platform is android or ios create driver instance for mobile browser
caps = Appium.load_appium_txt file: File.expand_path("../android_cap.txt", __FILE__), verbose: true

begin
  $driver = Appium::Driver.new(caps)
rescue Exception => e
  puts e.message
  Process.exit(0)  
end