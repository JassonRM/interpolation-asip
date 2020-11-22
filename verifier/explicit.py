from instructions import *
import cv2
import numpy

input_image = cv2.imread('sample.png', 0)
img_height = input_image.shape[0]
img_width = input_image.shape[1]

div_width = sll(img_width, 2)  # div by 4
div_height = sll(img_height, 2)  # div by 4

quadrant = 0


def translate_quadrant(quadrant):
    result = add(0, 0)
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

    # not necessary to initialize in assembly
    write_addr = add(0, 0)
    column = add(0, 0)
    row = add(0, 0)

    while div_height > row:
        chunk = vldb(img, read_addr)
        ext = vmni1(chunk)
        ext2 = vmni2(chunk)

        vstb(output_img, ext, write_addr)

        temp = add(write_addr, 4)
        vstb(output_img, ext2, temp)

        temp = add(write_addr, div_width)
        temp = add(temp, div_width)
        vstb(output_img, ext, temp)

        temp = add(temp, 4)
        vstb(output_img, ext2, temp)

        column = add(column, 4)
        read_addr = add(read_addr, 4)
        write_addr = add(write_addr, 8)

        if column >= div_width:  #
            read_addr = sub(read_addr, column)
            read_addr = add(read_addr, img_width)
            write_addr = add(write_addr, div_width)
            write_addr = add(write_addr, div_width)

            row = add(row, 1)
            column = add(0, 0)


def bilinear(img, output_img):
    size = len(output_img)
    read_addr = translate_quadrant(quadrant)
    write_addr = add(0, 0)

    column = add(0, 0)
    row = add(0, 0)
    offset = mult(div_width, 3)
    offset = sub(offset, 2)

    while row <= div_height - 1:
        chunk11 = vldb(img, read_addr)
        temp_read = add(read_addr, 4)
        chunk12 = vldb(img, temp_read)

        temp_read = add(read_addr, img_width)
        chunk21 = vldb(img, temp_read)
        temp_read = add(temp_read, 4)
        chunk22 = vldb(img, temp_read)

        row1 = vbih1(chunk11)
        row4 = vbih1(chunk21)
        row2 = vbiv(row1, row4)
        row3 = vbiv(row4, row1)

        vstb(output_img, row1, write_addr)

        temp = add(write_addr, offset)
        vstb(output_img, row2, temp)

        temp = add(temp, offset)
        vstb(output_img, row3, temp)

        temp = add(temp, offset)
        vstb(output_img, row4, temp)
        # -------------------------------------------------------
        row1 = vbih2(chunk11)
        row4 = vbih2(chunk21)
        row2 = vbiv(row1, row4)
        row3 = vbiv(row4, row1)

        write_addr = add(write_addr, 4)
        vstb(output_img, row1, write_addr)

        temp = add(write_addr, offset)
        vstb(output_img, row2, temp)

        temp = add(temp, offset)
        vstb(output_img, row3, temp)

        temp = add(temp, offset)
        vstb(output_img, row4, temp)
        # -------------------------------------------------------
        row1 = vbih3(chunk11, chunk12)
        row4 = vbih3(chunk21, chunk22)
        row2 = vbiv(row1, row4)
        row3 = vbiv(row4, row1)

        write_addr = add(write_addr, 4)
        vstb(output_img, row1, write_addr)

        temp = add(write_addr, offset)
        vstb(output_img, row2, temp)

        temp = add(temp, offset)
        vstb(output_img, row3, temp)

        temp = add(temp, offset)
        vstb(output_img, row4, temp)
        # -------------------------------------------------------
        column = add(column, 4)
        read_addr = add(read_addr, 4)
        write_addr = add(write_addr, 4)

        if column >= div_width:  #
            read_addr = sub(read_addr, column)
            read_addr = add(read_addr, img_width)
            write_addr = add(write_addr, offset)
            write_addr = add(write_addr, offset)
            write_addr = sub(write_addr, 2)
            row = add(row, 1)
            column = add(0, 0)
    return output_img[0:size]


def main():
    mode = 0
    if mode == 1:
        output_img = [0] * div_width * div_height * 4
        nearest_neighbours(input_image.flatten(), output_img)
        output_image = numpy.array(output_img, dtype=numpy.uint8)
        output_image.shape = (2 * div_height, 2 * div_width)
    else:
        output_img = [0] * (3 * div_width - 2) * (3 * div_height - 2)
        output_img = bilinear(input_image.flatten(), output_img)
        output_image = numpy.array(output_img, dtype=numpy.uint8)
        output_image.shape = (3 * div_height - 2, 3 * div_width - 2)
    cv2.imshow("Other", output_image)
    cv2.imshow("INPUT", input_image)
    cv2.waitKey()


if __name__ == "__main__":
    main()
