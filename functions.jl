B() = rand(Float64, (100, 100))
function work_load(; rng = range(0, 100, 1000))
    pts = Iterators.product(rng, rng)
    A = pmap(pts) do pt
        x, y = pt 
        return inv(x*B() + y*B())
    end
    return A
end