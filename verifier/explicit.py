from instructions import *
import cv2
import numpy

input_image = cv2.imread('sample.png', 0)
img_height = input_image.shape[0]
img_width = input_image.shape[1]

div_width = sll(img_width, 2)  # div by 4
div_height = sll(img_height, 2)  # div by 4

quadrant = 10


def translate_quadrant(quadrant):
    result = 0
    row = sll(quadrant, 2)  # div by 4
    col = add(quadrant, 0)  # addi
    height_step = mult(div_height, img_width)
    while row > 0:
        result = add(result, height_step)
        row = sub(row, 1)  # subi
        col = sub(col, 4)  # subi
    while col > 0:
        result = add(result, div_width)
        col = sub(col, 1)  # subi
    return result


def nearest_neighbours(img, output_img):
    read_addr = translate_quadrant(quadrant)
    write_addr = 0

    column = 0
    row = 0

    while div_height > row:
        chunk = vldb(img, read_addr)
        ext = vmni(chunk)

        vstw(output_img, ext, write_addr)
        temp = add(write_addr, div_width)
        temp = add(temp, div_width)
        vstw(output_img, ext, temp)

        column = add(column, 2)
        read_addr = add(read_addr, 2)
        write_addr = add(write_addr, 4)

        if column >= div_width:  #
            read_addr = sub(read_addr, column)
            read_addr = add(read_addr, img_width)
            write_addr = add(write_addr, div_width)
            write_addr = add(write_addr, div_width)

            row = add(row, 1)  # Can be replaced by a multiplication at the beginning
            column = add(0, 0)


def bilinear(input_img, input_width, output_img, division_width, division_height):
    column = 1
    read_addr = 100
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


def main():
    output_img = [0] * div_width * div_height * 4
    nearest_neighbours(input_image.flatten(), output_img)
    output_image = numpy.array(output_img, dtype=numpy.uint8)
    output_image.shape = (2 * div_height, 2 * div_width)
    cv2.imshow("Other", output_image)
    cv2.imshow("INPUT", input_image)
    cv2.waitKey()


if __name__ == "__main__":
    main()
