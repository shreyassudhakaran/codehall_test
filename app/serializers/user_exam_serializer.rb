class UserExamSerializer < ActiveModel::Serializer
  attributes :id, :user, :exam, :start_time

  def user
    ActiveModelSerializers::SerializableResource.new(object.user,
      serializer: UserSerializer)
  end

  def exam
    ActiveModelSerializers::SerializableResource.new(object.exam_window.exam,
      serializer: ExamSerializer)
  end
end
