using Mamba

## Data
bones = Dict{Symbol, Any}(
  :gamma => reshape(
    [ 0.7425,     NaN,     NaN,    NaN,  10.2670,     NaN,     NaN,     NaN,
     10.5215,     NaN,     NaN,    NaN,   9.3877,     NaN,     NaN,     NaN,
      0.2593,     NaN,     NaN,    NaN,  -0.5998,     NaN,     NaN,     NaN,
     10.5891,     NaN,     NaN,    NaN,   6.6701,     NaN,     NaN,     NaN,
      8.8921,     NaN,     NaN,    NaN,  12.4275,     NaN,     NaN,     NaN,
     12.4788,     NaN,     NaN,    NaN,  13.7778,     NaN,     NaN,     NaN,
      5.8374,     NaN,     NaN,    NaN,   6.9485,     NaN,     NaN,     NaN,
     13.7184,     NaN,     NaN,    NaN,  14.3476,     NaN,     NaN,     NaN,
      4.8066,     NaN,     NaN,    NaN,   9.1037,     NaN,     NaN,     NaN,
     10.7483,     NaN,     NaN,    NaN,   0.3887,  1.0153,     NaN,     NaN,
      3.2573,  7.0421,     NaN,    NaN,  11.6273, 14.4242,     NaN,     NaN,
     15.8842, 17.4685,     NaN,    NaN,  14.8926, 16.7409,     NaN,     NaN,
     15.5487, 16.8720,     NaN,    NaN,  15.4091, 17.0061,     NaN,     NaN,
      3.9216,  5.2099,     NaN,    NaN,  15.4750, 16.9406, 17.4944,     NaN,
      0.4927,  1.3556,  2.3016,  3.2535,  1.3059,  1.8793,  2.4970,  3.2306,
      1.5012,  1.8902,  2.3689,  2.9495,  0.8021,  2.3873,  3.9525,  5.3198,
      5.0022,  6.3704,  8.2832, 10.4988,  4.0168,  5.1537,  7.1053, 10.3038],
     4, 34)',
   :delta =>
     [2.9541, 0.6603, 0.7965, 1.0495, 5.7874, 3.8376, 0.6324,
      0.8272, 0.6968, 0.8747, 0.8136, 0.8246, 0.6711, 0.978,
      1.1528, 1.6923, 1.0331, 0.5381, 1.0688, 8.1123, 0.9974,
      1.2656, 1.1802, 1.368,  1.5435, 1.5006, 1.6766, 1.4297,
      3.385,  3.3085, 3.4007, 2.0906, 1.0954, 1.5329],
   :ncat =>
     [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
      3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 5, 5, 5, 5, 5],
   :grade => reshape(
     [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,2,1,1,2,1,1,
      2,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,3,1,1,2,1,1,
      2,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,4,3,3,3,1,1,
      2,1,1,1,2,2,1,1,1,1,1,1,NaN,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,4,5,4,3,1,1,
      2,1,1,1,2,2,1,1,2,1,1,1,1,1,1,1,2,1,1,3,2,1,1,1,1,1,3,1,5,5,5,4,2,3,
      2,1,1,1,2,2,1,2,1,1,1,1,1,2,1,1,2,NaN,1,3,2,1,1,1,1,1,3,1,5,5,5,5,3,3,
      2,1,1,1,2,2,1,1,1,NaN,NaN,1,1,1,1,1,2,NaN,1,3,3,1,1,1,1,1,3,1,5,5,5,5,3,3,
      2,1,2,2,2,2,2,2,1,NaN,NaN,1,2,2,1,1,2,2,1,3,2,1,1,1,1,1,3,1,5,5,5,5,3,4,
      2,1,1,2,2,2,2,2,2,1,1,1,2,1,1,1,2,1,1,3,3,1,1,1,1,1,3,1,5,5,5,5,4,4,
      2,1,2,2,2,2,2,2,2,1,1,1,2,2,2,1,2,NaN,2,3,3,1,1,1,1,1,3,1,5,5,5,5,5,5,
      2,1,NaN,2,2,2,NaN,2,2,1,NaN,NaN,2,2,NaN,NaN,2,1,2,3,3,NaN,1,NaN,1,1,3,1,5,5,5,5,5,5,
      2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,1,NaN,2,1,3,2,5,5,5,5,5,5,
      2,2,2,2,2,2,2,2,2,2,NaN,2,2,2,2,2,2,2,2,3,3,3,NaN,2,NaN,2,3,4,5,5,5,5,5,5],
     34, 13)',
  :nChild => 13,
  :nInd => 34
)


## Model Specification
model = Model(

  grade = Stochastic(2,
    (ncat, delta, theta, gamma, nChild, nInd) ->
      begin
        p = Array{Float64}(undef, 5)
        UnivariateDistribution[
          begin
            n = ncat[j]
            p[1] = 1.0
            for k in 1:(n - 1)
              Q = invlogit(delta[j] * (theta[i] - gamma[j, k]))
              p[k] -= Q
              p[k + 1] = Q
            end
            Categorical(p[1:n])
          end
          for i in 1:nChild, j in 1:nInd
        ]
      end,
    false
  ),

  theta = Stochastic(1,
    () -> Normal(0, 100)
  )

)


## Initial Values
inits = [
  Dict(:grade => bones[:grade], :theta => [0.5,1,2,3,5,6,7,8,9,12,13,16,18]),
  Dict(:grade => bones[:grade], :theta => [1,2,3,4,5,6,7,8,9,10,11,12,13])
]


## Sampling Scheme
scheme = [MISS(:grade),
          AMWG(:theta, 0.1)]
setsamplers!(model, scheme)


## MCMC Simulations
sim = mcmc(model, bones, inits, 10000, burnin=2500, thin=2, chains=2)
describe(sim)
