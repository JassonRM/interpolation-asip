import numpy
import cv2


def main():
    input_image = cv2.imread('sample.png', 0)
    cv2.imshow("INPUT", input_image)
    quadrant_size = 120

    output = [0] * (2 * quadrant_size) ** 2
    binomial(input_image.flatten(), input_image.shape[1], output, quadrant_size, quadrant_size)
    output_image = numpy.array(output, dtype=numpy.uint8)
    output_image.shape = (2 * quadrant_size, 2 * quadrant_size)
    cv2.imshow("Other", output_image)
    cv2.waitKey()


# TODO Manage all widths
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
