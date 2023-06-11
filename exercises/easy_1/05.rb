# def rot13(s)
#   s.gsub(/[a-z]/i) { |c| ((x = c =~ /[A-Z]/ ? 65 : 97) + (c.ord - x + 13) % 26).chr }
# end

def rot13(s)
  s.gsub(/[a-z]/i) { |c| (c.ord + (c =~ /[a-m]/i ? 13 : -13)).chr }
end

cipher = <<~CIPHER
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
CIPHER

puts rot13(cipher)
