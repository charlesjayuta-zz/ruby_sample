require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'renders index' do
      get :index
      expect(response.status).to render_template('index')
    end
  end
end
