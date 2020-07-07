import numpy
import cv2
import math

d = 1441
n = 3763
k = 23
m = math.floor(2 ** k / n)

def main():
    with open("data.txt", "r") as input:
        data = input.readlines()

    imageWidth = 480
    imageHeight = 320

    encrypted = []
    for line in data:
        encrypted += line.split()

    print(encrypted.__len__())

    encrypted_image = numpy.array(encrypted, dtype=numpy.uint8)
    encrypted_image.shape = (2 * imageHeight, imageWidth)
    cv2.imshow("Encrypted", encrypted_image)

    encrypted2byte = []
    for i in range(0, encrypted.__len__(), 2):
        byte1 = int(encrypted[i])
        byte2 = int(encrypted[i + 1])
        pixel = 256 * byte1 + byte2
        encrypted2byte.append(pixel)

    # Esto tiene que hacerlo el hardware
    decrypted = []
    for pixel in encrypted2byte:
        decrypted.append(modular_pow(pixel, d, n))

    decrypted_image = numpy.array(decrypted, dtype=numpy.uint8)
    decrypted_image.shape = (imageHeight, imageWidth)
    cv2.imshow("Decrypted", decrypted_image)
    cv2.waitKey()


def modular_pow(c, d, n):
    print("Should output: ", pow(c, d, n))
    if n == 1:
        return 0
    c = vector_modulo(c, n)
    result = 1
    while d > 0:
        if (d % 2) == 1:
            result = result * c  # Vector multiplication
            result = vector_modulo(result, n)  # Vectorized modulo
        d = d // 2
        c = c * c  # Vector multiplication
        c = vector_modulo(c, n)  # Vectorized modulo
    print("Outputs: ", result)
    return result


def vector_modulo(a, n):
    # Parte vectorizable
    q = a * m  # Vector multiplication
    q = q // (2 ** k)  # Vector shift right
    b = q * n  # Vector multiplication
    a = a - b  # Vector subtraction
    if n <= a:  # Vector subtraction with flags
        a = a - n  # Conditional vector subtraction
    return a


if __name__ == "__main__":
    main()
