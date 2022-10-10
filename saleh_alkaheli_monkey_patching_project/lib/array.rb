# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        if self.length >= 1
            self.max - self.min
        else
            nil
        end
    end

    def average
        return nil if self.length == 0
        self.sum / self.length.to_f
    end

    def median
        if self.length.odd?
            self.sort[self.length/2]
        elsif self.length == 0
            nil
        else
            (self.sort[(self.length/2)-1] + self.sort[(self.length/2)])/2.to_f
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash
    end

    def my_count(str)
        self.select{|ele| ele == str}.length
    end

    def my_index(arg)
        arr = []

        self.each_with_index{|ele, i| arr << i  if ele == arg }

        return nil if arr.length == 0
        arr[0]
    end

    def my_uniq
        arr = []
        self.each {|ele| arr << ele if !arr.include?(ele)}
        arr
    end

    def my_transpose
        arr2 = Array.new(self.length){Array.new(self[0].length)}
        self.each_with_index do |ele, i1|
            self.each_with_index do |ele2, i2|
                arr2[i1][i2] = self[i2][i1]
            end
        end
        arr2
    end

end
