# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render inline: '', layout: true
  end
end
