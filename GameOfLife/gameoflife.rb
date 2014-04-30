# implementation of Conway's game of life version 1

class CellGrid

    @grids
    @@gridlength = 11

    def initialize()
    end

    def initiateGrid()
        # initiate a random distribution of live cells
        # randEl = Random.new
        # @grids = Array.new (@@gridlength) { |i| Array.new(@@gridlength) { |i| randEl.rand(1.0) <= 0.3 ? 1 : 0 }}

        # OR: to test, begin a specific starting point
        @grids = Array.new (@@gridlength) { |i| Array.new(@@gridlength) { |j| 0 }}

        @grids[5][4] =1
        @grids[5][5] =1
        @grids[5][6] =1
        @grids[4][5] =1
        @grids[6][5] =1

    end

    def runSimulation(oldGrid)

        # create a new grid
        newGrid = Array.new (@@gridlength) { |i| Array.new(@@gridlength) { |j| 0 }}

        oldGrid.each_with_index do |x, xi|

            print x
            print "\n"

            x.each_with_index do |y, yi|

                newGrid[xi][yi] = oldGrid[xi][yi]

                neighborCount = calculateLiveNeighbors(xi,yi,oldGrid)

                if !cellAlive?(xi,yi) && neighborCount == 3 # rule # 1; the cell is born
                    newGrid[xi][yi] = 1

                elsif cellAlive?(xi,yi)

                    if neighborCount >= 2 && neighborCount <= 3   # rule # 2; keep reproducing
                        newGrid[xi][yi] = 1
                    elsif neighborCount <= 2 || neighborCount > 3 # rule # 3; the cell dies
                        newGrid[xi][yi] = 0
                    end

                end

            end
        end

        return newGrid
    end

    def cellAlive?(row,col)
        return @grids[row][col] == 1 ? true : false
    end

    def boundariesSafe?(row,col)
        return (row >= 0 && row <= (@@gridlength - 1) && (col >= 0 && col <= @@gridlength - 1))
    end

    def calculateLiveNeighbors(xi, yi, arr)
        results = 0

        # check neghbors at indices row+1 to row-1, col+1 to col-1
        (xi-1).upto(xi+1) do |row|
            (yi-1).upto(yi+1) do |col|
                if ((row != xi) || (col != yi))

                    # check the boundaries; if boundaries are at a negative index, ignore; else calculate sum
                    if boundariesSafe?(row,col)
                        results += arr[row][col]
                    end
                end
            end
        end
        return results
    end

    def runDisplayResults()

        # run simulation that many times
        count = 0

        while count < 10

            puts "iteration # #{count}"
            @grids = runSimulation(@grids)

            count += 1
        end
    end

end

a = CellGrid.new()
a.initiateGrid()
a.runDisplayResults()



















