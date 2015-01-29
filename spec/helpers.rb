require 'spec_helper'

module Helpers

  def request_heders
    return {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
    }
  end

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end