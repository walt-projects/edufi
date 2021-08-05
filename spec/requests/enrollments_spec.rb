require 'rails_helper'

RSpec.describe 'Enrollment Requests', type: :request do
  describe 'GET /enrollments' do
    it 'returns a successful response' do
      get enrollments_url

      expect(response).to be_successful
    end
  end

  describe 'GET /enrollments/new' do
    it 'returns a successful response' do
      get new_enrollment_url

      expect(response).to be_successful
    end
  end

  describe 'POST /enrollments' do
    let(:enrollment_params) {
      {
        cohort_id: cohort.id,
        start_date: 1.month.ago,
        end_date: 3.month.from_now,
        school_id: school.id,
        student_id: student.id
      }
    }

    it 'creates an enrollment and redirects to the enrollment show page' do
      expect {
        post(enrollments_url, params: { enrollment: enrollment_params })
      }.to change { Enrollment.count }.by(1)

      expect(response).to redirect_to(enrollment_url(Enrollment.last))
    end
  end

  describe 'GET /enrollments/:id' do
    let(:enrollment) { create(:enrollment) }

    it 'returns a successful response' do
      get enrollment_url(enrollment)

      expect(response).to be_successful
    end
  end

  describe 'GET /enrollments/:id/edit' do
    let(:enrollment) { create(:enrollment) }

    it 'returns a successful response' do
      get edit_enrollment_url(enrollment)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /enrollments/:id' do
    let(:enrollment) { create(:enrollment) }
    let(:enrollment_params) { { start_date: new_start_date } }
    let(:new_start_date) { 2.days.ago }

    it 'updates the enrollment and redirects to the enrollment show page' do
      patch enrollment_url(enrollment, params: { enrollment: enrollment_params })

      expect(enrollment.reload.start_date).to eq(new_start_date)
      expect(response).to redirect_to(enrollment_url(enrollment))
    end
  end

  describe 'DELETE /enrollments/:id' do
    let!(:enrollment) { create(:enrollment) }

    it 'deletes the enrollment and redirect to the index page' do
      expect {
        delete enrollment_url(enrollment)
      }.to change { Enrollment.count }.by(-1)

      expect(response).to redirect_to(enrollments_url)
    end
  end
end
