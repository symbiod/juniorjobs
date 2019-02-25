# frozen_string_literal: true

require 'rspec'
require 'watir'
require 'page-object'
require 'data_magic'
require 'factory_bot'
require 'database_cleaner'
require 'pry'

World(PageObject::PageFactory)

Dir['./features/support/helpers/*.rb'].each { |file| require file }
require './features/support/models/user'

include NavigationHelpers
include ExpectationHelpers
