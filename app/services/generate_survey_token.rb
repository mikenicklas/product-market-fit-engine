require 'digest'

class GenerateSurveyToken
  attr_reader :email, :product_name

  def self.call(email:, product_name:)
    new(email, product_name).call
  end

  def initialize(email, product_name)
    @email = email
    @product_name = product_name
  end

  def call
    Digest::MD5.hexdigest "#{email}_#{product_name}"
  end
end
