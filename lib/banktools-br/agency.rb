module BanktoolsBR
  class Agency
    # Construct Agency object
    #
    # @param [String] bank code according to BC
    # @param [String] bank agency number
    # @return the object
    def initialize(bank_code, bank_agency)
      @bank_code = bank_code
      @bank_agency = bank_agency
    end

    # Validates agency based on bank code.
    #
    # @return [true, false]
    # @raise [BanktoolsBR::UnsupportedBank] if bank code is not supported.
    def valid?
      case @bank_code
      when '001'
        BanktoolsBR::Banks::BB::Agency.new(@bank_agency).valid?
      when '033'
        BanktoolsBR::Banks::Santander::Agency.new(@bank_agency).valid?
      when '041'
        BanktoolsBR::Banks::Banrisul::Agency.new(@bank_agency).valid?
      when '104'
        BanktoolsBR::Banks::CaixaEconomica::Agency.new(@bank_agency).valid?
      when '237'
        BanktoolsBR::Banks::Bradesco::Agency.new(@bank_agency).valid?
      when '341'
        BanktoolsBR::Banks::Itau::Agency.new(@bank_agency).valid?
      when '399'
        BanktoolsBR::Banks::HSBC::Agency.new(@bank_agency).valid?
      when '745'
        BanktoolsBR::Banks::Citybank::Agency.new(@bank_agency).valid?
      else
        raise BanktoolsBR::UnsupportedBank, "Bank: #{@bank_code} is not supported."
      end
    end
  end
end
