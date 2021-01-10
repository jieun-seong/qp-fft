setprecision(256)
zero = BigFloat(0)
one = BigFloat(1)
two = BigFloat(2)
five = BigFloat(5)
ten = BigFloat(10)

function get_wt_array(L)
    wt_array = collect(1:1:L)
    wt_array = wt_array/BigFloat(L)
    wt_array = wt_array.*(wt_array.-1).*(-one)
    wt_array = wt_array.^(-1).*(-one)
    wt_array = exp.(wt_array)
    wt_array[L] = zero
    return wt_array
end

println("#1:N   #2:k   #3:classical   #4:dsy")

# window T?
# T = 10 # interval [-1,1]

for N in 1:1000

    wt_array = get_wt_array(2*N+1)
    tot_wt = sum(wt_array)

    omega = (sqrt(five)-one)/two
    x(p) = sin(omega*p)
    #x(p) = p+omega+BigFloat(15)/BigFloat(10)*sin(two*pi*p) # should be x(p+1) = x(p) + 1, not equal to x(p)
    n = collect(-BigFloat(N):one:BigFloat(N)) # need to be careful when taking mod -> discontinuity
    x_n_array = x.(n)

    for k in -2:2
        
        print(N, "  ", k, "  ")
    
        #Classical
        x_k = 1/(two*BigFloat(N)+one)*sum(x_n_array.*exp.(-two*pi*im*BigFloat(k)*omega*n))
        print(abs(x_k), "  ")
        
        #DSY with BigFloat
        x_k = sum(wt_array.*x_n_array.*exp.(-two*pi*im*BigFloat(k)*omega*n))/tot_wt
        println(abs(x_k))

    end #for k
    
end #for N



# later have to create array xhat[k]
#x_k_array = 1/(2*N+1) * 


#later we'll have to create array of arrays
#wt_array = 
#tot_wt_array = 