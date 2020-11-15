def sll(r1, r2):
    r3 = r1
    for x in range(r2):
        r3 = r3 // 2
    return r3


def sub(r1, r2):
    return r1 - r2


def add(r1, r2):
    return r1 + r2


def mult(r1, r2):
    return r1 * r2


def vldb(img, vr1):
    return img[vr1:vr1 + 2]  # READ 2 bytes


def vmni(vr1):
    return [vr1[0], vr1[0], vr1[1], vr1[1]]  # Bit extension


def vstw(output_img, vr1, vr2):  # Must be able to store misaligned vectors
    output_img[vr2:vr2 + 4] = vr1


def vbi(vr1, vr2):
    return [(vr1[0] * 2 / 3 + vr2[0] / 3) // 1, (vr1[1] * 2 / 3 + vr2[1] / 3) // 1,
            (vr1[2] * 2 / 3 + vr2[2] / 3) // 1, (vr1[3] * 2 / 3 + vr2[3] / 3) // 1]


def sbi(vr1):
    return [vr1[0], (vr1[0] * 2 / 3 + vr1[1] / 3) // 1, (vr1[1] * 2 / 3 + vr1[0] / 3) // 1, vr1[1]]