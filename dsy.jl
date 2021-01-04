function get_wt_array(L)
    wt_array = collect(1:1:L)
    wt_array = wt_array/L
    wt_array = wt_array.*(wt_array.-1).*(-1)
    wt_array = wt_array.^(-1).*(-1)
    wt_array = exp.(wt_array)
    wt_array[L] = 0
    return wt_array
end

println("#1:N   #2:k   #3:classical   #4:dsy")

for N in 1:2000

    omega = (sqrt(5)-1)/2
    x(p) = sin(omega*p)
    n = collect(-N:1:N)
    x_n_array = x.(n)

    for k in -10:10
        
        print(N, "  ", k, "  ")
    
        #Classical
        x_k = 1/(2*N+1)*sum(x_n_array.*exp.(-2*pi*im*k*omega*n))
        print(abs(x_k), "  ")

        #DSY
        wt_array = get_wt_array(2*N+1)
        tot_wt = sum(wt_array)
        x_k = sum(wt_array.*x_n_array.*exp.(-2*pi*im*k*omega*n))/tot_wt
        println(abs(x_k))

    end #for k
    
end #for N



# later have to create array xhat[k]
#x_k_array = 1/(2*N+1) * 


#later we'll have to create array of arrays
#wt_array = 
#tot_wt_array = 