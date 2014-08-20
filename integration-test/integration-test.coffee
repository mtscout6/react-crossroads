_ = require 'lodash'
webdriver = require 'selenium-webdriver'
Key = webdriver.Key
driver = new webdriver.Builder()
  .withCapabilities webdriver.Capabilities.chrome()
  .build()

chai = require 'chai'
{expect} = chai
chaiWebdriver = require 'chai-webdriver'
chai.use chaiWebdriver(driver)
should = chai.should()

_.extend global, {_, expect, should, webdriver, driver, chai, Key}

require './locations/location-tests'

after ->
  driver.quit()