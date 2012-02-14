module NumberNames::NameParser

  def to_name
    num_str = self.to_s
    while num_str.length % 3 != 0 do num_str = "0" + num_str end
    n = num_str.scan /.../

    n.each_with_index.map do |e, i|
      name = ""
      name << "and " if(i == n.size - 1 && n.size > 1 && e.to_i < 100 && e.to_i > 0)
      name << get_number_name(e, n.size - i)
    end.join(" ").strip
  end

  private
  def get_number_name(num, place)
    # determine hundreds place
    hundreds = "#{NUMBER_NAMES[:digits][num[0]]} hundred" unless num[0] == "0"
    hundreds += " and " if hundreds && num[1,2] != "00"
    # get index for tens
    if num[1,2].to_i < 20
      tens = "#{NUMBER_NAMES[:digits][num[1,2].to_i.to_s]}"
    else
      tens = "#{NUMBER_NAMES[:tens][num[1]]} #{NUMBER_NAMES[:digits][num[2]]}"
    end

    hundreds.to_s + tens.to_s + get_place(place).to_s
  end

  NUMBER_NAMES = {
    :tens => {
      "0" => "",
      "2" => "twenty",
      "3" => "thirty",
      "4" => "forty",
      "5" => "fifty",
      "6" => "sixty",
      "7" => "seventy",
      "8" => "eighty",
      "9" => "ninety"
    },
    :digits => {
      "1" => "one",
      "2" => "two",
      "3" => "three",
      "4" => "four",
      "5" => "five",
      "6" => "six",
      "7" => "seven",
      "8" => "eight",
      "9" => "nine",
      "10" => "ten",
      "11" => "eleven",
      "12" => "twelve",
      "13" => "thirteen",
      "14" => "fourteen",
      "15" => "fifteen",
      "16" => "sixteen",
      "17" => "seventeen",
      "18" => "eighteen",
      "19" => "nineteen"
    }
  }


  def get_place(pos)
    case pos
    when 2; " thousand"
    when 3; " million"
    when 4; " billion"
    when 5; " trillion"
    when 6; " quadrillion"
    when 7; " quintillion"
    when 8; " sextillion"
    when 9; " septillion"
    when 10; " octillion"
    when 11; " nonillion"
    when 12; " decillion"
    when 13; " undecillion"
    when 14; " duodecillion"
    when 15; " tredecillion"
    when 16; " quattuordecillion"
    when 17; " quindecillion"
    when 18; " sexdecillion"
    when 19; " septendecillion"
    when 20; " octodecillion"
    when 21; " novemdecillion"
    when 22; " vigintillion"
    end
  end




end
