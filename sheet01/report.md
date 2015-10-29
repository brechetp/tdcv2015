Tracking and detection
=====
Exercise sheet #1
-----
Bréchet (03672392), von Stumberg (03643493)
-----
### Exercise 1
#### Remarks

For the sake of the exercise, we assumed to deal with M, N (the mask dimensions) odd only. Also, we normalize the convolution kernel (by the sum of its elements if non zero)

### Exercise 2

##### Remarks

We find strange results. The computation of the convolution 2*1D is twice as slow as the convolution 2D. This is certainly due to our implementation of convolution (which is not very optimal)

### Exercise 3

#### Remarks

We definitely have a bug here: the two convolutions (D * (G * I) and (G * D) * I) are not equivalent (D * G appears to be 0). This is certainly due to our convolution implementation
