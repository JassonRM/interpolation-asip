import numpy
import cv2


def main():
    with open("data.txt", "r") as input:
        data = input.readlines()

    imageWidth = 320
    imageHeight = 320

    encrypted = []
    for line in data:
        encrypted += line.split()

    print(encrypted.__len__())
    encrypted_image = numpy.array(encrypted, dtype=numpy.uint8)
    encrypted_image.shape = (2 * imageHeight, imageWidth)
    cv2.imshow("Encrypted", encrypted_image)
    cv2.waitKey()
    output = [0] * 64
    binomial([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 4, output, 4, 4)
    print(output)


def binomial(input_img, input_width, output_img, division_width, division_height):
    column = 0
    read_addr = 0
    write_addr = 0
    row = 0
    while row < division_height:
        chunk = input_img[read_addr:read_addr + 4]  # READ 4 bytes
        ext = [chunk[0], chunk[0], chunk[1], chunk[1], chunk[2], chunk[2], chunk[3], chunk[3]]  # Bit extension
        output_img[write_addr:write_addr + 8] = ext  # WRITE 8 bytes
        output_img[write_addr + division_width * 2:write_addr + division_width * 2 + 8] = ext  # WRITE 8 bytes
        column = column + 4
        read_addr = read_addr + 4
        write_addr = write_addr + 8

        if column >= division_width:  #
            read_addr = read_addr - column
            read_addr = read_addr + input_width
            write_addr = write_addr + division_width * 2
            row = row + 1  # Can be replaced by a multiplication at the beginning
            column = 0


if __name__ == "__main__":
    main()
