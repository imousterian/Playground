=begin
    A locker problem. A 100 lockers; all are closed. On the first pass,
    all are open. Then every second, every third, etc door is toggled.
    How many doors are open at the end?
=end

def open_doors

    # open all doors
    # closed = true
    # opened = false
    n = 1

    arr = []

    while (n < 100)
        arr[n] = false
        n += 1
    end

    #start looping strating with the second person
    person = 2

    while person < 100
        (0...arr.length).each do |i|
            if (i % person == 0)
                arr[i] = !arr[i]
            end
        end
        person += 1
    end

    closed = arr.select {|i| i == true}.count
    open = arr.select {|i| i == false}.count
    puts "closed: #{closed} open: #{open} total doors: #{arr.count}"

end

open_doors
