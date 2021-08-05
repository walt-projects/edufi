require 'rails_helper'

RSpec.describe 'Enrollments Management', type: :system do
  let(:school) { create(:school) }

  describe 'visiting the index page' do
    let!(:enrollment_1) { create(:enrollment, school: school) }
    let!(:enrollment_2) { create(:enrollment, school: school) }

    specify do
      visit school_enrollments_url(school)

      expect(page).to have_text('Enrollments')
      expect(page).to have_text(enrollment_1.cohort.name)
      expect(page).to have_text(enrollment_2.cohort.name)
    end
  end

  describe 'creating a enrollment' do
    let!(:school) { create(:school) }
    let!(:student) { create(:student, school: school) }
    let!(:cohort) { create(:cohort, school: school) }

    specify do
      visit school_url(school)
      click_on 'Manage Enrollments'
      click_on 'New Enrollment'

      select(student.full_name, from: 'Student')
      select(cohort.name, from: 'Cohort')
      click_on 'Create Enrollment'

      expect(page).to have_text('Enrollment was successfully created')
      expect(page).to have_text(cohort.name)
      expect(page).to have_text(student.full_name)
    end
  end

  describe 'updating a enrollment' do
    let!(:school) { create(:school) }
    let!(:enrollment) { create(:enrollment, school: school) }
    let!(:new_student) { create(:student, school: school) }

    specify do
      visit school_url(school)
      click_on 'Manage Enrollments'
      click_on 'Edit', match: :first

      select(new_student.full_name, from: 'Student')
      click_on 'Update Enrollment'

      expect(page).to have_text('Enrollment was successfully updated')
      expect(page).to have_text(enrollment.cohort.name)
      expect(page).to have_text(new_student.full_name)
    end
  end

  describe 'destroying a enrollment', js: true do
    let!(:school) { create(:school) }
    let!(:enrollment) { create(:enrollment, school: school) }

    specify do
      visit school_url(school)
      click_on 'Manage Enrollments'

      accept_confirm do
        click_on 'Destroy', match: :first
      end

      expect(page).to have_text('Enrollment was successfully destroyed')
    end
  end
end
