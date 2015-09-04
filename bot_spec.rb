require './bot'

RSpec.describe Bot do
  let(:bot) { Bot.new }
  describe "#New" do
  	it "Create robot" do
      correct_response = [nil,nil,nil]
      test_response = bot.position
      expect(test_response).to eq(correct_response)
    end
  end

  describe "#Place" do
  	context 'When valid position' do
  	  it "Places the robot at designated position" do
      	bot.place(1,1,'north')
      	correct_response = [1,1,'north']
        test_response = bot.position
      	expect(test_response).to eq(correct_response)
      end
    end
    context 'When invalid position' do
      it "Places the robot at designated position" do
        bot.place(1,7,'north')
        correct_response = [nil,nil,nil]
        test_response = bot.position
        expect(test_response).to eq(correct_response)
      end
    end
  end

  describe "#Report" do
  	context 'When placed' do
      it "Report robot position" do
        bot.place(1,1,'north')
        correct_response = [1,1,'north']
        test_response = bot.report
        expect(test_response).to eq(correct_response)
      end
    end
      context 'When not yet placed' do
      	it "Ignores command" do
        correct_response = nil
        test_response = bot.report
        expect(test_response).to eq(correct_response)
      end
    end
  end

  describe "#Move" do
    context 'When not yet placed' do
      it "Ignores command" do
      	bot.move
        correct_response = [nil,nil,nil]
        test_response = bot.position
        expect(test_response).to eq(correct_response)
      end
    end
    context 'When placed' do
      it "Moves the robot" do
        bot.place(1,1,'north')
        bot.move
        correct_response = [1,2,"north"]
        test_response = bot.report
        expect(test_response).to eq(correct_response)
      end
      it "Does not move robot past table" do
        bot.place(0,0,'south')
        bot.move
        correct_response = [0,0,'south']
        test_response = bot.report
        expect(test_response).to eq(correct_response)
      end
    end
  end

  describe "#left" do
    context 'When not placed' do
      it "Ignores command" do
        bot.left
        correct_response = [nil,nil,nil]
        test_response = bot.position
        expect(test_response).to eq(correct_response)
      end
    end
    context 'When placed' do
      it "Turns the robot left" do
        bot.place(1,1,'north')
        bot.left
        correct_response=[1,1,"west"]
        test_response = bot.position
        expect(test_response).to eq(correct_response)
      end
    end
  end

  describe "#Right" do
    context 'When not placed' do
      it "Ignores command" do
      	bot.right
        correct_response = [nil,nil,nil]
        test_response = bot.position
        expect(test_response).to eq(correct_response)
      end
    end
    context 'When placed' do
      it "Turns the robot right" do
        bot.place(1,1,'north')
        bot.right
        correct_response=[1,1,"east"]
        test_response = bot.position
        expect(test_response).to eq(correct_response)
      end
    end
  end

end