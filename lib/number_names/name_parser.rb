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

    hundreds.to_s + tens.to_s + NUMBER_NAMES[:position][place.to_s].to_s
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
    },
    :position => {
      "2" => " thousand",
      "3" => " million",
      "4" => " billion",
      "5" => " trillion",
      "6" => " quadrillion",
      "7" => " quintillion",
      "8" => " sextillion",
      "9" => " septillion",
      "10" => " octillion",
      "11" => " nonillion",
      "12" => " decillion",
      "13" => " undecillion",
      "14" => " duodecillion",
      "15" => " tredecillion",
      "16" => " quattuordecillion",
      "17" => " quindecillion",
      "18" => " sexdecillion",
      "19" => " septendecillion",
      "20" => " octodecillion",
      "21" => " novemdecillion",
      "22" => " vigintillion"
    }
  }

end
