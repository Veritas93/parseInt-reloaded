def parse_int(t)
  @simple_number = {eleven: 11,twelve: 12,thirteen: 13,fourteen: 14,fifteen: 15,sixteen: 16,seventeen: 17,eighteen: 18,nineteen: 19,twenty: 20,thirty: 30,forty: 40,fifty: 50,sixty: 60,seventy: 70,eighty: 80,ninety: 90,thousand: 1000,hundred: 100,:one => 1,two: 2,three: 3,four: 4,five: 5,six: 6,seven: 7,eight: 8,nine: 9,ten: 10
}
  f = []
  @b = [[]]
  count = 0
  @d = 0
  @t = 0
  @h = t.split(/\ |\-/)
  @h.delete("and")
    for i in @h
      if @simple_number.has_key?(i.to_sym)
        @b[@d] << i.to_sym
      else
        while  not @simple_number.has_key?(i.to_sym)
          for j in @simple_number
            s = j[0].size
            if  i[0...s] == j[0].to_s
              @b[@d] << j[0]
              @b << []
              @d += 1
              i = i.slice(s .. -1)
              break
            end
          end
        end
        @b[@d] << i.to_sym
      end
    end
  k = @b[-1].each_slice(2).to_a
  for i in k
    @count = i.count 
    if @count == 1
    return @simple_number[t.to_sym]
  else 
    for i in k
      for j in i
        if j.to_s == "hundred" or j.to_s == "thousand"
          @t = @t * @simple_number[j.to_s.to_sym]
        else
          @t += @simple_number[j.to_s.to_sym]
        end
      end
        f << @t
        @t = 0
    end
    for i in f
      @t += i
    end
    return @t
  end
  end
end

puts parse_int("one two threeone hundred and twenty two")
