def numNonZeros2DTriangular(N):
    return int((1 + N) * N /2)



def access2DTriangular(N, row, col):
    if(col >= row):
        return int(N * (N - 1)/2 - (N - row) * (N - row - 1)/2 + col)
    else:
        return -1
