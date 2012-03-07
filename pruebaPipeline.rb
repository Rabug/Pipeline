require "pipelineelement.rb"

evens = PipelineElement.new(
          lambda do
            value = 0
            loop do
              Fiber.yield value
              value += 2
            end
          end,
        )
           
mult = []
[3, 5].each_with_index  do |k, i| 
  mult[i] = PipelineElement.new(
    lambda do |value|
       Fiber.yield value if value % k == 0
    end,
    evens
  )
end
           
# 10.times do
#    puts mult[1].resume
# end

10.times do
   puts (evens | mult[0] | mult[1]).resume
end
