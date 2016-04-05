module WechatPay
  @extra_rest_client_options = {}
  
  class << self
    def generate_random_human_string(length)
      characters = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O))
      (0...length).map{ characters.to_a[rand(characters.size)] }.join
    end
  end

end
