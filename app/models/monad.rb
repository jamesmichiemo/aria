class Monad
  attr_reader :name, :tonality, :interval

  def initialize(name, tonality, interval)
    @name = name
    @tonality = tonality
    @interval = interval
  end

  MONADS = [
    Monad.new('G♯min', 13, 'ζ=δτ(ωρ)'),
    Monad.new('Bmaj', 13, '∠＝∞'),
    Monad.new('D♯min', 14, 'ζ=δτ(ωρ)'),
    Monad.new('F♯maj', 14, '∠＝∞'),
    Monad.new('A♯min', 15, 'ζ=δτ(ωρ)'),
    Monad.new('C♯maj', 15, '∠＝∞'),
    Monad.new('Fmin', 16, 'ζ=δτ(ωρ)'),
  ]

  def self.monads
    MONADS
  end

  def self.by_name(name)
    monads.find { |m| m.name == name }
  end

    # if string == "G♯maj"
    #   monado = []
    #   monado << 16
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "Cmin"
    #   monado = []
    #   monado << 17
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "D♯maj"
    #   monado = []
    #   monado << 17
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "Gmin"
    #   monado = []
    #   monado << 18
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "A♯maj"
    #   monado = []
    #   monado << 18
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "Dmin"
    #   monado = []
    #   monado << 19
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "Fmaj"
    #   monado = []
    #   monado << 19
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "Amin"
    #   monado = []
    #   monado << 20
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "Cmaj"
    #   monado = []
    #   monado << 20
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "Emin"
    #   monado = []
    #   monado << 21
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "Gmaj"
    #   monado = []
    #   monado << 21
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "Bmin"
    #   monado = []
    #   monado << 22
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "Dmaj"
    #   monado = []
    #   monado << 22
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "F♯min"
    #   monado = []
    #   monado << 23
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "Amaj"
    #   monado = []
    #   monado << 23
    #   monado << '∠＝∞'
    #   return monado
    # end

    # if string == "C♯min"
    #   monado = []
    #   monado << 24
    #   monado << 'ζ=δτ(ωρ)'
    #   return monado
    # end

    # if string == "Emaj"
    #   monado = []
    #   monado << 24
    #   monado << '∠＝∞'
    #   return monado
    # end
end
