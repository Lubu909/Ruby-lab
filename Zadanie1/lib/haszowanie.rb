# Haszowanie z adresowaniem otwartym kwadratowym
class Haszowanie
  @hasz = []
  attr_reader :hasz
  def initialize
    @hasz = []
  end

  def na_int(wyraz)
    sum = 0
    wyraz.each_byte { |byte| sum += byte }
    sum
  end

  def haszuj(m, liczba, proba)
    ((liczba % m) + proba * proba) % m
  end

  def wstaw(m, wartosc)
    (0..m - 1).each do |i|
      tmp = haszuj(m, na_int(wartosc), i)
      if (@hasz[tmp]).nil?
        @hasz[tmp] = wartosc
        break
      end
    end
  end

  def istnieje?(wartosc)
    @hasz.include? wartosc
  end

  def usun(wartosc)
    istnieje?(wartosc) ? @hasz.delete(wartosc) : false
  end
end

def dziwne_dzialanie1(liczby)
  sum = 0
  liczby.each { |a| sum += a }
  liczby.first * liczby.last - sum
end

def kombinacje_wyrazow(wyrazy)
  kombinacje = []
  wyrazy.each do |wyraz1|
    wyrazy.each do |wyraz2|
      kombinacje << "#{wyraz1} #{wyraz2}" if wyraz1 != wyraz2
    end
  end
  kombinacje
end
