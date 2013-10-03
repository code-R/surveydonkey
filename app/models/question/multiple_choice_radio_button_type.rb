class Question::MultipleChoiceRadioButtonType < Question
  has_many :options, dependent: :destroy, foreign_key: 'question_id'

  before_save :create_options

  def option_names
    @option_names || options.pluck(:name).join(';')
  end

  private
    def create_options
      option_names.lines.each do |name|
        self.options << Option.create(name: name.chomp)
      end
    end
end