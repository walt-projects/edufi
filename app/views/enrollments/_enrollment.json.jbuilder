json.extract! enrollment, :id, :school_id, :student_id, :cohort_id, :start_date, :end_date, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
