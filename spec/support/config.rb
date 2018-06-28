module AlphaPay

  RSpec.configure do |config|
    config.before(:each) do
      AlphaPay.setup do |s|
        s.partner_code    = 'ZZZ6'
        s.credential_code = '2c5NmzajTLeaz5xFzeKldQ3vWARqfGkU'
      end
    end
  end

end
