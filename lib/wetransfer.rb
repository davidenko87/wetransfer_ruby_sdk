require 'faraday'
require 'json'
require 'dotenv'
Dotenv.load
require 'pry'

require 'wetransfer/version'
require 'wetransfer/client'
require 'wetransfer/authorizer'
require 'wetransfer/transfer'
require 'wetransfer/transfer_builder'
require 'wetransfer/item'
require 'wetransfer/item_builder'

module WeTransfer
end
