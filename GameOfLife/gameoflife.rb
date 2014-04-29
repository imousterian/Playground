
class CellMatrix

    @grids#  @something = instance variable; $something = global variable (made global from inside the class or method); @@something = class variable
    @@gridlength = 11

    def initialize()
    end

    def assignRandomLife()
        prgn = Random.new
        # @grids = Array.new (@@gridlength) { |i| Array.new(@@gridlength) { |i| prgn.rand(1.0) <= 0.3 ? 1 : 0 }}

        @grids = Array.new (@@gridlength) { |i| Array.new(@@gridlength) { |j| 0 }}
        @grids[5][4] =1
        @grids[5][5] =1
        @grids[5][6] =1

        @grids[4][5] =1
        @grids[6][5] =1


    end

    def printgrids()

        # newGrid = Array.new (4) { |i| Array.new(4){ |i| 0 }}
        count = 0

        # runLife()
        while count < 10
            puts "count #{count}"
            @grids = runLife(@grids)

            count += 1

        end

    end

    def runLife(grid)
        newgrid = Array.new (@@gridlength) { |i| Array.new(@@gridlength) { |j| 0 }}
        grid.each_with_index do |x, xi|

            print x
            print "\n"

            x.each_with_index do |y, yi|

                newgrid[xi][yi] = grid[xi][yi]

                s = determineLiveNeighbors(xi,yi,grid)

                if (grid[xi][yi] == 0 && s == 3)
                    newgrid[xi][yi] = 1

                elsif (grid[xi][yi] == 1 && (s >= 2 && s <= 3))
                    newgrid[xi][yi] == 1

                elsif (grid[xi][yi] == 1 && ( s <= 2 || s > 3))
                    newgrid[xi][yi] = 0

                end

            end
        end

        return newgrid

    end

    def checkBoundaries(row,col)
        return (row >= 0 && row <= (@@gridlength - 1) && (col >= 0 && col <= @@gridlength - 1))
    end

    def determineLiveNeighbors(xi, yi, b)
        results = 0

        (xi-1).upto(xi+1) do |el1|
            (yi-1).upto(yi+1) do |el2|
                # puts "Checking s: #{el1} and #{el2}"
                if ((el1 != xi) || (el2 != yi))

                    # if (el1 >= 0 && el1 <= @@gridlength - 1) && (el2 >= 0 && el2 <= @@gridlength - 1)
                    if checkBoundaries(el1,el2)
                        results += b[el1][el2]#@grids[el1][el2]
                    end
                end
            end
        end
        return results
    end

end

a = CellMatrix.new()
a.assignRandomLife()
a.printgrids()
























