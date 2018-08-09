class HomeController < ApplicationController
  def index
    @hash_crypto = StartScrap.new.perform
     @value = params["crypto_form"]
  end

  def indice_crypto
  end
end
