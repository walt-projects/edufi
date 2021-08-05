require 'rails_helper'

RSpec.describe 'Cohort Requests', type: :request do
  describe 'GET /cohorts' do
    it 'returns a successful response' do
      get cohorts_url

      expect(response).to be_successful
    end
  end

  describe 'GET /cohorts/new' do
    it 'returns a successful response' do
      get new_cohort_url

      expect(response).to be_successful
    end
  end

  describe 'POST /cohorts' do
    let!(:school) { create(:school) }
    let!(:teacher) { create(:teacher, school: school) }
    let!(:curriculum) { create(:curriculum) }
    let(:cohort_params) {
      {
        name: 'Nice cohort',
        school_id: school.id,
        teacher_id: teacher.id,
        curriculum_id: curriculum.id
      }
    }

    it 'creates a cohort and redirects to the cohort show page' do
      expect {
        post(cohorts_url, params: { cohort: cohort_params })
      }.to change { Cohort.count }.by(1)

      expect(response).to redirect_to(cohort_url(Cohort.last))
    end
  end

  describe 'GET /cohorts/:id' do
    let(:cohort) { create(:cohort) }

    it 'returns a successful response' do
      get cohort_url(cohort)

      expect(response).to be_successful
    end
  end

  describe 'GET /cohorts/:id/edit' do
    let(:cohort) { create(:cohort) }

    it 'returns a successful response' do
      get edit_cohort_url(cohort)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /cohorts/:id' do
    let(:cohort) { create(:cohort) }
    let(:cohort_params) { { name: new_name } }
    let(:new_name) { 'New Name' }

    it 'updates the cohort and redirects to the cohort show page' do
      patch cohort_url(cohort, params: { cohort: cohort_params })

      expect(cohort.reload.name).to eq(new_name)
      expect(response).to redirect_to(cohort_url(cohort))
    end
  end

  describe 'DELETE /cohorts/:id' do
    let!(:cohort) { create(:cohort) }

    it 'deletes the cohort and redirect to the index page' do
      expect {
        delete cohort_url(cohort)
      }.to change { Cohort.count }.by(-1)

      expect(response).to redirect_to(cohorts_url)
    end
  end
end
