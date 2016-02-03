module BanktoolsBR
  class Agency
    def initialize(bank_code, bank_agency)
      @bank_code = bank_code
      @bank_agency = bank_agency
    end

    def valid?
      case @bank_code
      when '341'
        BanktoolsBR::Banks::Itau::Agency.new(@bank_agency).valid?
      else
        raise BanktoolsBR::UnsupportedBank, "Bank: #{@bank_code} is not supported."
      end
    end
  end
end