require 'rails_helper'

RSpec.describe 'Student Requests', type: :request do
  describe 'GET /students' do
    it 'returns a successful response' do
      get students_url

      expect(response).to be_successful
    end
  end

  describe 'GET /students/new' do
    it 'returns a successful response' do
      get new_student_url

      expect(response).to be_successful
    end
  end

  describe 'POST /students' do
    let(:school) { create(:school) }
    let(:student_params) {
      {
        first_name: 'Nice',
        last_name: 'Student',
        school_id: school.id
      }
    }

    it 'creates a student and redirects to the student show page' do
      expect {
        post(students_url, params: { student: student_params })
      }.to change { Student.count }.by(1)

      expect(response).to redirect_to(student_url(Student.last))
    end
  end

  describe 'GET /students/:id' do
    let(:student) { create(:student) }

    it 'returns a successful response' do
      get student_url(student)

      expect(response).to be_successful
    end
  end

  describe 'GET /students/:id/edit' do
    let(:student) { create(:student) }

    it 'returns a successful response' do
      get edit_student_url(student)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /students/:id' do
    let(:student) { create(:student) }
    let(:student_params) { { first_name: new_name } }
    let(:new_name) { 'New School' }

    it 'updates the student and redirects to the student show page' do
      patch student_url(student, params: { student: student_params })

      expect(student.reload.first_name).to eq(new_name)
      expect(response).to redirect_to(student_url(student))
    end
  end

  describe 'DELETE /students/:id' do
    let!(:student) { create(:student) }

    it 'deletes the student and redirect to the index page' do
      expect {
        delete student_url(student)
      }.to change { Student.count }.by(-1)

      expect(response).to redirect_to(students_url)
    end
  end
  
  describe 'PATCH /students/:id/transfer' do
    let!(:student) { create(:student) }
    let(:school) { create(:school) }
    let(:school_params) { { id: school.id } }

    it 'transfer the student to another school' do
      patch student_transfer_url(student, params: { school: school_params })

      expect(student.reload.school_id).to eq(school.id)

      expect(response).to redirect_to(student_url(student))
    end
  end
end
