require 'helper'

class MarkovGenerator
  def initialize
    @knowledge = {}
  end

  def train_with(source_data)
    tokens = source_data.split
    tokens.each_with_index do |word, index|
      if index < tokens.length
        @knowledge[word] = tokens[index+1]
      end
    end
  end

  def generate_string_for(seed_word)
    next_word = choose_word_to_follow(seed_word)
    if next_word
      "#{seed_word} #{choose_word_to_follow(seed_word)}"
    else
      ""
    end
  end

  def choose_word_to_follow(seed_word)
    @knowledge[seed_word]
  end
end



class TestMarkovs < MiniTest::Spec
  describe "Simplest possible Markov Chain example" do
    before do
      @generator = MarkovGenerator.new
    end

    describe "with seed data 'fuck you'" do
      before do
        @generator.train_with 'fuck you'
      end

      it "should output 'fuck you' when given input 'fuck'" do
        @generator.generate_string_for('fuck').must_equal 'fuck you'
      end

      it "should output '' when given input 'you'" do
        @generator.generate_string_for('you').must_equal ''
      end

      it "should output '' when given input 'ohai'" do
        @generator.generate_string_for('ohai').must_equal ''
      end
    end

    describe "with seed data 'can haz'" do
      before do
        @generator.train_with 'can haz'
      end

      it "should output 'can haz' when given input 'can'" do
        @generator.generate_string_for('can').must_equal 'can haz'
      end

      it "should output '' when given input 'haz'" do
        @generator.generate_string_for('haz').must_equal ''
      end

      it "should output '' when given input 'ohai'" do
        @generator.generate_string_for('ohai').must_equal ''
      end
    end
  end

  describe "Training the generator" do
    describe "given input 'can haz'" do
      before do
        @generator = MarkovGenerator.new
        @generator.train_with('can haz')
      end

      it "should map can -> haz'" do
        @generator.choose_word_to_follow('can').must_equal 'haz'
      end
    end
  end
end
