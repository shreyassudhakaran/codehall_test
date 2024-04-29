class UserExamsController < ApplicationController

  def create
    user_exam = CreateUserExamsService.new(user_exam_params).call
    render_success_response(ActiveModelSerializers::SerializableResource.new(user_exam,
      serializer: UserExamSerializer))
  end

  private

  def user_exam_params
    params.permit(:first_name, :last_name, :phone_number, :college_id, :exam_id,
      :start_time)
  end
end
