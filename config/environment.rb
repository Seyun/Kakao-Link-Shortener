# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Klink::Application.initialize!

Encoding.default_internal = 'UTF-8'