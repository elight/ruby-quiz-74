require 'helper'

class MarkovGenerator
  def train_with(source_data)
  end

  def generate_string_for(seed_word)
    ""
  end
end



class TestMarkovs < MiniTest::Spec
  describe "Simplest possible Markov Chain example" do
    before do
      source_data = "fuck you"
      @generator = MarkovGenerator.new
      @generator.train_with source_data
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
end
