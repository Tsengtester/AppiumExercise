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

After("@last") do 
  # Do something after each scenario.
  $driver.remove_app('com.isuncloud.tidewallet')
  #@driver.pull_file('/storage/emulated/0/Download/ETH')
  $driver.driver_quit
end

# After do |scenario|
#   # Do something after each scenario.
#   # The +scenario+ argument is optional, but
#   # if you use it, you can inspect status with
#   # the #failed?, #passed? and #exception methods.

#   if(scenario.failed?)
#     #Do something if scenario fails.
#   end
# end

#Tagged hooks

# Before('@Ex_tag1, @Ex_tag2') do
#   # This will only run before scenarios tagged
#   # with @cucumis OR @sativus.
# end

AfterStep() do
  sleep(1)
end