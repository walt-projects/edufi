require 'rails_helper'

RSpec.describe 'Curriculum Requests', type: :request do
  describe 'GET /curriculums' do
    it 'returns a successful response' do
      get curriculums_url

      expect(response).to be_successful
    end
  end

  describe 'GET /curriculums/new' do
    it 'returns a successful response' do
      get new_curriculum_url

      expect(response).to be_successful
    end
  end

  describe 'POST /curriculums' do
    let(:curriculum_params) {
      {
        capacity: 3,
        description: 'Nice curriculum',
        title: 'History'
      }
    }

    it 'creates a curriculum and redirects to the curriculum show page' do
      expect {
        post(curriculums_url, params: { curriculum: curriculum_params })
      }.to change { Curriculum.count }.by(1)

      expect(response).to redirect_to(curriculum_url(Curriculum.last))
    end
  end

  describe 'GET /curriculums/:id' do
    let(:curriculum) { create(:curriculum) }

    it 'returns a successful response' do
      get curriculum_url(curriculum)

      expect(response).to be_successful
    end
  end

  describe 'GET /curriculums/:id/edit' do
    let(:curriculum) { create(:curriculum) }

    it 'returns a successful response' do
      get edit_curriculum_url(curriculum)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /curriculums/:id' do
    let(:curriculum) { create(:curriculum) }
    let(:curriculum_params) { { title: new_title } }
    let(:new_title) { 'New History' }

    it 'updates the curriculum and redirects to the curriculum show page' do
      patch curriculum_url(curriculum, params: { curriculum: curriculum_params })

      expect(curriculum.reload.title).to eq(new_title)
      expect(response).to redirect_to(curriculum_url(curriculum))
    end
  end

  describe 'DELETE /curriculums/:id' do
    let!(:curriculum) { create(:curriculum) }

    it 'deletes the curriculum and redirect to the index page' do
      expect {
        delete curriculum_url(curriculum)
      }.to change { Curriculum.count }.by(-1)

      expect(response).to redirect_to(curriculums_url)
    end
  end
end
