# frozen_string_literal: true

# location implement
module LocationImplement
  # 35°37′37″	-> 35.62694444444445
  def self.sexagesimal_to_float(value)
    coordinate, others = value.split('°')
    minutes, others = others.split('′')
    seconds = others.split('″')[0]
    coordinate.to_i + minutes.to_f / 60 + seconds.to_f / 3600
  end

  # 35.35.62694444 -> 35°37′37″
  def self.float_to_sexagesimal(value)
    coordinate_whole = value.to_i
    coordinate_decimal = value - coordinate_whole
    minutes = coordinate_decimal * 60
    minutes_whole = minutes.to_i
    minutes_decimal = minutes - minutes_whole
    seconds = (minutes_decimal * 60).round.to_i
    "#{coordinate_whole}°#{minutes_whole}′#{seconds}″"
  end
end
