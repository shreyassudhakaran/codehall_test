class CreateUserExamsService
  attr_accessor :exam_window, :params

  def initialize(params)
    @college = College.find(params[:college_id])
    @exam = @college.exams.find(params[:exam_id])
    @exam_window = @exam.exam_windows.around(params[:start_time]).first
    @params = params
  end

  def call
    ActiveRecord::Base.transaction do
      binding.pry
      raise I18n.t('exam_window.no_exams') if exam_window.blank?

      user = fetch_user
      user.user_exams.create!(start_time: params[:start_time], exam_window: exam_window)
    end
  end

  private

  def fetch_user
    user = User.find_by(phone: params[:phone_number])
    return user if user.present?

    User.create!(first_name: params[:first_name], last_name: params[:last_name],
      phone: params[:phone_number])
  end
end
