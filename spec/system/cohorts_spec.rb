require 'rails_helper'

RSpec.describe 'Cohorts Management', type: :system do
  describe 'visiting the index page' do
    let!(:cohort_1) { create(:cohort) }
    let!(:cohort_2) { create(:cohort) }

    specify do
      visit cohorts_url

      expect(page).to have_text('Cohorts')
      expect(page).to have_text(cohort_1.name)
      expect(page).to have_text(cohort_2.name)
    end
  end

  describe 'creating a cohort' do
    let(:cohort_name) { 'Great cohort' }
    let!(:school) { create(:school) }
    let!(:teacher) { create(:teacher, school: school) }
    let!(:curriculum) { create(:curriculum) }

    specify do
      visit cohorts_url
      click_on 'New Cohort'

      fill_in 'Name', with: cohort_name
      select(school.name, from: 'School')
      select(teacher.full_name_w_school, from: 'Teacher')
      select(curriculum.title, from: 'Curriculum')
      click_on 'Create Cohort'

      expect(page).to have_text('Cohort was successfully created')
      expect(page).to have_text(cohort_name)
    end
  end

  describe 'updating a cohort' do
    let!(:cohort) { create(:cohort) }
    let(:new_cohort_name) { 'New cohort name' }

    specify do
      visit cohorts_url
      click_on 'Edit', match: :first

      fill_in 'Name', with: new_cohort_name
      click_on 'Update Cohort'

      expect(page).to have_text('Cohort was successfully updated')
      expect(page).to have_text(new_cohort_name)
    end
  end

  describe 'destroying a cohort', js: true do
    let!(:cohort) { create(:cohort) }

    specify do
      visit cohorts_url

      accept_confirm do
        click_on 'Destroy', match: :first
      end

      expect(page).to have_text('Cohort was successfully destroyed')
    end
  end
end
