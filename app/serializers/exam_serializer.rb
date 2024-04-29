class ExamSerializer < ActiveModel::Serializer
  attributes :id, :name, :college

  def college
    ActiveModelSerializers::SerializableResource.new(object.college,
      serializer: CollegeSerializer)
  end
end
