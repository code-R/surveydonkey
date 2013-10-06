module Question::MultipleChoiceOptions
  extend ActiveSupport::Concern

  included do
    has_many :options, dependent: :destroy, foreign_key: 'question_id'
    before_save :create_options
  end

  def option_names
    @option_names || options.pluck(:name).join(';')
  end

  def create_options
    option_names.lines.each do |name|
      self.options << Option.create(name: name.chomp)
    end
  end
end
