#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle

#Before do 
Before("@firstcase") do   
  $driver.start_driver
  elements_file = File.read('./features/lib/android_elements_table.json')
  $element_table = JSON.parse(elements_file)

   #keystore_file = File.read('./features/lib/keystore.json')
  keystore_file = File.read('./features/step_definitions/keystore.json')
  $keystore = JSON.parse(keystore_file)

  if is_element_displayed("id", $element_table["startBtnOflandingPage"])
    $driver.find_element(id:$element_table["startBtnOflandingPage"]).click
    sleep(1)
  end
end

Before do |scenario|
#$driver.launch_app
end

#After do 
After("@last") do 
  # Do something after each scenario.
  #$driver.remove_app('com.isuncloud.tidewallet')
  #@driver.pull_file('/storage/emulated/0/Download/ETH')
  $driver.driver_quit
end


#def take_screenshot scenario
#  screenshot_path = "./Screenshoot/#{scenario}.png"
#  screenshot screenshot_path
#end

After do |scenario|
  #take_screenshot scenario.name
#   # Do something after each scenario.
#   # The +scenario+ argument is optional, but
#   # if you use it, you can inspect status with
#   # the #failed?, #passed? and #exception methods.
    #screenshot = "./FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    #$driver.screenshot(screenshot)
    #$driver.save_screenshot './Screenshoot/test.png'
    encoded_img = $driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/sspng')

#if scenario.failed?
#encoded_img = @browser.driver.screenshot_as(:base64)
#embed("data:image/png;base64,#{encoded_img}",'image/png')
#end
#     #Do something if scenario fails.
#   end

end

#Tagged hooks

# Before('@Ex_tag1, @Ex_tag2') do
#   # This will only run before scenarios tagged
#   # with @cucumis OR @sativus.
# end

AfterStep() do
  sleep(1)
end