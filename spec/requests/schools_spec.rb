require 'rails_helper'

RSpec.describe 'School Requests', type: :request do
  describe 'GET /schools' do
    it 'returns a successful response' do
      get schools_url

      expect(response).to be_successful
    end
  end

  describe 'GET /schools/new' do
    it 'returns a successful response' do
      get new_school_url

      expect(response).to be_successful
    end
  end

  describe 'POST /schools' do
    let(:school_params) {
      {
        description: 'Nice school with great students',
        location: '4800 S Henderson St Seattle, WA 98118',
        name: 'Edufi School'
      }
    }

    it 'creates a school and redirects to the school show page' do
      expect {
        post(schools_url, params: { school: school_params })
      }.to change { School.count }.by(1)

      expect(response).to redirect_to(school_url(School.last))
    end
  end

  describe 'GET /schools/:id' do
    let(:school) { create(:school) }

    it 'returns a successful response' do
      get school_url(school)

      expect(response).to be_successful
    end
  end

  describe 'GET /schools/:id/edit' do
    let(:school) { create(:school) }

    it 'returns a successful response' do
      get edit_school_url(school)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /schools/:id' do
    let(:school) { create(:school) }
    let(:school_params) { { name: new_name } }
    let(:new_name) { 'New School' }

    it 'updates the school and redirects to the school show page' do
      patch school_url(school, params: { school: school_params })

      expect(school.reload.name).to eq(new_name)
      expect(response).to redirect_to(school_url(school))
    end
  end

  describe 'DELETE /schools/:id' do
    let!(:school) { create(:school) }

    it 'deletes the school and redirect to the index page' do
      expect {
        delete school_url(school)
      }.to change { School.count }.by(-1)

      expect(response).to redirect_to(schools_url)
    end
  end
end
