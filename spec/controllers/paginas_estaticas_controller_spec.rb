require 'spec_helper'

describe PaginasEstaticasController do

  describe "GET 'inicio'" do
    it "returns http success" do
      get 'inicio'
      response.should be_success
    end
  end

  describe "GET 'ayuda'" do
    it "returns http success" do
      get 'ayuda'
      response.should be_success
    end
  end

  describe "GET 'acerca_de'" do
    it "returns http success" do
      get 'acerca_de'
      response.should be_success
    end
  end

end
