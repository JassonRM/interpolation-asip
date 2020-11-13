import numpy
import cv2

from explicit import translate_quadrant


def main():
    input_image = cv2.imread('sample.png', 0)
    cv2.imshow("INPUT", input_image)
    quadrant_size = input_image.shape[1] // 4
    # quadrant_size -= quadrant_size % 4
    # output = [0] * (2 * quadrant_size) ** 2
    quadrant_size -= quadrant_size % 2
    print(quadrant_size)
    output = [0] * (3 * quadrant_size - 2) ** 2
    # nearest_neighbours(input_image.flatten(), input_image.shape[1], output, quadrant_size, quadrant_size)
    bilinear(input_image.flatten(), input_image.shape[1], output, quadrant_size, quadrant_size)
    output_image = numpy.array(output, dtype=numpy.uint8)
    print(len(output))
    output_image.shape = ((3 * quadrant_size - 2), (3 * quadrant_size - 2))
    # output_image.shape = ((2 * quadrant_size), (2 * quadrant_size))
    cv2.imshow("Other", output_image)
    cv2.waitKey()


# TODO Manage all widths
def nearest_neighbours(input_img, input_width, output_img, division_width, division_height):
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


def bilinear(input_img, input_width, output_img, division_width, division_height):
    column = 1
    read_addr = 0
    write_addr = 0
    row = 1
    while row <= division_height - 1:
        chunk = input_img[read_addr:read_addr + 2]  # READ 2 bytes
        chunk2 = input_img[read_addr + input_width:read_addr + input_width + 2]  # READ 2 bytes
        temp1 = chunk[0]
        temp2 = chunk[1]
        out1 = [temp1, (temp1 * 2 / 3 + temp2 / 3) // 1, (temp1 / 3 + temp2 * 2 / 3) // 1, temp2]

        temp1 = (chunk[0] * 2 / 3 + chunk2[0] * 1 / 3) // 1
        temp2 = (chunk[1] * 2 / 3 + chunk2[1] * 1 / 3) // 1
        out2 = [temp1, (temp1 * 2 / 3 + temp2 / 3) // 1, (temp1 / 3 + temp2 * 2 / 3) // 1, temp2]

        temp1 = (chunk[0] / 3 + chunk2[0] * 2 / 3) // 1
        temp2 = (chunk[1] / 3 + chunk2[1] * 2 / 3) // 1
        out3 = [temp1, (temp1 * 2 / 3 + temp2 / 3) // 1, (temp1 / 3 + temp2 * 2 / 3) // 1, temp2]

        temp1 = chunk2[0]
        temp2 = chunk2[1]
        out4 = [temp1, (temp1 * 2 / 3 + temp2 / 3) // 1, (temp1 / 3 + temp2 * 2 / 3) // 1, temp2]

        output_img[write_addr:write_addr + 4] = out1  # WRITE 4 bytes
        output_img[write_addr + division_width * 3 - 2:write_addr + division_width * 3 - 2 + 4] = out2  # WRITE 4 bytes
        output_img[write_addr + division_width * 6 - 4:write_addr + division_width * 6 - 4 + 4] = out3  # WRITE 4 bytes
        output_img[write_addr + division_width * 9 - 6:write_addr + division_width * 9 - 6 + 4] = out4  # WRITE 4 bytes
        column = column + 1
        read_addr = read_addr + 1
        write_addr = write_addr + 3

        if column >= division_width:  #
            read_addr = read_addr - column
            read_addr = read_addr + input_width
            write_addr = write_addr + division_width * 6 - 4 - 2
            row = row + 1
            column = 0


if __name__ == "__main__":
    main()
