B() = rand(Float64, (100, 100))
function work_load(; rng = range(0, 100, 1000))
    pts = Iterators.product(rng, rng)
    A = pmap(pts) do pt
        x, y = pt 
        i = 1
        C = B()
        while i > 0
            C = C * B()
        end
        return C
    end
    return A
end