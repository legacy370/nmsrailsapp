require "test_helper"
require "socket"
require 'capybara'
require 'selenium-webdriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Capybara.register_driver :selenium_chrome_in_container do |app|
    Capybara::Selenium::Driver.new app,
      browser: :remote,
      url: "http://selenium_chrome:4444/wd/hub",
      desired_capabilities: :chrome
  end
  driven_by :selenium_chrome_in_container
    Capybara.server_host = "0.0.0.0"
    Capybara.server_port = 4000
    Capybara.app_host = 'http://web:4000'
  #
  #driver = ENV['DRIVER'] ? ENV['DRIVER'].to_sym : :headless_chrome
  #driven_by :selenium, using: driver, screen_size: [1400, 1400]
  #options = Selenium::WebDrive::
  #desired_capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
  #desired_capabilities['url'] = "http://localhost:4444/wd/hub"
  #driver = Selenium::WebDriver.for :remote, desired_capabilities: desired_capabilities

  #driven_by :selenium, using: :chrome,
  #  screen_size: [1400, 1400],
  #  options: {url: "http://chrome:4444/wd/hub"}

  #  Capybara::Selenium::Driver.new(app,
  #    :browser => :chrome,
  #    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
  #      'chromeOptions' => {
  #        'args' => [ "--window-size=200,200" ]
#
 #       }
 #     )
 #                                 ) 
 # end

  #Capybara.register_driver :https_chrome do |app|
  #  options = Selenium::WebDriver::Chrome::Options.new
  #  options.add_argument('--allow-insecure-localhost')
  #  options.add_argument('--ignore-certificate-errors')
  #  options[url: "http://chrome:4444/wd/hub"]
  #  Capybara::Selenium::Driver.new(
  #    app,
  #    browser: :chrome,
  #    capabilities: [options]
  #  )
  #end

  #Capybara.register_driver :headless_https_chrome do |app|
  #  options = Selenium::WebDriver::Chrome::Options.new
  #  options.add_argument('--headless')
  #  options.add_argument('--allow-insecure-localhost')
  #  options.add_argument('--ignore-certificate-errors')

   # Capybara::Selenium::Driver.new(
   #   app,
   #   browser: :chrome,
   #   capabilities: [options]
   # )
  #end

 #def setup
 #   host! "http://#{IPSocket.getaddress(Socket.gethostname)}"
 #   super
 #end
end
