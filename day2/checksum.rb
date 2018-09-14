class Checksum
  def initialize(rs = MinMaxDiffSum.new)
    @rowsum = rs
  end

  def sum(input)
    input.each_line.reduce(0) {|memo, line| @rowsum.sum(line) + memo}
  end
end

class MinMaxDiffSum
  def sum(input)
    min, max = input.split(' ').map(&:to_i).minmax
    if !min.nil?
      max - min
    else
      0
    end
  end
end

class DivisibleSum
  def sum(input)
    nums = input.split(' ').map(&:to_i).sort
    if nums.size == 0
      0
    else
      dividend = 0
      divisor = 1
      (0...nums.size).each do |n1|
        dpos = (n1+1...nums.size).find {|n2| nums[n2] % nums[n1] == 0}
        unless dpos == nil
          dividend = nums[dpos]
          divisor = nums[n1]
          break
        end
      end
      dividend / divisor
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Min Max Difference", Checksum.new.sum(File.read("input"))
  puts "Divisible Quotient", Checksum.new(DivisibleSum.new).sum(File.read("input"))
end
