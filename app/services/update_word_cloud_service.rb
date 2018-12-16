class UpdateWordCloudService
  attr_reader :product, :responses_to_index

  QUESTIONS_TO_INDEX = ["main_benefits", "ideal_customer", "recommended_improvements"].freeze

  def self.call(product: product)
    new(product).call
  end

  def initialize(product)
    @product = product
    @responses_to_index = product.survey_responses.nonindexed
  end

  def call
    responses_to_index.each do |response|
      branch = response.disappointment
      QUESTIONS_TO_INDEX.each do |question|
        words_for_question = index_words_for_question(response: response, question: question)
        words_for_question.each do |word, count|
          word_cloud_words[branch] ||= {}
          word_cloud_words[branch][question] ||= {}
          word_cloud_words[branch][question][word] ||= 0
          word_cloud_words[branch][question][word] += count
        end
      end
      response.update(indexed: true)
    end
    word_cloud.save!
  end

  def word_cloud
    @_word_cloud ||= begin
      product.word_cloud || product.build_word_cloud
    end
  end

  def word_cloud_words
    word_cloud.words
  end

  def index_words_for_question(response:, question:)
    words_for_answer = {}
    answer = response.public_send(question)
    answer.to_s.split(/\s/).each do |word|
      cleaned_word = clean_word(word)
      if indexable_word?(cleaned_word)
        words_for_answer[cleaned_word] ||= 0
        words_for_answer[cleaned_word] += 1
      end
    end
    words_for_answer
  end

  def clean_word(word)
   word.gsub(/[^a-z ]/i, '').downcase
 end

 def indexable_word?(cleaned_word)
   cleaned_word.present? && !UpdateWordCloudService::INSIGNIFICANT_WORDS.include?(cleaned_word)
 end
end
