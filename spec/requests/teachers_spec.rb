require 'rails_helper'

RSpec.describe 'Teacher Requests', type: :request do
  describe 'GET /teachers' do
    it 'returns a successful response' do
      get teachers_url

      expect(response).to be_successful
    end
  end

  describe 'GET /teachers/new' do
    it 'returns a successful response' do
      get new_teacher_url

      expect(response).to be_successful
    end
  end

  describe 'POST /teachers' do
    let(:school) { create(:school) }
    let(:teacher_params) {
      {
        first_name: 'Nice',
        last_name: 'Teacher',
        school_id: school.id
      }
    }

    it 'creates a teacher and redirects to the teacher show page' do
      expect {
        post(teachers_url, params: { teacher: teacher_params })
      }.to change { Teacher.count }.by(1)

      expect(response).to redirect_to(teacher_url(Teacher.last))
    end
  end

  describe 'GET /teachers/:id' do
    let(:teacher) { create(:teacher) }

    it 'returns a successful response' do
      get teacher_url(teacher)

      expect(response).to be_successful
    end
  end

  describe 'GET /teachers/:id/edit' do
    let(:teacher) { create(:teacher) }

    it 'returns a successful response' do
      get edit_teacher_url(teacher)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /teachers/:id' do
    let(:teacher) { create(:teacher) }
    let(:teacher_params) { { first_name: new_name } }
    let(:new_name) { 'New School' }

    it 'updates the teacher and redirects to the teacher show page' do
      patch teacher_url(teacher, params: { teacher: teacher_params })

      expect(teacher.reload.first_name).to eq(new_name)
      expect(response).to redirect_to(teacher_url(teacher))
    end
  end

  describe 'DELETE /teachers/:id' do
    let!(:teacher) { create(:teacher) }

    it 'deletes the teacher and redirect to the index page' do
      expect {
        delete teacher_url(teacher)
      }.to change { Teacher.count }.by(-1)

      expect(response).to redirect_to(teachers_url)
    end
  end
end
